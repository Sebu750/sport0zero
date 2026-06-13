// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamModelImpl _$$TeamModelImplFromJson(Map<String, dynamic> json) =>
    _$TeamModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sportId: json['sportId'] as String,
      managerId: json['managerId'] as String?,
      logoUrl: json['logoUrl'] as String?,
      shortName: json['shortName'] as String?,
      homeGround: json['homeGround'] as String?,
      playerIds:
          (json['playerIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      foundedAt: json['foundedAt'] == null
          ? null
          : DateTime.parse(json['foundedAt'] as String),
    );

Map<String, dynamic> _$$TeamModelImplToJson(_$TeamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sportId': instance.sportId,
      'managerId': instance.managerId,
      'logoUrl': instance.logoUrl,
      'shortName': instance.shortName,
      'homeGround': instance.homeGround,
      'playerIds': instance.playerIds,
      'foundedAt': instance.foundedAt?.toIso8601String(),
    };
