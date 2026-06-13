// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchModelImpl _$$MatchModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchModelImpl(
      id: json['id'] as String,
      tournamentId: json['tournamentId'] as String,
      teamAId: json['teamAId'] as String,
      teamBId: json['teamBId'] as String,
      venueId: json['venueId'] as String?,
      datetime: DateTime.parse(json['datetime'] as String),
      status:
          $enumDecodeNullable(_$MatchStatusEnumMap, json['status']) ??
          MatchStatus.scheduled,
      winnerId: json['winnerId'] as String?,
      tossWinnerId: json['tossWinnerId'] as String?,
      tossDecision: json['tossDecision'] as String?,
      teamAScore: (json['teamAScore'] as num?)?.toInt(),
      teamBScore: (json['teamBScore'] as num?)?.toInt(),
      teamAName: json['teamAName'] as String?,
      teamBName: json['teamBName'] as String?,
      resultSummary: json['resultSummary'] as String?,
    );

Map<String, dynamic> _$$MatchModelImplToJson(_$MatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournamentId': instance.tournamentId,
      'teamAId': instance.teamAId,
      'teamBId': instance.teamBId,
      'venueId': instance.venueId,
      'datetime': instance.datetime.toIso8601String(),
      'status': _$MatchStatusEnumMap[instance.status]!,
      'winnerId': instance.winnerId,
      'tossWinnerId': instance.tossWinnerId,
      'tossDecision': instance.tossDecision,
      'teamAScore': instance.teamAScore,
      'teamBScore': instance.teamBScore,
      'teamAName': instance.teamAName,
      'teamBName': instance.teamBName,
      'resultSummary': instance.resultSummary,
    };

const _$MatchStatusEnumMap = {
  MatchStatus.scheduled: 'scheduled',
  MatchStatus.live: 'live',
  MatchStatus.completed: 'completed',
  MatchStatus.abandoned: 'abandoned',
  MatchStatus.postponed: 'postponed',
};
