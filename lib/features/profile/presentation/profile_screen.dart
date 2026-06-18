import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../shared/providers/app_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final stats = ref.watch(playerStatsProvider);
    final achievements = ref.watch(achievementsProvider);
    final completedMatches = ref.watch(mockCompletedMatchesProvider);
    final width = MediaQuery.of(context).size.width;

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero gradient header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryLight],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    blurRadius: 20, offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Avatar with white ring
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: (user.photoUrl != null && user.photoUrl!.isNotEmpty)
                          ? ClipOval(
                              child: Image.network(user.photoUrl!,
                                  width: 72, height: 72, fit: BoxFit.cover),
                            )
                          : const Icon(Icons.person, size: 36, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.displayName ?? 'Guest User',
                          style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800,
                            color: Colors.white, letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Role badges with semi-transparent white bg
                        Wrap(
                          spacing: 6, runSpacing: 4,
                          children: user.roles.map((role) {
                            final label = switch (role) {
                              _ => role.name.toUpperCase(),
                            };
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(label,
                                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700,
                                      color: Colors.white, letterSpacing: 0.5)),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                        if (user.verified)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.verified, size: 13, color: AppColors.success),
                                const SizedBox(width: 4),
                                Text('CNIC Verified',
                                    style: TextStyle(fontSize: 10, color: AppColors.success,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Edit button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 18, color: Colors.white),
                      onPressed: () => context.go('/edit-profile'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Personal Info
            SectionHeader(title: 'Personal Information'),
            Card(
              child: Column(
                children: [
                  _infoRow(Icons.phone, 'Phone', user.phone),
                  const Divider(height: 1, indent: 52),
                  _infoRow(Icons.email_outlined, 'Email', user.email ?? 'Not set'),
                  const Divider(height: 1, indent: 52),
                  _infoRow(Icons.calendar_today, 'Member Since',
                      DateFormat('MMM yyyy').format(user.createdAt)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Career Stats
            SectionHeader(title: 'Career Statistics'),
            Builder(builder: (_) {
              final statEntries = [
                (Icons.sports_cricket, 'Matches', '${stats.matches}', AppColors.primary, stats.matches.toDouble()),
                (Icons.flag, 'Runs', '${stats.runs}', AppColors.accent, stats.runs.toDouble()),
                (Icons.star, 'Average', '${stats.average}', Colors.purple.shade600, stats.average.toDouble()),
                (Icons.bolt, 'Strike Rate', '${stats.strikeRate}', AppColors.success, stats.strikeRate.toDouble()),
                (Icons.whatshot, 'Wickets', '${stats.wickets}', AppColors.warning, stats.wickets.toDouble()),
                (Icons.shield, 'Catches', '${stats.catches}', AppColors.primary, stats.catches.toDouble()),
              ];
              final maxVal = statEntries.map((e) => e.$5).reduce((a, b) => a > b ? a : b);
              return Wrap(
                spacing: 8, runSpacing: 8,
                children: statEntries.map((e) {
                  final isBest = e.$5 == maxVal && maxVal > 0;
                  return SizedBox(
                    width: width >= 900 ? 130 : (width - 80) / 3,
                    child: isBest
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.accent.withValues(alpha: 0.3), width: 1.5),
                            ),
                            child: StatCard(icon: e.$1, label: e.$2, value: e.$3, color: e.$4),
                          )
                        : StatCard(icon: e.$1, label: e.$2, value: e.$3, color: e.$4),
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 24),

            // Achievements
            SectionHeader(title: 'Achievements', actionLabel: 'See All', onAction: () {}),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: achievements.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final ach = achievements[i];
                  final iconData = switch (ach.iconKey) {
                    'star' => Icons.star,
                    'emoji_events' => Icons.emoji_events,
                    'whatshot' => Icons.whatshot,
                    'shield' => Icons.shield,
                    _ => Icons.emoji_events,
                  };
                  return SizedBox(
                    width: 150,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 36, height: 36,
                              decoration: BoxDecoration(
                                color: AppColors.accent.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(iconData, color: AppColors.accent, size: 20),
                            ),
                            const SizedBox(height: 8),
                            Text(ach.title,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 2),
                            Text(DateFormat('MMM yyyy').format(ach.earnedAt),
                                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Match History
            SectionHeader(title: 'Recent Matches', actionLabel: 'See All', onAction: () {}),
            Card(
              child: Column(
                children: completedMatches.take(3).map((m) {
                  final isWin = m.winnerId == 'team_001'; // mock user's team
                  return Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 36, height: 36,
                          decoration: BoxDecoration(
                            color: isWin
                                ? AppColors.success.withValues(alpha: 0.1)
                                : AppColors.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            isWin ? Icons.check : Icons.close,
                            color: isWin ? AppColors.success : AppColors.error,
                            size: 18,
                          ),
                        ),
                        title: Text(
                          '${m.teamAName} vs ${m.teamBName}',
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        subtitle: Text(m.resultSummary ?? '',
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        trailing: Text(
                          DateFormat('d MMM').format(m.datetime),
                          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                        ),
                      ),
                      if (m != completedMatches.last) const Divider(height: 1, indent: 68),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary, size: 20),
      title: Text(label, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
      trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
    );
  }
}
