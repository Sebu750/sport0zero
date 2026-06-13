// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return _MatchModel.fromJson(json);
}

/// @nodoc
mixin _$MatchModel {
  String get id => throw _privateConstructorUsedError;
  String get tournamentId => throw _privateConstructorUsedError;
  String get teamAId => throw _privateConstructorUsedError;
  String get teamBId => throw _privateConstructorUsedError;
  String? get venueId => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  MatchStatus get status => throw _privateConstructorUsedError;
  String? get winnerId => throw _privateConstructorUsedError;
  String? get tossWinnerId => throw _privateConstructorUsedError;
  String? get tossDecision => throw _privateConstructorUsedError; // bat or bowl
  int? get teamAScore => throw _privateConstructorUsedError;
  int? get teamBScore => throw _privateConstructorUsedError;
  String? get teamAName => throw _privateConstructorUsedError;
  String? get teamBName => throw _privateConstructorUsedError;
  String? get resultSummary => throw _privateConstructorUsedError;

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
    MatchModel value,
    $Res Function(MatchModel) then,
  ) = _$MatchModelCopyWithImpl<$Res, MatchModel>;
  @useResult
  $Res call({
    String id,
    String tournamentId,
    String teamAId,
    String teamBId,
    String? venueId,
    DateTime datetime,
    MatchStatus status,
    String? winnerId,
    String? tossWinnerId,
    String? tossDecision,
    int? teamAScore,
    int? teamBScore,
    String? teamAName,
    String? teamBName,
    String? resultSummary,
  });
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tournamentId = null,
    Object? teamAId = null,
    Object? teamBId = null,
    Object? venueId = freezed,
    Object? datetime = null,
    Object? status = null,
    Object? winnerId = freezed,
    Object? tossWinnerId = freezed,
    Object? tossDecision = freezed,
    Object? teamAScore = freezed,
    Object? teamBScore = freezed,
    Object? teamAName = freezed,
    Object? teamBName = freezed,
    Object? resultSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            tournamentId: null == tournamentId
                ? _value.tournamentId
                : tournamentId // ignore: cast_nullable_to_non_nullable
                      as String,
            teamAId: null == teamAId
                ? _value.teamAId
                : teamAId // ignore: cast_nullable_to_non_nullable
                      as String,
            teamBId: null == teamBId
                ? _value.teamBId
                : teamBId // ignore: cast_nullable_to_non_nullable
                      as String,
            venueId: freezed == venueId
                ? _value.venueId
                : venueId // ignore: cast_nullable_to_non_nullable
                      as String?,
            datetime: null == datetime
                ? _value.datetime
                : datetime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MatchStatus,
            winnerId: freezed == winnerId
                ? _value.winnerId
                : winnerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            tossWinnerId: freezed == tossWinnerId
                ? _value.tossWinnerId
                : tossWinnerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            tossDecision: freezed == tossDecision
                ? _value.tossDecision
                : tossDecision // ignore: cast_nullable_to_non_nullable
                      as String?,
            teamAScore: freezed == teamAScore
                ? _value.teamAScore
                : teamAScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            teamBScore: freezed == teamBScore
                ? _value.teamBScore
                : teamBScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            teamAName: freezed == teamAName
                ? _value.teamAName
                : teamAName // ignore: cast_nullable_to_non_nullable
                      as String?,
            teamBName: freezed == teamBName
                ? _value.teamBName
                : teamBName // ignore: cast_nullable_to_non_nullable
                      as String?,
            resultSummary: freezed == resultSummary
                ? _value.resultSummary
                : resultSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchModelImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$MatchModelImplCopyWith(
    _$MatchModelImpl value,
    $Res Function(_$MatchModelImpl) then,
  ) = __$$MatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tournamentId,
    String teamAId,
    String teamBId,
    String? venueId,
    DateTime datetime,
    MatchStatus status,
    String? winnerId,
    String? tossWinnerId,
    String? tossDecision,
    int? teamAScore,
    int? teamBScore,
    String? teamAName,
    String? teamBName,
    String? resultSummary,
  });
}

