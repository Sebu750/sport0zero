// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TournamentHistoryModelImpl _$$TournamentHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$TournamentHistoryModelImpl(
  id: json['id'] as String,
  tournamentId: json['tournamentId'] as String,
  tournamentName: json['tournamentName'] as String,
  teamName: json['teamName'] as String,
  role: json['role'] as String,
  sportId: json['sportId'] as String,
  matchesPlayed: (json['matchesPlayed'] as num?)?.toInt() ?? 0,
  runs: (json['runs'] as num?)?.toInt() ?? 0,
  wickets: (json['wickets'] as num?)?.toInt() ?? 0,
  performanceRating: (json['performanceRating'] as num?)?.toDouble() ?? 0.0,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
);

Map<String, dynamic> _$$TournamentHistoryModelImplToJson(
  _$TournamentHistoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'tournamentId': instance.tournamentId,
  'tournamentName': instance.tournamentName,
  'teamName': instance.teamName,
  'role': instance.role,
  'sportId': instance.sportId,
  'matchesPlayed': instance.matchesPlayed,
  'runs': instance.runs,
  'wickets': instance.wickets,
  'performanceRating': instance.performanceRating,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
};
