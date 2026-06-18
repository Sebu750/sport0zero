import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_dashboard_stats_model.freezed.dart';
part 'player_dashboard_stats_model.g.dart';

enum RecentForm { win, loss, draw }

@freezed
class PlayerDashboardStats with _$PlayerDashboardStats {
  const factory PlayerDashboardStats({
    required String uid,
    @Default(0) int teamCount,
    @Default(0) int matchCount,
    @Default(0) int winCount,
    @Default(0.0) double winRate,
    @Default(0.0) double playerRating,
    @Default(0) int activeTournamentCount,
    @Default(0) int upcomingMatchCount,
    @Default([]) List<RecentForm> recentForm,
    DateTime? lastUpdated,
  }) = _PlayerDashboardStats;

  factory PlayerDashboardStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerDashboardStatsFromJson(json);
}
