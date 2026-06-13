import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(playerStatsProvider);
    final battingTrend = ref.watch(battingTrendProvider);
    final bowlingTrend = ref.watch(bowlingTrendProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Analytics'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Player Stats'),
              Tab(text: 'Team Stats'),
              Tab(text: 'Trends'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPlayerStatsTab(stats),
            _buildTeamStatsTab(),
            _buildTrendsTab(battingTrend, bowlingTrend),
          ],
        ),
      ),
    );
  }

  // ── Player Stats ──────────────────────────────────────────────────────────────
  Widget _buildPlayerStatsTab(dynamic stats) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Format badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text('T20 Format',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary)),
          ),
          const SizedBox(height: 16),

          // Batting section
          _sectionAnchor('Batting'),
          const SizedBox(height: 8),
          _buildStatsGrid([
            ('Matches', '${stats.matches}'),
            ('Innings', '${stats.innings}'),
            ('Runs', '${stats.runs}'),
            ('Average', '${stats.average}'),
            ('Strike Rate', '${stats.strikeRate}'),
            ('High Score', '${stats.highScore}'),
            ('50s', '${stats.fifties}'),
            ('100s', '${stats.hundreds}'),
            ('4s', '${stats.fours}'),
            ('6s', '${stats.sixes}'),
            ('Not Outs', '${stats.notOuts}'),
          ]),
          const SizedBox(height: 24),

          // Bowling section
          _sectionAnchor('Bowling'),
          const SizedBox(height: 8),
          _buildStatsGrid([
            ('Wickets', '${stats.wickets}'),
            ('Economy', '${stats.economy}'),
            ('Bowling Avg', '${stats.bowlingAverage}'),
            ('Best', '${stats.bestBowlingWickets}/${stats.bestBowlingRuns}'),
            ('Maidens', '${stats.maidens}'),
            ('Bowl SR', '${stats.bowlingStrikeRate}'),
          ]),
          const SizedBox(height: 24),

          // Fielding section
          _sectionAnchor('Fielding'),
          const SizedBox(height: 8),
          _buildStatsGrid([
            ('Catches', '${stats.catches}'),
            ('Stumpings', '${stats.stumpings}'),
            ('Run Outs', '${stats.runOuts}'),
          ]),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(List<(String, String)> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        return SizedBox(
          width: 110,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.$2,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(item.$1,
                      style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ── Team Stats ────────────────────────────────────────────────────────────────
  Widget _buildTeamStatsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Lahore Strikers — Season Overview',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildStatsGrid([
            ('Win Rate', '72%'),
            ('Avg Score', '168'),
            ('Best Score', '212/4'),
            ('Run Rate', '8.4'),
            ('Matches', '18'),
            ('Won', '13'),
          ]),
          const SizedBox(height: 24),
          const Text('Head-to-Head',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
          const SizedBox(height: 8),
          _buildH2HCard('Karachi Kings', 5, 3, 2),
          const SizedBox(height: 8),
          _buildH2HCard('Islamabad United', 4, 3, 1),
        ],
      ),
    );
  }

  Widget _buildH2HCard(String team, int played, int won, int lost) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: AppColors.success, width: 4),
            right: BorderSide(color: AppColors.error, width: 4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Expanded(
                child: Text('vs $team', style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              _h2hStat('$played', 'Played'),
              const SizedBox(width: 16),
              _h2hStat('$won', 'Won', color: AppColors.success),
              const SizedBox(width: 16),
              _h2hStat('$lost', 'Lost', color: AppColors.error),
            ],
          ),
        ),
      ),
    );
  }

  Widget _h2hStat(String value, String label, {Color? color}) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
      ],
    );
  }

  // ── Trends ────────────────────────────────────────────────────────────────────
  Widget _buildTrendsTab(List<TrendPoint> batting, List<TrendPoint> bowling) {
    final maxBat = batting.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    final maxBowl = bowling.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionAnchor('Batting Performance (Runs)'),
          const SizedBox(height: 12),
          _buildBarChart(batting, maxBat, AppColors.primary),
          const SizedBox(height: 32),
          _sectionAnchor('Bowling Economy'),
          const SizedBox(height: 12),
          _buildBarChart(bowling, maxBowl, AppColors.accent),
        ],
      ),
    );
  }

  Widget _buildBarChart(List<TrendPoint> data, double maxVal, Color color) {
    return SizedBox(
      height: 160,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: data.map((point) {
          final pct = maxVal > 0 ? point.value / maxVal : 0.0;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Value pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('${point.value}',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color)),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: pct * 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [color.withValues(alpha: 0.4), color],
                      ),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(point.label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _sectionAnchor(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 4, height: 16,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
