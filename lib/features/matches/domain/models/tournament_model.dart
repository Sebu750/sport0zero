import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_model.freezed.dart';
part 'tournament_model.g.dart';

enum TournamentFormat { league, knockout, roundRobin, groupStage }
enum TournamentStatus { upcoming, ongoing, completed, cancelled }

@freezed
class TournamentModel with _$TournamentModel {
  const factory TournamentModel({
    required String id,
    required String name,
    required String sportId,
    required String organizerId,
    @Default(TournamentFormat.league) TournamentFormat format,
    @Default(TournamentStatus.upcoming) TournamentStatus status,
    String? description,
    String? logoUrl,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<String> teamIds,
    String? venueId,
  }) = _TournamentModel;

  factory TournamentModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentModelFromJson(json);
}
