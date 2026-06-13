// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TournamentModelImpl _$$TournamentModelImplFromJson(
  Map<String, dynamic> json,
) => _$TournamentModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  sportId: json['sportId'] as String,
  organizerId: json['organizerId'] as String,
  format:
      $enumDecodeNullable(_$TournamentFormatEnumMap, json['format']) ??
      TournamentFormat.league,
  status:
      $enumDecodeNullable(_$TournamentStatusEnumMap, json['status']) ??
      TournamentStatus.upcoming,
  description: json['description'] as String?,
  logoUrl: json['logoUrl'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  teamIds:
      (json['teamIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  venueId: json['venueId'] as String?,
);

Map<String, dynamic> _$$TournamentModelImplToJson(
  _$TournamentModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sportId': instance.sportId,
  'organizerId': instance.organizerId,
  'format': _$TournamentFormatEnumMap[instance.format]!,
  'status': _$TournamentStatusEnumMap[instance.status]!,
  'description': instance.description,
  'logoUrl': instance.logoUrl,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'teamIds': instance.teamIds,
  'venueId': instance.venueId,
};

const _$TournamentFormatEnumMap = {
  TournamentFormat.league: 'league',
  TournamentFormat.knockout: 'knockout',
  TournamentFormat.roundRobin: 'roundRobin',
  TournamentFormat.groupStage: 'groupStage',
};

const _$TournamentStatusEnumMap = {
  TournamentStatus.upcoming: 'upcoming',
  TournamentStatus.ongoing: 'ongoing',
  TournamentStatus.completed: 'completed',
  TournamentStatus.cancelled: 'cancelled',
};
