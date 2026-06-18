import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

/// Organizer-role dashboard: active tournaments, registrations, fixtures, standings.
class OrganizerDashboard extends ConsumerWidget {
  const OrganizerDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(organizerStatsProvider);
    final user = ref.watch(currentUserProvider);
    final tournaments = ref.watch(myTournamentsProvider);
    final registrations = ref.watch(registrationSummaryProvider);
    final pendingRegs = ref.watch(tournamentRegistrationsProvider);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(user?.displayName ?? 'Organizer'),
            const SizedBox(height: 24),
            _buildStatCards(stats, width),
            const SizedBox(height: 20),
            _buildQuickActions(context, width),
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
                            _buildActiveTournaments(tournaments),
                            const SizedBox(height: 28),
                            _buildRegistrationSummary(registrations),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(child: _buildPendingApprovals(pendingRegs)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildActiveTournaments(tournaments),
                      const SizedBox(height: 28),
                      _buildRegistrationSummary(registrations),
                      const SizedBox(height: 28),
                      _buildPendingApprovals(pendingRegs),
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
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.purple, Color(0xFF4A148C)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.purple.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Organizer Dashboard', style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.7))),
            const SizedBox(height: 4),
            Text(name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
              child: const Text('Organizer', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ]),
          Container(width: 48, height: 48, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle), child: const Icon(Icons.emoji_events, color: Colors.white, size: 24)),
        ],
      ),
    );
  }

  Widget _buildStatCards(OrganizerDashboardStats stats, double width) {
    final cardWidth = width >= 900 ? (width - 240 - 96) / 4 : (width - 64) / 2;
    return Wrap(spacing: 16, runSpacing: 12, children: [
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.emoji_events, label: 'Active Tournaments', value: '${stats.activeTournaments}', color: Colors.purple.shade600)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.how_to_reg, label: 'Total Registrations', value: '${stats.totalRegistrations}', color: AppColors.primary)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.pending_actions, label: 'Pending Approvals', value: '${stats.pendingApprovals}', color: AppColors.accent)),
      SizedBox(width: cardWidth > 140 ? cardWidth : 140, child: StatCard(icon: Icons.calendar_today, label: 'Upcoming Fixtures', value: '${stats.upcomingFixtures}', color: AppColors.success)),
    ]);
  }

  Widget _buildActiveTournaments(List<dynamic> tournaments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Active Tournaments', actionLabel: 'Create New', onAction: () {}),
        SizedBox(height: 160, child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tournaments.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, i) {
            final t = tournaments[i];
            final statusColor = switch (t.status.toString().split('.').last) {
              'ongoing' => AppColors.success,
              'upcoming' => AppColors.accent,
              _ => AppColors.textSecondary,
            };
            return SizedBox(width: 240, child: Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Text('${t.teamIds?.length ?? 0} teams', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 4),
                Text(t.description ?? '', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary), maxLines: 2, overflow: TextOverflow.ellipsis),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                  child: Text(t.status.toString().split('.').last, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: statusColor)),
                ),
              ]),
            )));
          },
        )),
      ],
    );
  }

  Widget _buildRegistrationSummary(List<RegistrationSummary> registrations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Registration Status', actionLabel: 'View All', onAction: () {}),
        Card(child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: registrations.map((r) {
            final pct = r.registered / r.capacity;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(r.tournamentName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                const SizedBox(height: 6),
                Text('${r.registered}/${r.capacity} registered · ${r.pending} pending', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(value: pct, backgroundColor: AppColors.divider, color: AppColors.primary, minHeight: 6),
                ),
              ]),
            );
          }).toList()),
        )),
      ],
    );
  }

  Widget _buildPendingApprovals(List<TournamentRegistration> regs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Pending Approvals', actionLabel: 'Manage', onAction: () {}),
        Card(child: Column(children: regs.map((r) {
          final isPending = r.status == 'pending';
          return Column(children: [
            ListTile(
              dense: true,
              leading: Container(width: 34, height: 34, decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.groups, size: 16, color: AppColors.primary)),
              title: Text(r.teamName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              subtitle: Text(r.captainName, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              trailing: isPending
                  ? Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(icon: const Icon(Icons.check_circle_outline, size: 18, color: AppColors.success), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.cancel_outlined, size: 18, color: AppColors.error), onPressed: () {}),
                    ])
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                      child: const Text('Approved', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.success)),
                    ),
            ),
            if (r != regs.last) const Divider(height: 1, indent: 60),
          ]);
        }).toList())),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context, double width) {
    final actions = [
      ('Create Tournament', Icons.add_circle_outline, Colors.purple.shade600, '/create-tournament'),
      ('View Registrations', Icons.how_to_reg, AppColors.primary, '/manage-registrations'),
      ('Generate Fixtures', Icons.auto_fix_high, AppColors.accent, '/manage-fixtures'),
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
