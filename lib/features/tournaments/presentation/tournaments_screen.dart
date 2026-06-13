import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_chip.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

class TournamentsScreen extends ConsumerWidget {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournaments = ref.watch(myTournamentsProvider);
    final registrations = ref.watch(tournamentRegistrationsProvider);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Tournaments'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'My Tournaments'),
              Tab(text: 'Registrations'),
              Tab(text: 'Fixtures'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMyTournamentsTab(tournaments),
            _buildRegistrationsTab(registrations),
            _buildFixturesTab(ref),
            _buildResultsTab(ref),
          ],
        ),
      ),
    );
  }

  // ── My Tournaments ────────────────────────────────────────────────────────────
  Widget _buildMyTournamentsTab(List<dynamic> tournaments) {
    if (tournaments.isEmpty) {
      return const EmptyState(
        icon: Icons.emoji_events,
        title: 'No tournaments',
        subtitle: 'Register for a tournament or create your own',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tournaments.length,
      itemBuilder: (context, i) {
        final t = tournaments[i];
        final statusType = switch (t.status.name) {
          'ongoing' => StatusType.ongoing,
          'upcoming' => StatusType.upcoming,
          'completed' => StatusType.completed,
          'cancelled' => StatusType.cancelled,
          _ => StatusType.upcoming,
        };
        final formatLabel = switch (t.format.name) {
          'league' => 'League',
          'knockout' => 'Knockout',
          'roundRobin' => 'Round Robin',
          'groupStage' => 'Group Stage',
          _ => 'Unknown',
        };
        final dateFmt = DateFormat('d MMM yyyy');
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: AppColors.primary.withValues(alpha: 0.04),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.primaryLight],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.2),
                              blurRadius: 8, offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.emoji_events, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(height: 2),
                            Text(t.description ?? '',
                                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      StatusChip(status: statusType),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _infoChip(Icons.format_list_bulleted, formatLabel),
                      const SizedBox(width: 12),
                      _infoChip(Icons.groups, '${t.teamIds.length} teams'),
                      const SizedBox(width: 12),
                      if (t.startDate != null)
                        _infoChip(Icons.calendar_today,
                            '${dateFmt.format(t.startDate)} - ${dateFmt.format(t.endDate ?? t.startDate)}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // ── Registrations (organizer view) ────────────────────────────────────────────
  Widget _buildRegistrationsTab(List<TournamentRegistration> registrations) {
    if (registrations.isEmpty) {
      return const EmptyState(
        icon: Icons.how_to_reg,
        title: 'No registrations',
        subtitle: 'Team registration requests will appear here',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: registrations.length,
      itemBuilder: (context, i) {
        final reg = registrations[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: reg.status == 'pending'
                  ? AppColors.warning.withValues(alpha: 0.1)
                  : AppColors.success.withValues(alpha: 0.1),
              child: Icon(
                Icons.groups,
                color: reg.status == 'pending' ? AppColors.warning : AppColors.success,
              ),
            ),
            title: Text(reg.teamName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: Text('Captain: ${reg.captainName}',
                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            trailing: reg.status == 'pending'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check_circle, color: AppColors.success, size: 22),
                        onPressed: () {},
                        tooltip: 'Approve',
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel_outlined, color: AppColors.error, size: 22),
                        onPressed: () {},
                        tooltip: 'Reject',
                      ),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text('APPROVED',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.success)),
                  ),
          ),
        );
      },
    );
  }

  // ── Fixtures ──────────────────────────────────────────────────────────────────
  Widget _buildFixturesTab(WidgetRef ref) {
    final matches = ref.watch(mockUpcomingMatchesProvider);
    if (matches.isEmpty) {
      return const EmptyState(
        icon: Icons.calendar_month,
        title: 'No fixtures',
        subtitle: 'Upcoming match fixtures will appear here',
      );
    }
    final dateFmt = DateFormat('EEE, d MMM yyyy · h:mm a');
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: matches.length,
      itemBuilder: (context, i) {
        final m = matches[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(dateFmt.format(m.datetime.toLocal()),
                    style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(m.teamAName ?? 'Team A',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('vs', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    ),
                    Expanded(
                      child: Text(m.teamBName ?? 'Team B',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── Results ───────────────────────────────────────────────────────────────────
  Widget _buildResultsTab(WidgetRef ref) {
    final matches = ref.watch(mockCompletedMatchesProvider);
    if (matches.isEmpty) {
      return const EmptyState(
        icon: Icons.scoreboard,
        title: 'No results yet',
        subtitle: 'Completed match results will appear here',
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: matches.length,
      itemBuilder: (context, i) {
        final m = matches[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(m.teamAName ?? 'Team A',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: m.winnerId == m.teamAId ? AppColors.primary : null,
                              )),
                          const SizedBox(height: 4),
                          Text('${m.teamAScore ?? 0}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: m.winnerId == m.teamAId ? AppColors.primary : null,
                              )),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('—', style: TextStyle(color: AppColors.textSecondary)),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(m.teamBName ?? 'Team B',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: m.winnerId == m.teamBId ? AppColors.primary : null,
                              )),
                          const SizedBox(height: 4),
                          Text('${m.teamBScore ?? 0}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: m.winnerId == m.teamBId ? AppColors.primary : null,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                StatusChip(status: StatusType.completed, label: m.resultSummary ?? 'Completed'),
              ],
            ),
          ),
        );
      },
    );
  }
}
