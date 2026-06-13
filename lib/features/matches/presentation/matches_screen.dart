import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/status_chip.dart';
import '../../../shared/providers/app_providers.dart';
import '../domain/models/match_model.dart';

class MatchesScreen extends ConsumerWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Matches'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Live'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _matchesListAsync(ref.watch(upcomingMatchesProvider)),
            _matchesListAsync(ref.watch(liveMatchesProvider)),
            _matchesListAsync(ref.watch(completedMatchesProvider)),
          ],
        ),
      ),
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
    final dateFmt = DateFormat('EEE, d MMM yyyy \u2022 h:mm a');
    final isLive = match.status == MatchStatus.live;
    final isCompleted = match.status == MatchStatus.completed;
    final statusType = isLive
        ? StatusType.live
        : isCompleted
            ? StatusType.completed
            : StatusType.upcoming;
  
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: AppColors.primary, width: 4)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: AppColors.primary.withValues(alpha: 0.04),
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
                    if (isLive) ...[
                      Container(
                        width: 8, height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.live,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: AppColors.live.withValues(alpha: 0.4), blurRadius: 4)],
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    StatusChip(status: statusType),
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
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.accent, AppColors.accentDark],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.25),
                              blurRadius: 8, offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text('vs',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ),
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
      ),
    );
  }

  Widget _teamColumn(String name, int? score,
      {bool isWinner = false,
      CrossAxisAlignment align = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          decoration: isWinner
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.accent,
                      width: 2,
                    ),
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(name,
                style: TextStyle(
                  fontWeight: isWinner ? FontWeight.w700 : FontWeight.w500,
                  color: isWinner ? AppColors.accent : null,
                  fontSize: 14,
                )),
          ),
        ),
        if (score != null)
          Text('$score',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: isWinner ? AppColors.accent : AppColors.textPrimary,
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
