import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/providers/app_providers.dart';
import '../../matches/domain/models/match_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport0Zero'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileHome(ref),
        desktop: _buildDesktopHome(ref),
      ),
    );
  }

  Widget _buildMobileHome(WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(liveMatchesProvider);
        ref.invalidate(upcomingMatchesProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _liveMatchesSection(ref),
          const SizedBox(height: 24),
          _upcomingSection(ref),
          const SizedBox(height: 24),
          _tournamentsSection(ref),
        ],
      ),
    );
  }

  Widget _buildDesktopHome(WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              _liveMatchesSection(ref),
              const SizedBox(height: 32),
              _upcomingSection(ref),
            ],
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [_tournamentsSection(ref)],
          ),
        ),
      ],
    );
  }

  Widget _liveMatchesSection(WidgetRef ref) {
    final liveAsync = ref.watch(liveMatchesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.live,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text('Live Now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        const SizedBox(height: 12),
        liveAsync.when(
          loading: () => _shimmerMatchCard(),
          error: (e, _) => _errorCard('Failed to load live matches'),
          data: (matches) {
            if (matches.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.sports_cricket, size: 40,
                            color: AppColors.textSecondary),
                        SizedBox(height: 8),
                        Text('No live matches right now',
                            style: TextStyle(color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Column(
              children: matches.map((m) => _matchCard(m, isLive: true)).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _upcomingSection(WidgetRef ref) {
    final upcomingAsync = ref.watch(upcomingMatchesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upcoming Matches',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 12),
        upcomingAsync.when(
          loading: () => SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, _) => SizedBox(
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _shimmerMatchCard(),
                ),
              ),
            ),
          ),
          error: (e, _) => _errorCard('Failed to load upcoming matches'),
          data: (matches) {
            if (matches.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: Text('No upcoming matches scheduled')),
                ),
              );
            }
            return SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matches.length,
                itemBuilder: (_, i) => SizedBox(
                  width: 240,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _upcomingCard(matches[i]),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _tournamentsSection(WidgetRef ref) {
    final tournamentsAsync = ref.watch(activeTournamentsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Active Tournaments',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 12),
        tournamentsAsync.when(
          loading: () => _shimmerMatchCard(),
          error: (e, _) => _errorCard('Failed to load tournaments'),
          data: (tournaments) {
            if (tournaments.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: Text('No active tournaments')),
                ),
              );
            }
            return Column(
              children: tournaments.map((t) {
                final tournament = t as dynamic;
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.emoji_events,
                          color: AppColors.primary),
                    ),
                    title: Text(tournament.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(tournament.description ?? ''),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  // ── Widget helpers ───────────────────────────────────────────────────────────

  Widget _matchCard(MatchModel match, {bool isLive = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (isLive)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.live.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 8, color: AppColors.live),
                      SizedBox(width: 4),
                      Text('LIVE',
                          style: TextStyle(
                              color: AppColors.live,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(match.teamAName ?? 'Team A',
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      if (match.teamAScore != null)
                        Text('${match.teamAScore}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Text('vs',
                    style:
                        TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(match.teamBName ?? 'Team B',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.end),
                      if (match.teamBScore != null)
                        Text('${match.teamBScore}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end),
                    ],
                  ),
                ),
              ],
            ),
            if (match.resultSummary != null) ...[
              const SizedBox(height: 8),
              Text(match.resultSummary!,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary),
                  textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }

  Widget _upcomingCard(MatchModel match) {
    final dateFmt = DateFormat('EEE, d MMM • h:mm a');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dateFmt.format(match.datetime.toLocal()),
                style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            Text(match.teamAName ?? 'Team A',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text('vs',
                  style: TextStyle(
                      color: AppColors.textSecondary, fontSize: 11)),
            ),
            Text(match.teamBName ?? 'Team B',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _shimmerMatchCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 14, width: 80, color: Colors.white),
                  const Spacer(),
                  Container(
                      height: 14, width: 80, color: Colors.white),
                ],
              ),
              const SizedBox(height: 16),
              Container(height: 10, width: double.infinity, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _errorCard(String message) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 20),
            const SizedBox(width: 8),
            Expanded(
                child: Text(message,
                    style: const TextStyle(
                        color: AppColors.error, fontSize: 13))),
          ],
        ),
      ),
    );
  }
}
