import 'package:freezed_annotation/freezed_annotation.dart';

part 'scorecard_model.freezed.dart';
part 'scorecard_model.g.dart';

@freezed
class ScorecardModel with _$ScorecardModel {
  const factory ScorecardModel({
    required String id,
    required String matchId,
    required Map<String, dynamic> inningsData, // JSON: batting, bowling, fall of wickets
    String? result,
    String? manOfTheMatch,
    int? totalOvers,
    String? winningTeamId,
    int? winningMargin,
    String? marginType, // runs, wickets, etc.
  }) = _ScorecardModel;

  factory ScorecardModel.fromJson(Map<String, dynamic> json) =>
      _$ScorecardModelFromJson(json);
}

@freezed
class InningsData with _$InningsData {
  const factory InningsData({
    required String battingTeamId,
    required String bowlingTeamId,
    @Default(0) int runs,
    @Default(0) int wickets,
    @Default(0.0) double overs,
    @Default([]) List<BatsmanStats> batsmen,
    @Default([]) List<BowlerStats> bowlers,
    @Default([]) List<FallOfWicket> fallOfWickets,
    int? extras,
    int? extrasByes,
    int? extrasLegByes,
    int? extrasWides,
    int? extrasNoBalls,
  }) = _InningsData;

  factory InningsData.fromJson(Map<String, dynamic> json) =>
      _$InningsDataFromJson(json);
}

@freezed
class BatsmanStats with _$BatsmanStats {
  const factory BatsmanStats({
    required String playerId,
    String? playerName,
    @Default(0) int runs,
    @Default(0) int balls,
    @Default(0) int fours,
    @Default(0) int sixes,
    @Default(0.0) double strikeRate,
    String? dismissal, // bowled, caught, run out, lbw, etc.
    String? bowlerId,
    String? fielderId,
    @Default(false) bool notOut,
  }) = _BatsmanStats;

  factory BatsmanStats.fromJson(Map<String, dynamic> json) =>
      _$BatsmanStatsFromJson(json);
}

@freezed
class BowlerStats with _$BowlerStats {
  const factory BowlerStats({
    required String playerId,
    String? playerName,
    @Default(0.0) double overs,
    @Default(0) int maidens,
    @Default(0) int runs,
    @Default(0) int wickets,
    @Default(0.0) double economy,
    @Default(0) int wides,
    @Default(0) int noBalls,
  }) = _BowlerStats;

  factory BowlerStats.fromJson(Map<String, dynamic> json) =>
      _$BowlerStatsFromJson(json);
}

@freezed
class FallOfWicket with _$FallOfWicket {
  const factory FallOfWicket({
    required String batsmanId,
    required int score,
    required double over,
    @Default(1) int wicketNumber,
  }) = _FallOfWicket;

  factory FallOfWicket.fromJson(Map<String, dynamic> json) =>
      _$FallOfWicketFromJson(json);
}
