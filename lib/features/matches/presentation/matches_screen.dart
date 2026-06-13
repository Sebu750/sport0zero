import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/providers/app_providers.dart';
import '../domain/models/match_model.dart';

class MatchesScreen extends ConsumerWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileMatches(ref),
        desktop: _buildDesktopMatches(ref),
      ),
    );
  }

  Widget _buildMobileMatches(WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Today'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Results'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _matchesListAsync(ref.watch(todayMatchesProvider)),
                _matchesListAsync(ref.watch(upcomingMatchesProvider)),
                _matchesListAsync(ref.watch(completedMatchesProvider)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopMatches(WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _filterTile(ref, 'Today', todayMatchesProvider, isSelected: true),
              _filterTile(ref, 'Upcoming', upcomingMatchesProvider),
              _filterTile(ref, 'Results', completedMatchesProvider),
              const Divider(),
              const ListTile(
                title: Text('All Leagues'),
                leading: Icon(Icons.emoji_events_outlined),
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: _matchesListAsync(ref.watch(todayMatchesProvider)),
        ),
      ],
    );
  }

  Widget _filterTile(WidgetRef ref, String label, FutureProvider provider,
      {bool isSelected = false}) {
    return ListTile(
      title: Text(label),
      selected: isSelected,
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {},
    );
  }

  Widget _matchesListAsync(AsyncValue<List<MatchModel>> asyncValue) {
    return asyncValue.when(
      loading: () => _shimmerList(),
      error: (e, _) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 32),
            const SizedBox(height: 8),
            Text('Failed to load matches\n$e',
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
      data: (matches) {
        if (matches.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sports_cricket, size: 48,
                    color: AppColors.textSecondary),
                SizedBox(height: 12),
                Text('No matches to show',
                    style: TextStyle(
                        color: AppColors.textSecondary, fontSize: 15)),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {},
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: matches.length,
            itemBuilder: (_, i) => _matchCard(matches[i]),
          ),
        );
      },
    );
  }

  Widget _matchCard(MatchModel match) {
    final dateFmt = DateFormat('EEE, d MMM yyyy • h:mm a');
    final isLive = match.status == MatchStatus.live;
    final isCompleted = match.status == MatchStatus.completed;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date + status row
              Row(
                children: [
                  Text(dateFmt.format(match.datetime.toLocal()),
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.textSecondary)),
                  const Spacer(),
                  if (isLive)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.live.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle, size: 7, color: AppColors.live),
                          SizedBox(width: 4),
                          Text('LIVE',
                              style: TextStyle(
                                  color: AppColors.live,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  else if (isCompleted)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('FT',
                          style: TextStyle(
                              color: AppColors.success,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // Teams row
              Row(
                children: [
                  Expanded(
                    child: _teamColumn(
                      match.teamAName ?? 'Team A',
                      match.teamAScore,
                      isWinner: isCompleted && match.winnerId == match.teamAId,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text('vs',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _teamColumn(
                      match.teamBName ?? 'Team B',
                      match.teamBScore,
                      isWinner: isCompleted && match.winnerId == match.teamBId,
                      align: CrossAxisAlignment.end,
                    ),
                  ),
                ],
              ),
              // Result summary
              if (match.resultSummary != null) ...[
                const Divider(height: 20),
                Text(match.resultSummary!,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textSecondary),
                    textAlign: TextAlign.center),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _teamColumn(String name, int? score,
      {bool isWinner = false,
      CrossAxisAlignment align = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(name,
            style: TextStyle(
              fontWeight: isWinner ? FontWeight.bold : FontWeight.w500,
              color: isWinner ? AppColors.primary : null,
            )),
        if (score != null)
          Text('$score',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isWinner ? AppColors.primary : null,
              )),
      ],
    );
  }

  Widget _shimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (_, _) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(height: 10, width: 80, color: Colors.white),
                    const Spacer(),
                    Container(height: 10, width: 50, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child:
                            Container(height: 20, color: Colors.white)),
                    const SizedBox(width: 16),
                    Expanded(
                        child:
                            Container(height: 20, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