/// @nodoc
class __$$MatchModelImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$MatchModelImpl>
    implements _$$MatchModelImplCopyWith<$Res> {
  __$$MatchModelImplCopyWithImpl(
    _$MatchModelImpl _value,
    $Res Function(_$MatchModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tournamentId = null,
    Object? teamAId = null,
    Object? teamBId = null,
    Object? venueId = freezed,
    Object? datetime = null,
    Object? status = null,
    Object? winnerId = freezed,
    Object? tossWinnerId = freezed,
    Object? tossDecision = freezed,
    Object? teamAScore = freezed,
    Object? teamBScore = freezed,
    Object? teamAName = freezed,
    Object? teamBName = freezed,
    Object? resultSummary = freezed,
  }) {
    return _then(
      _$MatchModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tournamentId: null == tournamentId
            ? _value.tournamentId
            : tournamentId // ignore: cast_nullable_to_non_nullable
                  as String,
        teamAId: null == teamAId
            ? _value.teamAId
            : teamAId // ignore: cast_nullable_to_non_nullable
                  as String,
        teamBId: null == teamBId
            ? _value.teamBId
            : teamBId // ignore: cast_nullable_to_non_nullable
                  as String,
        venueId: freezed == venueId
            ? _value.venueId
            : venueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        datetime: null == datetime
            ? _value.datetime
            : datetime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MatchStatus,
        winnerId: freezed == winnerId
            ? _value.winnerId
            : winnerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tossWinnerId: freezed == tossWinnerId
            ? _value.tossWinnerId
            : tossWinnerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tossDecision: freezed == tossDecision
            ? _value.tossDecision
            : tossDecision // ignore: cast_nullable_to_non_nullable
                  as String?,
        teamAScore: freezed == teamAScore
            ? _value.teamAScore
            : teamAScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        teamBScore: freezed == teamBScore
            ? _value.teamBScore
            : teamBScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        teamAName: freezed == teamAName
            ? _value.teamAName
            : teamAName // ignore: cast_nullable_to_non_nullable
                  as String?,
        teamBName: freezed == teamBName
            ? _value.teamBName
            : teamBName // ignore: cast_nullable_to_non_nullable
                  as String?,
        resultSummary: freezed == resultSummary
            ? _value.resultSummary
            : resultSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchModelImpl implements _MatchModel {
  const _$MatchModelImpl({
    required this.id,
    required this.tournamentId,
    required this.teamAId,
    required this.teamBId,
    this.venueId,
    required this.datetime,
    this.status = MatchStatus.scheduled,
    this.winnerId,
    this.tossWinnerId,
    this.tossDecision,
    this.teamAScore,
    this.teamBScore,
    this.teamAName,
    this.teamBName,
    this.resultSummary,
  });

  factory _$MatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchModelImplFromJson(json);

  @override
  final String id;
  @override
  final String tournamentId;
  @override
  final String teamAId;
  @override
  final String teamBId;
  @override
  final String? venueId;
  @override
  final DateTime datetime;
  @override
  @JsonKey()
  final MatchStatus status;
  @override
  final String? winnerId;
  @override
  final String? tossWinnerId;
  @override
  final String? tossDecision;
  // bat or bowl
  @override
  final int? teamAScore;
  @override
  final int? teamBScore;
  @override
  final String? teamAName;
  @override
  final String? teamBName;
  @override
  final String? resultSummary;

  @override
  String toString() {
    return 'MatchModel(id: $id, tournamentId: $tournamentId, teamAId: $teamAId, teamBId: $teamBId, venueId: $venueId, datetime: $datetime, status: $status, winnerId: $winnerId, tossWinnerId: $tossWinnerId, tossDecision: $tossDecision, teamAScore: $teamAScore, teamBScore: $teamBScore, teamAName: $teamAName, teamBName: $teamBName, resultSummary: $resultSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tournamentId, tournamentId) ||
                other.tournamentId == tournamentId) &&
            (identical(other.teamAId, teamAId) || other.teamAId == teamAId) &&
            (identical(other.teamBId, teamBId) || other.teamBId == teamBId) &&
            (identical(other.venueId, venueId) || other.venueId == venueId) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.winnerId, winnerId) ||
                other.winnerId == winnerId) &&
            (identical(other.tossWinnerId, tossWinnerId) ||
                other.tossWinnerId == tossWinnerId) &&
            (identical(other.tossDecision, tossDecision) ||
                other.tossDecision == tossDecision) &&
            (identical(other.teamAScore, teamAScore) ||
                other.teamAScore == teamAScore) &&
            (identical(other.teamBScore, teamBScore) ||
                other.teamBScore == teamBScore) &&
            (identical(other.teamAName, teamAName) ||
                other.teamAName == teamAName) &&
            (identical(other.teamBName, teamBName) ||
                other.teamBName == teamBName) &&
            (identical(other.resultSummary, resultSummary) ||
                other.resultSummary == resultSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tournamentId,
    teamAId,
    teamBId,
    venueId,
    datetime,
    status,
    winnerId,
    tossWinnerId,
    tossDecision,
    teamAScore,
    teamBScore,
    teamAName,
    teamBName,
    resultSummary,
  );

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      __$$MatchModelImplCopyWithImpl<_$MatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchModelImplToJson(this);
  }
}

abstract class _MatchModel implements MatchModel {
  const factory _MatchModel({
    required final String id,
    required final String tournamentId,
    required final String teamAId,
    required final String teamBId,
    final String? venueId,
    required final DateTime datetime,
    final MatchStatus status,
    final String? winnerId,
    final String? tossWinnerId,
    final String? tossDecision,
    final int? teamAScore,
    final int? teamBScore,
    final String? teamAName,
    final String? teamBName,
    final String? resultSummary,
  }) = _$MatchModelImpl;

  factory _MatchModel.fromJson(Map<String, dynamic> json) =
      _$MatchModelImpl.fromJson;

  @override
  String get id;
  @override
  String get tournamentId;
  @override
  String get teamAId;
  @override
  String get teamBId;
  @override
  String? get venueId;
  @override
  DateTime get datetime;
  @override
  MatchStatus get status;
  @override
  String? get winnerId;
  @override
  String? get tossWinnerId;
  @override
  String? get tossDecision; // bat or bowl
  @override
  int? get teamAScore;
  @override
  int? get teamBScore;
  @override
  String? get teamAName;
  @override
  String? get teamBName;
  @override
  String? get resultSummary;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
