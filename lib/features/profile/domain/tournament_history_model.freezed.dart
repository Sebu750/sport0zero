// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TournamentHistoryModel _$TournamentHistoryModelFromJson(
  Map<String, dynamic> json,
) {
  return _TournamentHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentHistoryModel {
  String get id => throw _privateConstructorUsedError;
  String get tournamentId => throw _privateConstructorUsedError;
  String get tournamentName => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  int get matchesPlayed => throw _privateConstructorUsedError;
  int get runs => throw _privateConstructorUsedError;
  int get wickets => throw _privateConstructorUsedError;
  double get performanceRating => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Serializes this TournamentHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TournamentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TournamentHistoryModelCopyWith<TournamentHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentHistoryModelCopyWith<$Res> {
  factory $TournamentHistoryModelCopyWith(
    TournamentHistoryModel value,
    $Res Function(TournamentHistoryModel) then,
  ) = _$TournamentHistoryModelCopyWithImpl<$Res, TournamentHistoryModel>;
  @useResult
  $Res call({
    String id,
    String tournamentId,
    String tournamentName,
    String teamName,
    String role,
    String sportId,
    int matchesPlayed,
    int runs,
    int wickets,
    double performanceRating,
    DateTime startDate,
    DateTime? endDate,
  });
}

/// @nodoc
class _$TournamentHistoryModelCopyWithImpl<
  $Res,
  $Val extends TournamentHistoryModel
>
    implements $TournamentHistoryModelCopyWith<$Res> {
  _$TournamentHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TournamentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tournamentId = null,
    Object? tournamentName = null,
    Object? teamName = null,
    Object? role = null,
    Object? sportId = null,
    Object? matchesPlayed = null,
    Object? runs = null,
    Object? wickets = null,
    Object? performanceRating = null,
    Object? startDate = null,
    Object? endDate = freezed,
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
            tournamentName: null == tournamentName
                ? _value.tournamentName
                : tournamentName // ignore: cast_nullable_to_non_nullable
                      as String,
            teamName: null == teamName
                ? _value.teamName
                : teamName // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            sportId: null == sportId
                ? _value.sportId
                : sportId // ignore: cast_nullable_to_non_nullable
                      as String,
            matchesPlayed: null == matchesPlayed
                ? _value.matchesPlayed
                : matchesPlayed // ignore: cast_nullable_to_non_nullable
                      as int,
            runs: null == runs
                ? _value.runs
                : runs // ignore: cast_nullable_to_non_nullable
                      as int,
            wickets: null == wickets
                ? _value.wickets
                : wickets // ignore: cast_nullable_to_non_nullable
                      as int,
            performanceRating: null == performanceRating
                ? _value.performanceRating
                : performanceRating // ignore: cast_nullable_to_non_nullable
                      as double,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TournamentHistoryModelImplCopyWith<$Res>
    implements $TournamentHistoryModelCopyWith<$Res> {
  factory _$$TournamentHistoryModelImplCopyWith(
    _$TournamentHistoryModelImpl value,
    $Res Function(_$TournamentHistoryModelImpl) then,
  ) = __$$TournamentHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tournamentId,
    String tournamentName,
    String teamName,
    String role,
    String sportId,
    int matchesPlayed,
    int runs,
    int wickets,
    double performanceRating,
    DateTime startDate,
    DateTime? endDate,
  });
}

/// @nodoc
class __$$TournamentHistoryModelImplCopyWithImpl<$Res>
    extends
        _$TournamentHistoryModelCopyWithImpl<$Res, _$TournamentHistoryModelImpl>
    implements _$$TournamentHistoryModelImplCopyWith<$Res> {
  __$$TournamentHistoryModelImplCopyWithImpl(
    _$TournamentHistoryModelImpl _value,
    $Res Function(_$TournamentHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TournamentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tournamentId = null,
    Object? tournamentName = null,
    Object? teamName = null,
    Object? role = null,
    Object? sportId = null,
    Object? matchesPlayed = null,
    Object? runs = null,
    Object? wickets = null,
    Object? performanceRating = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(
      _$TournamentHistoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tournamentId: null == tournamentId
            ? _value.tournamentId
            : tournamentId // ignore: cast_nullable_to_non_nullable
                  as String,
        tournamentName: null == tournamentName
            ? _value.tournamentName
            : tournamentName // ignore: cast_nullable_to_non_nullable
                  as String,
        teamName: null == teamName
            ? _value.teamName
            : teamName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        sportId: null == sportId
            ? _value.sportId
            : sportId // ignore: cast_nullable_to_non_nullable
                  as String,
        matchesPlayed: null == matchesPlayed
            ? _value.matchesPlayed
            : matchesPlayed // ignore: cast_nullable_to_non_nullable
                  as int,
        runs: null == runs
            ? _value.runs
            : runs // ignore: cast_nullable_to_non_nullable
                  as int,
        wickets: null == wickets
            ? _value.wickets
            : wickets // ignore: cast_nullable_to_non_nullable
                  as int,
        performanceRating: null == performanceRating
            ? _value.performanceRating
            : performanceRating // ignore: cast_nullable_to_non_nullable
                  as double,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentHistoryModelImpl implements _TournamentHistoryModel {
  const _$TournamentHistoryModelImpl({
    required this.id,
    required this.tournamentId,
    required this.tournamentName,
    required this.teamName,
    required this.role,
    required this.sportId,
    this.matchesPlayed = 0,
    this.runs = 0,
    this.wickets = 0,
    this.performanceRating = 0.0,
    required this.startDate,
    this.endDate,
  });

  factory _$TournamentHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentHistoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String tournamentId;
  @override
  final String tournamentName;
  @override
  final String teamName;
  @override
  final String role;
  @override
  final String sportId;
  @override
  @JsonKey()
  final int matchesPlayed;
  @override
  @JsonKey()
  final int runs;
  @override
  @JsonKey()
  final int wickets;
  @override
  @JsonKey()
  final double performanceRating;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'TournamentHistoryModel(id: $id, tournamentId: $tournamentId, tournamentName: $tournamentName, teamName: $teamName, role: $role, sportId: $sportId, matchesPlayed: $matchesPlayed, runs: $runs, wickets: $wickets, performanceRating: $performanceRating, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentHistoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tournamentId, tournamentId) ||
                other.tournamentId == tournamentId) &&
            (identical(other.tournamentName, tournamentName) ||
                other.tournamentName == tournamentName) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sportId, sportId) || other.sportId == sportId) &&
            (identical(other.matchesPlayed, matchesPlayed) ||
                other.matchesPlayed == matchesPlayed) &&
            (identical(other.runs, runs) || other.runs == runs) &&
            (identical(other.wickets, wickets) || other.wickets == wickets) &&
            (identical(other.performanceRating, performanceRating) ||
                other.performanceRating == performanceRating) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tournamentId,
    tournamentName,
    teamName,
    role,
    sportId,
    matchesPlayed,
    runs,
    wickets,
    performanceRating,
    startDate,
    endDate,
  );

  /// Create a copy of TournamentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentHistoryModelImplCopyWith<_$TournamentHistoryModelImpl>
  get copyWith =>
      __$$TournamentHistoryModelImplCopyWithImpl<_$TournamentHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentHistoryModelImplToJson(this);
  }
}

abstract class _TournamentHistoryModel implements TournamentHistoryModel {
  const factory _TournamentHistoryModel({
    required final String id,
    required final String tournamentId,
    required final String tournamentName,
    required final String teamName,
    required final String role,
    required final String sportId,
    final int matchesPlayed,
    final int runs,
    final int wickets,
    final double performanceRating,
    required final DateTime startDate,
    final DateTime? endDate,
  }) = _$TournamentHistoryModelImpl;

  factory _TournamentHistoryModel.fromJson(Map<String, dynamic> json) =
      _$TournamentHistoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get tournamentId;
  @override
  String get tournamentName;
  @override
  String get teamName;
  @override
  String get role;
  @override
  String get sportId;
  @override
  int get matchesPlayed;
  @override
  int get runs;
  @override
  int get wickets;
  @override
  double get performanceRating;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of TournamentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TournamentHistoryModelImplCopyWith<_$TournamentHistoryModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
