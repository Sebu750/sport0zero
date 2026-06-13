import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_stats_model.freezed.dart';
part 'player_stats_model.g.dart';

enum MatchFormat { t5, t10, t20, odi, test, other }

@freezed
class PlayerStatsModel with _$PlayerStatsModel {
  const factory PlayerStatsModel({
    required String userId,
    required String sportId,
    @Default(MatchFormat.t20) MatchFormat format,
    // Batting stats
    @Default(0) int matches,
    @Default(0) int innings,
    @Default(0) int runs,
    @Default(0) int balls,
    @Default(0) int highScore,
    @Default(0.0) double average,
    @Default(0.0) double strikeRate,
    @Default(0) int fifties,
    @Default(0) int hundreds,
    @Default(0) int fours,
    @Default(0) int sixes,
    @Default(0) int notOuts,
    // Bowling stats
    @Default(0) int ballsBowled,
    @Default(0) int runsConceded,
    @Default(0) int wickets,
    @Default(0.0) double economy,
    @Default(0.0) double bowlingAverage,
    @Default(0.0) double bowlingStrikeRate,
    @Default(0) int maidens,
    @Default(0) int bestBowlingWickets,
    @Default(0) int bestBowlingRuns,
    // Fielding stats
    @Default(0) int catches,
    @Default(0) int stumpings,
    @Default(0) int runOuts,
  }) = _PlayerStatsModel;

  factory PlayerStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsModelFromJson(json);
}
