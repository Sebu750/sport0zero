import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_history_model.freezed.dart';
part 'tournament_history_model.g.dart';

@freezed
class TournamentHistoryModel with _$TournamentHistoryModel {
  const factory TournamentHistoryModel({
    required String id,
    required String tournamentId,
    required String tournamentName,
    required String teamName,
    required String role,
    required String sportId,
    @Default(0) int matchesPlayed,
    @Default(0) int runs,
    @Default(0) int wickets,
    @Default(0.0) double performanceRating,
    required DateTime startDate,
    DateTime? endDate,
  }) = _TournamentHistoryModel;

  factory TournamentHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentHistoryModelFromJson(json);
}
