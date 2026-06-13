// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStatsModelImpl _$$PlayerStatsModelImplFromJson(
  Map<String, dynamic> json,
) => _$PlayerStatsModelImpl(
  userId: json['userId'] as String,
  sportId: json['sportId'] as String,
  format:
      $enumDecodeNullable(_$MatchFormatEnumMap, json['format']) ??
      MatchFormat.t20,
  matches: (json['matches'] as num?)?.toInt() ?? 0,
  innings: (json['innings'] as num?)?.toInt() ?? 0,
  runs: (json['runs'] as num?)?.toInt() ?? 0,
  balls: (json['balls'] as num?)?.toInt() ?? 0,
  highScore: (json['highScore'] as num?)?.toInt() ?? 0,
  average: (json['average'] as num?)?.toDouble() ?? 0.0,
  strikeRate: (json['strikeRate'] as num?)?.toDouble() ?? 0.0,
  fifties: (json['fifties'] as num?)?.toInt() ?? 0,
  hundreds: (json['hundreds'] as num?)?.toInt() ?? 0,
  fours: (json['fours'] as num?)?.toInt() ?? 0,
  sixes: (json['sixes'] as num?)?.toInt() ?? 0,
  notOuts: (json['notOuts'] as num?)?.toInt() ?? 0,
  ballsBowled: (json['ballsBowled'] as num?)?.toInt() ?? 0,
  runsConceded: (json['runsConceded'] as num?)?.toInt() ?? 0,
  wickets: (json['wickets'] as num?)?.toInt() ?? 0,
  economy: (json['economy'] as num?)?.toDouble() ?? 0.0,
  bowlingAverage: (json['bowlingAverage'] as num?)?.toDouble() ?? 0.0,
  bowlingStrikeRate: (json['bowlingStrikeRate'] as num?)?.toDouble() ?? 0.0,
  maidens: (json['maidens'] as num?)?.toInt() ?? 0,
  bestBowlingWickets: (json['bestBowlingWickets'] as num?)?.toInt() ?? 0,
  bestBowlingRuns: (json['bestBowlingRuns'] as num?)?.toInt() ?? 0,
  catches: (json['catches'] as num?)?.toInt() ?? 0,
  stumpings: (json['stumpings'] as num?)?.toInt() ?? 0,
  runOuts: (json['runOuts'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$PlayerStatsModelImplToJson(
  _$PlayerStatsModelImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sportId': instance.sportId,
  'format': _$MatchFormatEnumMap[instance.format]!,
  'matches': instance.matches,
  'innings': instance.innings,
  'runs': instance.runs,
  'balls': instance.balls,
  'highScore': instance.highScore,
  'average': instance.average,
  'strikeRate': instance.strikeRate,
  'fifties': instance.fifties,
  'hundreds': instance.hundreds,
  'fours': instance.fours,
  'sixes': instance.sixes,
  'notOuts': instance.notOuts,
  'ballsBowled': instance.ballsBowled,
  'runsConceded': instance.runsConceded,
  'wickets': instance.wickets,
  'economy': instance.economy,
  'bowlingAverage': instance.bowlingAverage,
  'bowlingStrikeRate': instance.bowlingStrikeRate,
  'maidens': instance.maidens,
  'bestBowlingWickets': instance.bestBowlingWickets,
  'bestBowlingRuns': instance.bestBowlingRuns,
  'catches': instance.catches,
  'stumpings': instance.stumpings,
  'runOuts': instance.runOuts,
};

const _$MatchFormatEnumMap = {
  MatchFormat.t5: 't5',
  MatchFormat.t10: 't10',
  MatchFormat.t20: 't20',
  MatchFormat.odi: 'odi',
  MatchFormat.test: 'test',
  MatchFormat.other: 'other',
};
