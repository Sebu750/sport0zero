import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

/// Admin-role dashboard: platform stats, user counts, content flags, recent activity.
class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(adminStatsProvider);
    final user = ref.watch(currentUserProvider);
    final growth = ref.watch(userGrowthProvider);
    final activity = ref.watch(platformActivityProvider);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(user?.displayName ?? 'Admin'),
            const SizedBox(height: 24),
            _buildStatCards(stats, width),
            const SizedBox(height: 32),
            width >= 900
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildUserGrowth(growth),
                            const SizedBox(height: 28),
                            _buildQuickActions(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(child: _buildPlatformActivity(activity)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserGrowth(growth),
                      const SizedBox(height: 28),
                      _buildPlatformActivity(activity),
                      const SizedBox(height: 28),
                      _buildQuickActions(),
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
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFB71C1C), Color(0xFF880E4F)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.error.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Admin Console', style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.7))),
            const SizedBox(height: 4),
            Text(name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
              child: const Text('Admin', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ]),
          Container(width: 48, height: 48, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle), child: const Icon(Icons.admin_panel_settings, color: Colors.white, size: 24)),
        ],
      ),
    );
  }

  Widget _buildStatCards(AdminDashboardStats stats, double width) {
    final cardWidth = width >= 900 ? (width - 240 - 96) / 4 : (width - 64) / 2;
    return Wrap(spacing: 16, runSpacing: 12, children: [
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.people, label: 'Total Users', value: '${stats.totalUsers}', color: AppColors.primary)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.check_circle, label: 'Active Today', value: '${stats.activeToday}', color: AppColors.success)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.emoji_events, label: 'Tournaments', value: '${stats.totalTournaments}', color: Colors.purple.shade600)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.flag, label: 'Flagged Content', value: '${stats.flaggedContent}', color: AppColors.error)),
    ]);
  }

  Widget _buildUserGrowth(List<UserGrowthEntry> growth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'User Growth', actionLabel: 'Full Report', onAction: () {}),
        Card(child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: growth.map((g) {
            final maxCount = growth.last.count;
            final pct = g.count / maxCount;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(children: [
                SizedBox(width: 36, child: Text(g.month, style: const TextStyle(fontSize: 12))),
                const SizedBox(width: 8),
                Expanded(child: Container(
                  height: 18,
                  decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(4)),
                  child: FractionallySizedBox(
                    widthFactor: pct,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [AppColors.primary, AppColors.accent]),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 10),
                SizedBox(width: 40, child: Text('${g.count}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
              ]),
            );
          }).toList()),
        )),
      ],
    );
  }

  Widget _buildPlatformActivity(List<PlatformActivityItem> activity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Platform Activity', actionLabel: 'View All', onAction: () {}),
        Card(child: Column(children: activity.map((a) {
          final iconData = switch (a.event) {
            'New user registered' => Icons.person_add,
            'Tournament created' => Icons.emoji_events,
            'Content flagged' => Icons.flag,
            'Team registered' => Icons.groups,
            _ => Icons.info_outline,
          };
          final diff = DateTime.now().difference(a.time);
          final timeStr = diff.inMinutes < 60 ? '${diff.inMinutes}m ago' : diff.inHours < 24 ? '${diff.inHours}h ago' : '${diff.inDays}d ago';
          return Column(children: [
            ListTile(
              dense: true,
              leading: Container(width: 32, height: 32, decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)), child: Icon(iconData, size: 16, color: AppColors.primary)),
              title: Text(a.event, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
              subtitle: Text(a.detail, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              trailing: Text(timeStr, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
            ),
            if (a != activity.last) const Divider(height: 1, indent: 60),
          ]);
        }).toList())),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Quick Actions', actionLabel: '', onAction: () {}),
        Wrap(spacing: 12, runSpacing: 12, children: [
          _actionBtn('Manage Users', Icons.people, AppColors.primary, '/admin-users'),
          _actionBtn('View Analytics', Icons.bar_chart, Colors.purple.shade600, '/admin-analytics'),
          _actionBtn('Review Flags', Icons.flag, AppColors.error, '/admin-content'),
          _actionBtn('System Settings', Icons.settings, AppColors.textSecondary, '/settings'),
        ]),
      ],
    );
  }

  Widget _actionBtn(String label, IconData icon, Color color, String route) {
    return Builder(builder: (ctx) => SizedBox(
      width: 140,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => ctx.go(route),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(height: 8),
                Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
