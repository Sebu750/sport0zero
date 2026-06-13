import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

enum MatchStatus { scheduled, live, completed, abandoned, postponed }

@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String id,
    required String tournamentId,
    required String teamAId,
    required String teamBId,
    String? venueId,
    required DateTime datetime,
    @Default(MatchStatus.scheduled) MatchStatus status,
    String? winnerId,
    String? tossWinnerId,
    String? tossDecision, // bat or bowl
    int? teamAScore,
    int? teamBScore,
    String? teamAName,
    String? teamBName,
    String? resultSummary,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}
