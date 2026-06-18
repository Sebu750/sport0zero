import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

/// Manager-role dashboard: team roster, upcoming fixtures, player availability, team performance.
class ManagerDashboard extends ConsumerWidget {
  const ManagerDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(managerStatsProvider);
    final user = ref.watch(currentUserProvider);
    final upcomingMatches = ref.watch(mockUpcomingMatchesProvider);
    final availability = ref.watch(playerAvailabilityProvider);
    final performance = ref.watch(teamPerformanceProvider);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(user?.displayName ?? 'Manager'),
            const SizedBox(height: 24),
            _buildStatCards(stats, width),
            const SizedBox(height: 20),
            _buildQuickActions(context, width),
            const SizedBox(height: 28),
            width >= 900
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildUpcomingFixtures(upcomingMatches),
                            const SizedBox(height: 28),
                            _buildTeamPerformance(performance),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(child: _buildPlayerAvailability(availability)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUpcomingFixtures(upcomingMatches),
                      const SizedBox(height: 28),
                      _buildPlayerAvailability(availability),
                      const SizedBox(height: 28),
                      _buildTeamPerformance(performance),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String name) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.accent, Color(0xFFE65100)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.accent.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Manager Dashboard', style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.7))),
            const SizedBox(height: 4),
            Text(name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
              child: const Text('Manager', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ]),
          Container(width: 48, height: 48, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle), child: const Icon(Icons.manage_accounts, color: Colors.white, size: 24)),
        ],
      ),
    );
  }

  Widget _buildStatCards(ManagerDashboardStats stats, double width) {
    final cardWidth = width >= 900 ? (width - 240 - 96) / 4 : (width - 64) / 2;
    return Wrap(spacing: 16, runSpacing: 12, children: [
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.groups, label: 'Teams Managed', value: '${stats.teamsManaged}', color: AppColors.primary)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.people, label: 'Total Players', value: '${stats.totalPlayers}', color: AppColors.accent)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.calendar_today, label: 'Upcoming Fixtures', value: '${stats.upcomingFixtures}', color: Colors.purple.shade600)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.pending_actions, label: 'Pending Requests', value: '${stats.pendingRequests}', color: AppColors.success)),
    ]);
  }

  Widget _buildUpcomingFixtures(List<dynamic> matches) {
    final dateFmt = DateFormat('EEE, d MMM · h:mm a');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Upcoming Fixtures', actionLabel: 'Manage', onAction: () {}),
        SizedBox(height: 140, child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: matches.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, i) {
            final m = matches[i];
            return SizedBox(width: 240, child: Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(dateFmt.format(m.datetime.toLocal()), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                const SizedBox(height: 12),
                Text(m.teamAName ?? '', style: const TextStyle(fontWeight: FontWeight.w700)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Text('vs', style: TextStyle(color: AppColors.textSecondary, fontSize: 11))),
                Text(m.teamBName ?? '', style: const TextStyle(fontWeight: FontWeight.w700)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                  child: const Text('Scheduled', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary)),
                ),
              ]),
            )));
          },
        )),
      ],
    );
  }

  Widget _buildPlayerAvailability(List<PlayerAvailability> players) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Player Availability', actionLabel: 'View All', onAction: () {}),
        Card(child: Column(children: players.map((p) {
          return Column(children: [
            ListTile(
              dense: true,
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                child: Text(p.name[0], style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
              subtitle: Text(p.role, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: (p.available ? AppColors.success : AppColors.error).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(p.available ? 'Fit' : 'Injured', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: p.available ? AppColors.success : AppColors.error)),
              ),
            ),
            if (p != players.last) const Divider(height: 1, indent: 60),
          ]);
        }).toList())),
      ],
    );
  }

  Widget _buildTeamPerformance(List<TeamPerformance> teams) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Team Performance', actionLabel: 'Details', onAction: () {}),
        Card(child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: teams.map((t) {
            final total = t.wins + t.losses + t.draws;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.teamName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 8),
                Row(children: [
                  _perfChip('W', '${t.wins}', AppColors.success),
                  const SizedBox(width: 8),
                  _perfChip('L', '${t.losses}', AppColors.error),
                  const SizedBox(width: 8),
                  _perfChip('D', '${t.draws}', AppColors.textSecondary),
                  const Spacer(),
                  Text('${((t.wins / total) * 100).round()}% win rate', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success)),
                ]),
              ]),
            );
          }).toList()),
        )),
      ],
    );
  }

  Widget _perfChip(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
      child: Text('$label: $value', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
    );
  }

  Widget _buildQuickActions(BuildContext context, double width) {
    final actions = [
      ('Manage Roster', Icons.people_outline, AppColors.primary, '/manage-roster'),
      ('Add Player', Icons.person_add, AppColors.accent, '/teams'),
      ('Schedule Practice', Icons.schedule, Colors.purple.shade600, '/matches'),
    ];
    return Wrap(spacing: 10, runSpacing: 10, children: actions.map((a) => SizedBox(
      width: width >= 900 ? 180 : (width - 52) / 3,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.go(a.$4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: a.$3.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: a.$3.withValues(alpha: 0.2)),
            ),
            child: Row(children: [
              Icon(a.$2, color: a.$3, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(a.$1, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: a.$3))),
              Icon(Icons.arrow_forward_ios, size: 10, color: a.$3.withValues(alpha: 0.5)),
            ]),
          ),
        ),
      ),
    )).toList());
  }
}
