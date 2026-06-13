// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ball_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BallEventModelImpl _$$BallEventModelImplFromJson(Map<String, dynamic> json) =>
    _$BallEventModelImpl(
      id: json['id'] as String,
      matchId: json['matchId'] as String,
      inningsNumber: (json['inningsNumber'] as num).toInt(),
      overNo: (json['overNo'] as num).toInt(),
      ballNo: (json['ballNo'] as num).toInt(),
      runs: (json['runs'] as num?)?.toInt() ?? 0,
      extraType:
          $enumDecodeNullable(_$ExtraTypeEnumMap, json['extraType']) ??
          ExtraType.none,
      extraRuns: (json['extraRuns'] as num?)?.toInt() ?? 0,
      wicketType:
          $enumDecodeNullable(_$WicketTypeEnumMap, json['wicketType']) ??
          WicketType.none,
      batsmanId: json['batsmanId'] as String?,
      bowlerId: json['bowlerId'] as String?,
      fielderId: json['fielderId'] as String?,
      nonStrikerId: json['nonStrikerId'] as String?,
      isWicket: json['isWicket'] as bool? ?? false,
      isBoundary: json['isBoundary'] as bool? ?? false,
      isSix: json['isSix'] as bool? ?? false,
      commentary: json['commentary'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$BallEventModelImplToJson(
  _$BallEventModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'matchId': instance.matchId,
  'inningsNumber': instance.inningsNumber,
  'overNo': instance.overNo,
  'ballNo': instance.ballNo,
  'runs': instance.runs,
  'extraType': _$ExtraTypeEnumMap[instance.extraType]!,
  'extraRuns': instance.extraRuns,
  'wicketType': _$WicketTypeEnumMap[instance.wicketType]!,
  'batsmanId': instance.batsmanId,
  'bowlerId': instance.bowlerId,
  'fielderId': instance.fielderId,
  'nonStrikerId': instance.nonStrikerId,
  'isWicket': instance.isWicket,
  'isBoundary': instance.isBoundary,
  'isSix': instance.isSix,
  'commentary': instance.commentary,
  'timestamp': instance.timestamp?.toIso8601String(),
};

const _$ExtraTypeEnumMap = {
  ExtraType.none: 'none',
  ExtraType.wide: 'wide',
  ExtraType.noBall: 'noBall',
  ExtraType.bye: 'bye',
  ExtraType.legBye: 'legBye',
};

const _$WicketTypeEnumMap = {
  WicketType.none: 'none',
  WicketType.bowled: 'bowled',
  WicketType.caught: 'caught',
  WicketType.lbw: 'lbw',
  WicketType.runOut: 'runOut',
  WicketType.stumped: 'stumped',
  WicketType.hitWicket: 'hitWicket',
  WicketType.caughtAndBowled: 'caughtAndBowled',
};
