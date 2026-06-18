import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_chip.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

/// Player-role dashboard: personal stats, upcoming matches, recent form, team invites.
class PlayerDashboard extends ConsumerWidget {
  const PlayerDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(dashboardStatsProvider);
    final user = ref.watch(currentUserProvider);
    final upcomingMatches = ref.watch(mockUpcomingMatchesProvider);
    final activities = ref.watch(recentActivityProvider);
    final notifications = ref.watch(notificationsProvider);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeHeader(user?.displayName ?? 'Player', notifications),
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
                            _buildUpcomingMatches(upcomingMatches),
                            const SizedBox(height: 32),
                            _buildRecentActivity(activities),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(child: _buildNotifications(notifications)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUpcomingMatches(upcomingMatches),
                      const SizedBox(height: 32),
                      _buildRecentActivity(activities),
                      const SizedBox(height: 32),
                      _buildNotifications(notifications),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(String name, List<NotificationItem> notifications) {
    final unreadCount = notifications.where((n) => !n.read).length;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(right: -10, top: -10, child: Icon(Icons.sports_cricket, size: 120, color: Colors.white.withValues(alpha: 0.06))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back,', style: TextStyle(fontSize: 14, color: Colors.white.withValues(alpha: 0.7))),
                  const SizedBox(height: 4),
                  Text(name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                    child: const Text('Player', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(width: 44, height: 44, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle), child: const Icon(Icons.notifications_outlined, color: Colors.white)),
                  if (unreadCount > 0)
                    Positioned(right: 2, top: 2, child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
                      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                      child: Text('$unreadCount', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCards(DashboardStats stats, double width) {
    final cardWidth = width >= 900 ? (width - 240 - 96) / 4 : (width - 64) / 2;
    return Wrap(spacing: 16, runSpacing: 12, children: [
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.groups, label: 'My Teams', value: '${stats.teamCount}', color: AppColors.primary)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.sports_cricket, label: 'Upcoming Matches', value: '${stats.upcomingMatchCount}', color: AppColors.accent)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.emoji_events, label: 'Active Tournaments', value: '${stats.activeTournamentCount}', color: Colors.purple.shade600)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.star, label: 'Player Rating', value: '${stats.playerRating}', color: AppColors.success)),
    ]);
  }

  Widget _buildUpcomingMatches(List<dynamic> matches) {
    final dateFmt = DateFormat('EEE, d MMM · h:mm a');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Upcoming Matches', actionLabel: 'See All', onAction: () {}),
        SizedBox(height: 140, child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: matches.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, i) {
            final match = matches[i];
            return SizedBox(width: 240, child: Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(dateFmt.format(match.datetime.toLocal()), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                const SizedBox(height: 12),
                Text(match.teamAName ?? 'Team A', style: const TextStyle(fontWeight: FontWeight.w600)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Text('vs', style: TextStyle(color: AppColors.textSecondary, fontSize: 11))),
                Text(match.teamBName ?? 'Team B', style: const TextStyle(fontWeight: FontWeight.w600)),
                const Spacer(),
                StatusChip(status: StatusType.upcoming),
              ]),
            )));
          },
        )),
      ],
    );
  }

  Widget _buildRecentActivity(List<ActivityItem> activities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Recent Activity', actionLabel: 'See All', onAction: () {}),
        Card(child: Column(children: activities.map((a) {
          final iconData = switch (a.icon) {
            'groups' => Icons.groups, 'emoji_events' => Icons.emoji_events,
            'event' => Icons.event, 'star' => Icons.star,
            'add_circle' => Icons.add_circle_outline, _ => Icons.circle,
          };
          return Column(children: [
            ListTile(
              leading: Container(width: 36, height: 36, decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(8)), child: Icon(iconData, size: 18, color: AppColors.primary)),
              title: Text(a.title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              subtitle: Text(a.subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              trailing: Text(_timeAgo(a.time), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ),
            if (a != activities.last) const Divider(height: 1, indent: 68),
          ]);
        }).toList())),
      ],
    );
  }

  Widget _buildNotifications(List<NotificationItem> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Notifications', actionLabel: 'Mark all read', onAction: () {}),
        Card(child: Column(children: notifications.map((n) {
          final iconData = switch (n.type) {
            'match' => Icons.sports_cricket, 'team' => Icons.groups,
            'tournament' => Icons.emoji_events, _ => Icons.info_outline,
          };
          return Column(children: [
            ListTile(
              dense: true,
              leading: Container(width: 32, height: 32, decoration: BoxDecoration(color: n.read ? AppColors.divider : AppColors.accent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)), child: Icon(iconData, size: 16, color: n.read ? AppColors.textSecondary : AppColors.accent)),
              title: Text(n.title, style: TextStyle(fontSize: 13, fontWeight: n.read ? FontWeight.w400 : FontWeight.w600)),
              subtitle: Text(n.message, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: Text(_timeAgo(n.time), style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
            ),
            if (n != notifications.last) const Divider(height: 1, indent: 60),
          ]);
        }).toList())),
      ],
    );
  }

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return DateFormat('d MMM').format(time);
  }

  Widget _buildQuickActions(BuildContext context, double width) {
    final actions = [
      ('Join Match', Icons.sports_cricket, AppColors.primary, '/matches'),
      ('View Teams', Icons.groups, AppColors.accent, '/teams'),
      ('Edit Profile', Icons.edit, Colors.purple.shade600, '/edit-profile'),
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
