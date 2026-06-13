// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scorecard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScorecardModelImpl _$$ScorecardModelImplFromJson(Map<String, dynamic> json) =>
    _$ScorecardModelImpl(
      id: json['id'] as String,
      matchId: json['matchId'] as String,
      inningsData: json['inningsData'] as Map<String, dynamic>,
      result: json['result'] as String?,
      manOfTheMatch: json['manOfTheMatch'] as String?,
      totalOvers: (json['totalOvers'] as num?)?.toInt(),
      winningTeamId: json['winningTeamId'] as String?,
      winningMargin: (json['winningMargin'] as num?)?.toInt(),
      marginType: json['marginType'] as String?,
    );

Map<String, dynamic> _$$ScorecardModelImplToJson(
  _$ScorecardModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'matchId': instance.matchId,
  'inningsData': instance.inningsData,
  'result': instance.result,
  'manOfTheMatch': instance.manOfTheMatch,
  'totalOvers': instance.totalOvers,
  'winningTeamId': instance.winningTeamId,
  'winningMargin': instance.winningMargin,
  'marginType': instance.marginType,
};

_$InningsDataImpl _$$InningsDataImplFromJson(Map<String, dynamic> json) =>
    _$InningsDataImpl(
      battingTeamId: json['battingTeamId'] as String,
      bowlingTeamId: json['bowlingTeamId'] as String,
      runs: (json['runs'] as num?)?.toInt() ?? 0,
      wickets: (json['wickets'] as num?)?.toInt() ?? 0,
      overs: (json['overs'] as num?)?.toDouble() ?? 0.0,
      batsmen:
          (json['batsmen'] as List<dynamic>?)
              ?.map((e) => BatsmanStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bowlers:
          (json['bowlers'] as List<dynamic>?)
              ?.map((e) => BowlerStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fallOfWickets:
          (json['fallOfWickets'] as List<dynamic>?)
              ?.map((e) => FallOfWicket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      extras: (json['extras'] as num?)?.toInt(),
      extrasByes: (json['extrasByes'] as num?)?.toInt(),
      extrasLegByes: (json['extrasLegByes'] as num?)?.toInt(),
      extrasWides: (json['extrasWides'] as num?)?.toInt(),
      extrasNoBalls: (json['extrasNoBalls'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InningsDataImplToJson(_$InningsDataImpl instance) =>
    <String, dynamic>{
      'battingTeamId': instance.battingTeamId,
      'bowlingTeamId': instance.bowlingTeamId,
      'runs': instance.runs,
      'wickets': instance.wickets,
      'overs': instance.overs,
      'batsmen': instance.batsmen,
      'bowlers': instance.bowlers,
      'fallOfWickets': instance.fallOfWickets,
      'extras': instance.extras,
      'extrasByes': instance.extrasByes,
      'extrasLegByes': instance.extrasLegByes,
      'extrasWides': instance.extrasWides,
      'extrasNoBalls': instance.extrasNoBalls,
    };

_$BatsmanStatsImpl _$$BatsmanStatsImplFromJson(Map<String, dynamic> json) =>
    _$BatsmanStatsImpl(
      playerId: json['playerId'] as String,
      playerName: json['playerName'] as String?,
      runs: (json['runs'] as num?)?.toInt() ?? 0,
      balls: (json['balls'] as num?)?.toInt() ?? 0,
      fours: (json['fours'] as num?)?.toInt() ?? 0,
      sixes: (json['sixes'] as num?)?.toInt() ?? 0,
      strikeRate: (json['strikeRate'] as num?)?.toDouble() ?? 0.0,
      dismissal: json['dismissal'] as String?,
      bowlerId: json['bowlerId'] as String?,
      fielderId: json['fielderId'] as String?,
      notOut: json['notOut'] as bool? ?? false,
    );

Map<String, dynamic> _$$BatsmanStatsImplToJson(_$BatsmanStatsImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'runs': instance.runs,
      'balls': instance.balls,
      'fours': instance.fours,
      'sixes': instance.sixes,
      'strikeRate': instance.strikeRate,
      'dismissal': instance.dismissal,
      'bowlerId': instance.bowlerId,
      'fielderId': instance.fielderId,
      'notOut': instance.notOut,
    };

_$BowlerStatsImpl _$$BowlerStatsImplFromJson(Map<String, dynamic> json) =>
    _$BowlerStatsImpl(
      playerId: json['playerId'] as String,
      playerName: json['playerName'] as String?,
      overs: (json['overs'] as num?)?.toDouble() ?? 0.0,
      maidens: (json['maidens'] as num?)?.toInt() ?? 0,
      runs: (json['runs'] as num?)?.toInt() ?? 0,
      wickets: (json['wickets'] as num?)?.toInt() ?? 0,
      economy: (json['economy'] as num?)?.toDouble() ?? 0.0,
      wides: (json['wides'] as num?)?.toInt() ?? 0,
      noBalls: (json['noBalls'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BowlerStatsImplToJson(_$BowlerStatsImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'overs': instance.overs,
      'maidens': instance.maidens,
      'runs': instance.runs,
      'wickets': instance.wickets,
      'economy': instance.economy,
      'wides': instance.wides,
      'noBalls': instance.noBalls,
    };

_$FallOfWicketImpl _$$FallOfWicketImplFromJson(Map<String, dynamic> json) =>
    _$FallOfWicketImpl(
      batsmanId: json['batsmanId'] as String,
      score: (json['score'] as num).toInt(),
      over: (json['over'] as num).toDouble(),
      wicketNumber: (json['wicketNumber'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$FallOfWicketImplToJson(_$FallOfWicketImpl instance) =>
    <String, dynamic>{
      'batsmanId': instance.batsmanId,
      'score': instance.score,
      'over': instance.over,
      'wicketNumber': instance.wicketNumber,
    };
