// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SportModelImpl _$$SportModelImplFromJson(Map<String, dynamic> json) =>
    _$SportModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      scoringEngineType:
          $enumDecodeNullable(
            _$ScoringEngineTypeEnumMap,
            json['scoringEngineType'],
          ) ??
          ScoringEngineType.cricket,
      iconUrl: json['iconUrl'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$SportModelImplToJson(
  _$SportModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'scoringEngineType': _$ScoringEngineTypeEnumMap[instance.scoringEngineType]!,
  'iconUrl': instance.iconUrl,
  'isActive': instance.isActive,
};

const _$ScoringEngineTypeEnumMap = {
  ScoringEngineType.cricket: 'cricket',
  ScoringEngineType.football: 'football',
  ScoringEngineType.basketball: 'basketball',
  ScoringEngineType.hockey: 'hockey',
};
