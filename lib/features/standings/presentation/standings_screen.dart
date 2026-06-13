import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/providers/app_providers.dart';
import '../domain/standings_model.dart';

class StandingsScreen extends ConsumerWidget {
  const StandingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final standingsAsync = ref.watch(standingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Standings'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sports_soccer),
            onSelected: (value) {},
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'cricket', child: Text('Cricket')),
              const PopupMenuItem(value: 'football', child: Text('Football')),
              const PopupMenuItem(value: 'basketball', child: Text('Basketball')),
            ],
          ),
        ],
      ),
      body: standingsAsync.when(
        loading: () => _shimmerTable(),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 32),
              const SizedBox(height: 8),
              Text('Failed to load standings\n$e',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.textSecondary)),
            ],
          ),
        ),
        data: (data) => _buildStandingsTable(context, data),
      ),
    );
  }

  Widget _buildStandingsTable(BuildContext context, TournamentStandings data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tournament header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.emoji_events,
                    color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.tournamentName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text('${data.standings.length} teams',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        // Table header
        Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              const SizedBox(width: 28),
              const Expanded(flex: 3, child: Text('Team',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary))),
              _headerCell('P'),
              _headerCell('W'),
              _headerCell('L'),
              _headerCell('NR'),
              _headerCell('Pts'),
              _headerCell('NRR'),
            ],
          ),
        ),
        const Divider(height: 1),
        // Rows
        Expanded(
          child: ListView.builder(
            itemCount: data.standings.length,
            itemBuilder: (_, i) => _standingsRow(data.standings[i], i),
          ),
        ),
      ],
    );
  }

  Widget _standingsRow(StandingsEntry entry, int index) {
    final isPlayoff = index < 4; // top 4 qualify
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.divider.withValues(alpha: 0.5)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            // Position badge
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isPlayoff
                    ? AppColors.primary.withValues(alpha: 0.15)
                    : Colors.grey.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text('${entry.position}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isPlayoff ? AppColors.primary : AppColors.textSecondary,
                    )),
              ),
            ),
            const SizedBox(width: 4),
            // Team name
            Expanded(
              flex: 3,
              child: Text(entry.teamName,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis),
            ),
            _statCell('${entry.played}'),
            _statCell('${entry.won}', bold: true),
            _statCell('${entry.lost}'),
            _statCell('${entry.noResult}'),
            _statCell('${entry.points}', bold: true, color: AppColors.primary),
            SizedBox(
              width: 44,
              child: Text(entry.nrrDisplay,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: entry.netRunRate >= 0
                        ? AppColors.success
                        : AppColors.error,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCell(String label) {
    return SizedBox(
      width: 36,
      child: Text(label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary)),
    );
  }

  Widget _statCell(String value, {bool bold = false, Color? color}) {
    return SizedBox(
      width: 36,
      child: Text(value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            color: color,
          )),
    );
  }

  Widget _shimmerTable() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: List.generate(
            6,
            (_) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
