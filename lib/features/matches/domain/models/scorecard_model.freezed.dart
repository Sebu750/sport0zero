// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scorecard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScorecardModel _$ScorecardModelFromJson(Map<String, dynamic> json) {
  return _ScorecardModel.fromJson(json);
}

/// @nodoc
mixin _$ScorecardModel {
  String get id => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  Map<String, dynamic> get inningsData =>
      throw _privateConstructorUsedError; // JSON: batting, bowling, fall of wickets
  String? get result => throw _privateConstructorUsedError;
  String? get manOfTheMatch => throw _privateConstructorUsedError;
  int? get totalOvers => throw _privateConstructorUsedError;
  String? get winningTeamId => throw _privateConstructorUsedError;
  int? get winningMargin => throw _privateConstructorUsedError;
  String? get marginType => throw _privateConstructorUsedError;

  /// Serializes this ScorecardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScorecardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScorecardModelCopyWith<ScorecardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScorecardModelCopyWith<$Res> {
  factory $ScorecardModelCopyWith(
    ScorecardModel value,
    $Res Function(ScorecardModel) then,
  ) = _$ScorecardModelCopyWithImpl<$Res, ScorecardModel>;
  @useResult
  $Res call({
    String id,
    String matchId,
    Map<String, dynamic> inningsData,
    String? result,
    String? manOfTheMatch,
    int? totalOvers,
    String? winningTeamId,
    int? winningMargin,
    String? marginType,
  });
}

/// @nodoc
class _$ScorecardModelCopyWithImpl<$Res, $Val extends ScorecardModel>
    implements $ScorecardModelCopyWith<$Res> {
  _$ScorecardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScorecardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? inningsData = null,
    Object? result = freezed,
    Object? manOfTheMatch = freezed,
    Object? totalOvers = freezed,
    Object? winningTeamId = freezed,
    Object? winningMargin = freezed,
    Object? marginType = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            matchId: null == matchId
                ? _value.matchId
                : matchId // ignore: cast_nullable_to_non_nullable
                      as String,
            inningsData: null == inningsData
                ? _value.inningsData
                : inningsData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as String?,
            manOfTheMatch: freezed == manOfTheMatch
                ? _value.manOfTheMatch
                : manOfTheMatch // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalOvers: freezed == totalOvers
                ? _value.totalOvers
                : totalOvers // ignore: cast_nullable_to_non_nullable
                      as int?,
            winningTeamId: freezed == winningTeamId
                ? _value.winningTeamId
                : winningTeamId // ignore: cast_nullable_to_non_nullable
                      as String?,
            winningMargin: freezed == winningMargin
                ? _value.winningMargin
                : winningMargin // ignore: cast_nullable_to_non_nullable
                      as int?,
            marginType: freezed == marginType
                ? _value.marginType
                : marginType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScorecardModelImplCopyWith<$Res>
    implements $ScorecardModelCopyWith<$Res> {
  factory _$$ScorecardModelImplCopyWith(
    _$ScorecardModelImpl value,
    $Res Function(_$ScorecardModelImpl) then,
  ) = __$$ScorecardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String matchId,
    Map<String, dynamic> inningsData,
    String? result,
    String? manOfTheMatch,
    int? totalOvers,
    String? winningTeamId,
    int? winningMargin,
    String? marginType,
  });
}

/// @nodoc
class __$$ScorecardModelImplCopyWithImpl<$Res>
    extends _$ScorecardModelCopyWithImpl<$Res, _$ScorecardModelImpl>
    implements _$$ScorecardModelImplCopyWith<$Res> {
  __$$ScorecardModelImplCopyWithImpl(
    _$ScorecardModelImpl _value,
    $Res Function(_$ScorecardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScorecardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? inningsData = null,
    Object? result = freezed,
    Object? manOfTheMatch = freezed,
    Object? totalOvers = freezed,
    Object? winningTeamId = freezed,
    Object? winningMargin = freezed,
    Object? marginType = freezed,
  }) {
    return _then(
      _$ScorecardModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        matchId: null == matchId
            ? _value.matchId
            : matchId // ignore: cast_nullable_to_non_nullable
                  as String,
        inningsData: null == inningsData
            ? _value._inningsData
            : inningsData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String?,
        manOfTheMatch: freezed == manOfTheMatch
            ? _value.manOfTheMatch
            : manOfTheMatch // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalOvers: freezed == totalOvers
            ? _value.totalOvers
            : totalOvers // ignore: cast_nullable_to_non_nullable
                  as int?,
        winningTeamId: freezed == winningTeamId
            ? _value.winningTeamId
            : winningTeamId // ignore: cast_nullable_to_non_nullable
                  as String?,
        winningMargin: freezed == winningMargin
            ? _value.winningMargin
            : winningMargin // ignore: cast_nullable_to_non_nullable
                  as int?,
        marginType: freezed == marginType
            ? _value.marginType
            : marginType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScorecardModelImpl implements _ScorecardModel {
  const _$ScorecardModelImpl({
    required this.id,
    required this.matchId,
    required final Map<String, dynamic> inningsData,
    this.result,
    this.manOfTheMatch,
    this.totalOvers,
    this.winningTeamId,
    this.winningMargin,
    this.marginType,
  }) : _inningsData = inningsData;

  factory _$ScorecardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScorecardModelImplFromJson(json);

  @override
  final String id;
  @override
  final String matchId;
  final Map<String, dynamic> _inningsData;
  @override
  Map<String, dynamic> get inningsData {
    if (_inningsData is EqualUnmodifiableMapView) return _inningsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_inningsData);
  }

  // JSON: batting, bowling, fall of wickets
  @override
  final String? result;
  @override
  final String? manOfTheMatch;
  @override
  final int? totalOvers;
  @override
  final String? winningTeamId;
  @override
  final int? winningMargin;
  @override
  final String? marginType;

  @override
  String toString() {
    return 'ScorecardModel(id: $id, matchId: $matchId, inningsData: $inningsData, result: $result, manOfTheMatch: $manOfTheMatch, totalOvers: $totalOvers, winningTeamId: $winningTeamId, winningMargin: $winningMargin, marginType: $marginType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScorecardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            const DeepCollectionEquality().equals(
              other._inningsData,
              _inningsData,
            ) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.manOfTheMatch, manOfTheMatch) ||
                other.manOfTheMatch == manOfTheMatch) &&
            (identical(other.totalOvers, totalOvers) ||
                other.totalOvers == totalOvers) &&
            (identical(other.winningTeamId, winningTeamId) ||
                other.winningTeamId == winningTeamId) &&
            (identical(other.winningMargin, winningMargin) ||
                other.winningMargin == winningMargin) &&
            (identical(other.marginType, marginType) ||
                other.marginType == marginType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    matchId,
    const DeepCollectionEquality().hash(_inningsData),
    result,
    manOfTheMatch,
    totalOvers,
    winningTeamId,
    winningMargin,
    marginType,
  );

  /// Create a copy of ScorecardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScorecardModelImplCopyWith<_$ScorecardModelImpl> get copyWith =>
      __$$ScorecardModelImplCopyWithImpl<_$ScorecardModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScorecardModelImplToJson(this);
  }
}

abstract class _ScorecardModel implements ScorecardModel {
  const factory _ScorecardModel({
    required final String id,
    required final String matchId,
    required final Map<String, dynamic> inningsData,
    final String? result,
    final String? manOfTheMatch,
    final int? totalOvers,
    final String? winningTeamId,
    final int? winningMargin,
    final String? marginType,
  }) = _$ScorecardModelImpl;

  factory _ScorecardModel.fromJson(Map<String, dynamic> json) =
      _$ScorecardModelImpl.fromJson;

  @override
  String get id;
  @override
  String get matchId;
  @override
  Map<String, dynamic> get inningsData; // JSON: batting, bowling, fall of wickets
  @override
  String? get result;
  @override
  String? get manOfTheMatch;
  @override
  int? get totalOvers;
  @override
  String? get winningTeamId;
  @override
  int? get winningMargin;
  @override
  String? get marginType;

  /// Create a copy of ScorecardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScorecardModelImplCopyWith<_$ScorecardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InningsData _$InningsDataFromJson(Map<String, dynamic> json) {
  return _InningsData.fromJson(json);
}

/// @nodoc
mixin _$InningsData {
  String get battingTeamId => throw _privateConstructorUsedError;
  String get bowlingTeamId => throw _privateConstructorUsedError;
  int get runs => throw _privateConstructorUsedError;
  int get wickets => throw _privateConstructorUsedError;
  double get overs => throw _privateConstructorUsedError;
  List<BatsmanStats> get batsmen => throw _privateConstructorUsedError;
  List<BowlerStats> get bowlers => throw _privateConstructorUsedError;
  List<FallOfWicket> get fallOfWickets => throw _privateConstructorUsedError;
  int? get extras => throw _privateConstructorUsedError;
  int? get extrasByes => throw _privateConstructorUsedError;
  int? get extrasLegByes => throw _privateConstructorUsedError;
  int? get extrasWides => throw _privateConstructorUsedError;
  int? get extrasNoBalls => throw _privateConstructorUsedError;

  /// Serializes this InningsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InningsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InningsDataCopyWith<InningsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InningsDataCopyWith<$Res> {
  factory $InningsDataCopyWith(
    InningsData value,
    $Res Function(InningsData) then,
  ) = _$InningsDataCopyWithImpl<$Res, InningsData>;
  @useResult
  $Res call({
    String battingTeamId,
    String bowlingTeamId,
    int runs,
    int wickets,
    double overs,
    List<BatsmanStats> batsmen,
    List<BowlerStats> bowlers,
    List<FallOfWicket> fallOfWickets,
    int? extras,
    int? extrasByes,
    int? extrasLegByes,
    int? extrasWides,
    int? extrasNoBalls,
  });
}

/// @nodoc
class _$InningsDataCopyWithImpl<$Res, $Val extends InningsData>
    implements $InningsDataCopyWith<$Res> {
  _$InningsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InningsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battingTeamId = null,
    Object? bowlingTeamId = null,
    Object? runs = null,
    Object? wickets = null,
    Object? overs = null,
    Object? batsmen = null,
    Object? bowlers = null,
    Object? fallOfWickets = null,
    Object? extras = freezed,
    Object? extrasByes = freezed,
    Object? extrasLegByes = freezed,
    Object? extrasWides = freezed,
    Object? extrasNoBalls = freezed,
  }) {
    return _then(
      _value.copyWith(
            battingTeamId: null == battingTeamId
                ? _value.battingTeamId
                : battingTeamId // ignore: cast_nullable_to_non_nullable
                      as String,
            bowlingTeamId: null == bowlingTeamId
                ? _value.bowlingTeamId
                : bowlingTeamId // ignore: cast_nullable_to_non_nullable
                      as String,
            runs: null == runs
                ? _value.runs
                : runs // ignore: cast_nullable_to_non_nullable
                      as int,
            wickets: null == wickets
                ? _value.wickets
                : wickets // ignore: cast_nullable_to_non_nullable
                      as int,
            overs: null == overs
                ? _value.overs
                : overs // ignore: cast_nullable_to_non_nullable
                      as double,
            batsmen: null == batsmen
                ? _value.batsmen
                : batsmen // ignore: cast_nullable_to_non_nullable
                      as List<BatsmanStats>,
            bowlers: null == bowlers
                ? _value.bowlers
                : bowlers // ignore: cast_nullable_to_non_nullable
                      as List<BowlerStats>,
            fallOfWickets: null == fallOfWickets
                ? _value.fallOfWickets
                : fallOfWickets // ignore: cast_nullable_to_non_nullable
                      as List<FallOfWicket>,
            extras: freezed == extras
                ? _value.extras
                : extras // ignore: cast_nullable_to_non_nullable
                      as int?,
            extrasByes: freezed == extrasByes
                ? _value.extrasByes
                : extrasByes // ignore: cast_nullable_to_non_nullable
                      as int?,
            extrasLegByes: freezed == extrasLegByes
                ? _value.extrasLegByes
                : extrasLegByes // ignore: cast_nullable_to_non_nullable
                      as int?,
            extrasWides: freezed == extrasWides
                ? _value.extrasWides
                : extrasWides // ignore: cast_nullable_to_non_nullable
                      as int?,
            extrasNoBalls: freezed == extrasNoBalls
                ? _value.extrasNoBalls
                : extrasNoBalls // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InningsDataImplCopyWith<$Res>
    implements $InningsDataCopyWith<$Res> {
  factory _$$InningsDataImplCopyWith(
    _$InningsDataImpl value,
    $Res Function(_$InningsDataImpl) then,
  ) = __$$InningsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String battingTeamId,
    String bowlingTeamId,
    int runs,
    int wickets,
    double overs,
    List<BatsmanStats> batsmen,
    List<BowlerStats> bowlers,
    List<FallOfWicket> fallOfWickets,
    int? extras,
    int? extrasByes,
    int? extrasLegByes,
    int? extrasWides,
    int? extrasNoBalls,
  });
}

/// @nodoc
class __$$InningsDataImplCopyWithImpl<$Res>
    extends _$InningsDataCopyWithImpl<$Res, _$InningsDataImpl>
    implements _$$InningsDataImplCopyWith<$Res> {
  __$$InningsDataImplCopyWithImpl(
    _$InningsDataImpl _value,
    $Res Function(_$InningsDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InningsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battingTeamId = null,
    Object? bowlingTeamId = null,
    Object? runs = null,
    Object? wickets = null,
    Object? overs = null,
    Object? batsmen = null,
    Object? bowlers = null,
    Object? fallOfWickets = null,
    Object? extras = freezed,
    Object? extrasByes = freezed,
    Object? extrasLegByes = freezed,
    Object? extrasWides = freezed,
    Object? extrasNoBalls = freezed,
  }) {
    return _then(
      _$InningsDataImpl(
        battingTeamId: null == battingTeamId
            ? _value.battingTeamId
            : battingTeamId // ignore: cast_nullable_to_non_nullable
                  as String,
        bowlingTeamId: null == bowlingTeamId
            ? _value.bowlingTeamId
            : bowlingTeamId // ignore: cast_nullable_to_non_nullable
                  as String,
        runs: null == runs
            ? _value.runs
            : runs // ignore: cast_nullable_to_non_nullable
                  as int,
        wickets: null == wickets
            ? _value.wickets
            : wickets // ignore: cast_nullable_to_non_nullable
                  as int,
        overs: null == overs
            ? _value.overs
            : overs // ignore: cast_nullable_to_non_nullable
                  as double,
        batsmen: null == batsmen
            ? _value._batsmen
            : batsmen // ignore: cast_nullable_to_non_nullable
                  as List<BatsmanStats>,
        bowlers: null == bowlers
            ? _value._bowlers
            : bowlers // ignore: cast_nullable_to_non_nullable
                  as List<BowlerStats>,
        fallOfWickets: null == fallOfWickets
            ? _value._fallOfWickets
            : fallOfWickets // ignore: cast_nullable_to_non_nullable
                  as List<FallOfWicket>,
        extras: freezed == extras
            ? _value.extras
            : extras // ignore: cast_nullable_to_non_nullable
                  as int?,
        extrasByes: freezed == extrasByes
            ? _value.extrasByes
            : extrasByes // ignore: cast_nullable_to_non_nullable
                  as int?,
        extrasLegByes: freezed == extrasLegByes
            ? _value.extrasLegByes
            : extrasLegByes // ignore: cast_nullable_to_non_nullable
                  as int?,
        extrasWides: freezed == extrasWides
            ? _value.extrasWides
            : extrasWides // ignore: cast_nullable_to_non_nullable
                  as int?,
        extrasNoBalls: freezed == extrasNoBalls
            ? _value.extrasNoBalls
            : extrasNoBalls // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InningsDataImpl implements _InningsData {
  const _$InningsDataImpl({
    required this.battingTeamId,
    required this.bowlingTeamId,
    this.runs = 0,
    this.wickets = 0,
    this.overs = 0.0,
    final List<BatsmanStats> batsmen = const [],
    final List<BowlerStats> bowlers = const [],
    final List<FallOfWicket> fallOfWickets = const [],
    this.extras,
    this.extrasByes,
    this.extrasLegByes,
    this.extrasWides,
    this.extrasNoBalls,
  }) : _batsmen = batsmen,
       _bowlers = bowlers,
       _fallOfWickets = fallOfWickets;

  factory _$InningsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$InningsDataImplFromJson(json);

  @override
  final String battingTeamId;
  @override
  final String bowlingTeamId;
  @override
  @JsonKey()
  final int runs;
  @override
  @JsonKey()
  final int wickets;
  @override
  @JsonKey()
  final double overs;
  final List<BatsmanStats> _batsmen;
  @override
  @JsonKey()
  List<BatsmanStats> get batsmen {
    if (_batsmen is EqualUnmodifiableListView) return _batsmen;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batsmen);
  }

  final List<BowlerStats> _bowlers;
  @override
  @JsonKey()
  List<BowlerStats> get bowlers {
    if (_bowlers is EqualUnmodifiableListView) return _bowlers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bowlers);
  }

  final List<FallOfWicket> _fallOfWickets;
  @override
  @JsonKey()
  List<FallOfWicket> get fallOfWickets {
    if (_fallOfWickets is EqualUnmodifiableListView) return _fallOfWickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fallOfWickets);
  }

  @override
  final int? extras;
  @override
  final int? extrasByes;
  @override
  final int? extrasLegByes;
  @override
  final int? extrasWides;
  @override
  final int? extrasNoBalls;

  @override
  String toString() {
    return 'InningsData(battingTeamId: $battingTeamId, bowlingTeamId: $bowlingTeamId, runs: $runs, wickets: $wickets, overs: $overs, batsmen: $batsmen, bowlers: $bowlers, fallOfWickets: $fallOfWickets, extras: $extras, extrasByes: $extrasByes, extrasLegByes: $extrasLegByes, extrasWides: $extrasWides, extrasNoBalls: $extrasNoBalls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InningsDataImpl &&
            (identical(other.battingTeamId, battingTeamId) ||
                other.battingTeamId == battingTeamId) &&
            (identical(other.bowlingTeamId, bowlingTeamId) ||
                other.bowlingTeamId == bowlingTeamId) &&
            (identical(other.runs, runs) || other.runs == runs) &&
            (identical(other.wickets, wickets) || other.wickets == wickets) &&
            (identical(other.overs, overs) || other.overs == overs) &&
            const DeepCollectionEquality().equals(other._batsmen, _batsmen) &&
            const DeepCollectionEquality().equals(other._bowlers, _bowlers) &&
            const DeepCollectionEquality().equals(
              other._fallOfWickets,
              _fallOfWickets,
            ) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.extrasByes, extrasByes) ||
                other.extrasByes == extrasByes) &&
            (identical(other.extrasLegByes, extrasLegByes) ||
                other.extrasLegByes == extrasLegByes) &&
            (identical(other.extrasWides, extrasWides) ||
                other.extrasWides == extrasWides) &&
            (identical(other.extrasNoBalls, extrasNoBalls) ||
                other.extrasNoBalls == extrasNoBalls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    battingTeamId,
    bowlingTeamId,
    runs,
    wickets,
    overs,
    const DeepCollectionEquality().hash(_batsmen),
    const DeepCollectionEquality().hash(_bowlers),
    const DeepCollectionEquality().hash(_fallOfWickets),
    extras,
    extrasByes,
    extrasLegByes,
    extrasWides,
    extrasNoBalls,
  );

  /// Create a copy of InningsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InningsDataImplCopyWith<_$InningsDataImpl> get copyWith =>
      __$$InningsDataImplCopyWithImpl<_$InningsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InningsDataImplToJson(this);
  }
}

abstract class _InningsData implements InningsData {
  const factory _InningsData({
    required final String battingTeamId,
    required final String bowlingTeamId,
    final int runs,
    final int wickets,
    final double overs,
    final List<BatsmanStats> batsmen,
    final List<BowlerStats> bowlers,
    final List<FallOfWicket> fallOfWickets,
    final int? extras,
    final int? extrasByes,
    final int? extrasLegByes,
    final int? extrasWides,
    final int? extrasNoBalls,
  }) = _$InningsDataImpl;

  factory _InningsData.fromJson(Map<String, dynamic> json) =
      _$InningsDataImpl.fromJson;

  @override
  String get battingTeamId;
  @override
  String get bowlingTeamId;
  @override
  int get runs;
  @override
  int get wickets;
  @override
  double get overs;
  @override
  List<BatsmanStats> get batsmen;
  @override
  List<BowlerStats> get bowlers;
  @override
  List<FallOfWicket> get fallOfWickets;
  @override
  int? get extras;
  @override
  int? get extrasByes;
  @override
  int? get extrasLegByes;
  @override
  int? get extrasWides;
  @override
  int? get extrasNoBalls;

  /// Create a copy of InningsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InningsDataImplCopyWith<_$InningsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatsmanStats _$BatsmanStatsFromJson(Map<String, dynamic> json) {
  return _BatsmanStats.fromJson(json);
}

/// @nodoc
mixin _$BatsmanStats {
  String get playerId => throw _privateConstructorUsedError;
  String? get playerName => throw _privateConstructorUsedError;
  int get runs => throw _privateConstructorUsedError;
  int get balls => throw _privateConstructorUsedError;
  int get fours => throw _privateConstructorUsedError;
  int get sixes => throw _privateConstructorUsedError;
  double get strikeRate => throw _privateConstructorUsedError;
  String? get dismissal =>
      throw _privateConstructorUsedError; // bowled, caught, run out, lbw, etc.
  String? get bowlerId => throw _privateConstructorUsedError;
  String? get fielderId => throw _privateConstructorUsedError;
  bool get notOut => throw _privateConstructorUsedError;

  /// Serializes this BatsmanStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatsmanStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatsmanStatsCopyWith<BatsmanStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatsmanStatsCopyWith<$Res> {
  factory $BatsmanStatsCopyWith(
    BatsmanStats value,
    $Res Function(BatsmanStats) then,
  ) = _$BatsmanStatsCopyWithImpl<$Res, BatsmanStats>;
  @useResult
  $Res call({
    String playerId,
    String? playerName,
    int runs,
    int balls,
    int fours,
    int sixes,
    double strikeRate,
    String? dismissal,
    String? bowlerId,
    String? fielderId,
    bool notOut,
  });
}

/// @nodoc
class _$BatsmanStatsCopyWithImpl<$Res, $Val extends BatsmanStats>
    implements $BatsmanStatsCopyWith<$Res> {
  _$BatsmanStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatsmanStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = freezed,
    Object? runs = null,
    Object? balls = null,
    Object? fours = null,
    Object? sixes = null,
    Object? strikeRate = null,
    Object? dismissal = freezed,
    Object? bowlerId = freezed,
    Object? fielderId = freezed,
    Object? notOut = null,
  }) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
            playerName: freezed == playerName
                ? _value.playerName
                : playerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            runs: null == runs
                ? _value.runs
                : runs // ignore: cast_nullable_to_non_nullable
                      as int,
            balls: null == balls
                ? _value.balls
                : balls // ignore: cast_nullable_to_non_nullable
                      as int,
            fours: null == fours
                ? _value.fours
                : fours // ignore: cast_nullable_to_non_nullable
                      as int,
            sixes: null == sixes
                ? _value.sixes
                : sixes // ignore: cast_nullable_to_non_nullable
                      as int,
            strikeRate: null == strikeRate
                ? _value.strikeRate
                : strikeRate // ignore: cast_nullable_to_non_nullable
                      as double,
            dismissal: freezed == dismissal
                ? _value.dismissal
                : dismissal // ignore: cast_nullable_to_non_nullable
                      as String?,
            bowlerId: freezed == bowlerId
                ? _value.bowlerId
                : bowlerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fielderId: freezed == fielderId
                ? _value.fielderId
                : fielderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            notOut: null == notOut
                ? _value.notOut
                : notOut // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BatsmanStatsImplCopyWith<$Res>
    implements $BatsmanStatsCopyWith<$Res> {
  factory _$$BatsmanStatsImplCopyWith(
    _$BatsmanStatsImpl value,
    $Res Function(_$BatsmanStatsImpl) then,
  ) = __$$BatsmanStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String playerId,
    String? playerName,
    int runs,
    int balls,
    int fours,
    int sixes,
    double strikeRate,
    String? dismissal,
    String? bowlerId,
    String? fielderId,
    bool notOut,
  });
}

/// @nodoc
class __$$BatsmanStatsImplCopyWithImpl<$Res>
    extends _$BatsmanStatsCopyWithImpl<$Res, _$BatsmanStatsImpl>
    implements _$$BatsmanStatsImplCopyWith<$Res> {
  __$$BatsmanStatsImplCopyWithImpl(
    _$BatsmanStatsImpl _value,
    $Res Function(_$BatsmanStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BatsmanStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = freezed,
    Object? runs = null,
    Object? balls = null,
    Object? fours = null,
    Object? sixes = null,
    Object? strikeRate = null,
    Object? dismissal = freezed,
    Object? bowlerId = freezed,
    Object? fielderId = freezed,
    Object? notOut = null,
  }) {
    return _then(
      _$BatsmanStatsImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        playerName: freezed == playerName
            ? _value.playerName
            : playerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        runs: null == runs
            ? _value.runs
            : runs // ignore: cast_nullable_to_non_nullable
                  as int,
        balls: null == balls
            ? _value.balls
            : balls // ignore: cast_nullable_to_non_nullable
                  as int,
        fours: null == fours
            ? _value.fours
            : fours // ignore: cast_nullable_to_non_nullable
                  as int,
        sixes: null == sixes
            ? _value.sixes
            : sixes // ignore: cast_nullable_to_non_nullable
                  as int,
        strikeRate: null == strikeRate
            ? _value.strikeRate
            : strikeRate // ignore: cast_nullable_to_non_nullable
                  as double,
        dismissal: freezed == dismissal
            ? _value.dismissal
            : dismissal // ignore: cast_nullable_to_non_nullable
                  as String?,
        bowlerId: freezed == bowlerId
            ? _value.bowlerId
            : bowlerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fielderId: freezed == fielderId
            ? _value.fielderId
            : fielderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        notOut: null == notOut
            ? _value.notOut
            : notOut // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BatsmanStatsImpl implements _BatsmanStats {
  const _$BatsmanStatsImpl({
    required this.playerId,
    this.playerName,
    this.runs = 0,
    this.balls = 0,
    this.fours = 0,
    this.sixes = 0,
    this.strikeRate = 0.0,
    this.dismissal,
    this.bowlerId,
    this.fielderId,
    this.notOut = false,
  });

  factory _$BatsmanStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatsmanStatsImplFromJson(json);

  @override
  final String playerId;
  @override
  final String? playerName;
  @override
  @JsonKey()
  final int runs;
  @override
  @JsonKey()
  final int balls;
  @override
  @JsonKey()
  final int fours;
  @override
  @JsonKey()
  final int sixes;
  @override
  @JsonKey()
  final double strikeRate;
  @override
  final String? dismissal;
  // bowled, caught, run out, lbw, etc.
  @override
  final String? bowlerId;
  @override
  final String? fielderId;
  @override
  @JsonKey()
  final bool notOut;

  @override
  String toString() {
    return 'BatsmanStats(playerId: $playerId, playerName: $playerName, runs: $runs, balls: $balls, fours: $fours, sixes: $sixes, strikeRate: $strikeRate, dismissal: $dismissal, bowlerId: $bowlerId, fielderId: $fielderId, notOut: $notOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatsmanStatsImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.runs, runs) || other.runs == runs) &&
            (identical(other.balls, balls) || other.balls == balls) &&
            (identical(other.fours, fours) || other.fours == fours) &&
            (identical(other.sixes, sixes) || other.sixes == sixes) &&
            (identical(other.strikeRate, strikeRate) ||
                other.strikeRate == strikeRate) &&
            (identical(other.dismissal, dismissal) ||
                other.dismissal == dismissal) &&
            (identical(other.bowlerId, bowlerId) ||
                other.bowlerId == bowlerId) &&
            (identical(other.fielderId, fielderId) ||
                other.fielderId == fielderId) &&
            (identical(other.notOut, notOut) || other.notOut == notOut));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerId,
    playerName,
    runs,
    balls,
    fours,
    sixes,
    strikeRate,
    dismissal,
    bowlerId,
    fielderId,
    notOut,
  );

  /// Create a copy of BatsmanStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatsmanStatsImplCopyWith<_$BatsmanStatsImpl> get copyWith =>
      __$$BatsmanStatsImplCopyWithImpl<_$BatsmanStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatsmanStatsImplToJson(this);
  }
}

abstract class _BatsmanStats implements BatsmanStats {
  const factory _BatsmanStats({
    required final String playerId,
    final String? playerName,
    final int runs,
    final int balls,
    final int fours,
    final int sixes,
    final double strikeRate,
    final String? dismissal,
    final String? bowlerId,
    final String? fielderId,
    final bool notOut,
  }) = _$BatsmanStatsImpl;

  factory _BatsmanStats.fromJson(Map<String, dynamic> json) =
      _$BatsmanStatsImpl.fromJson;

  @override
  String get playerId;
  @override
  String? get playerName;
  @override
  int get runs;
  @override
  int get balls;
  @override
  int get fours;
  @override
  int get sixes;
  @override
  double get strikeRate;
  @override
  String? get dismissal; // bowled, caught, run out, lbw, etc.
  @override
  String? get bowlerId;
  @override
  String? get fielderId;
  @override
  bool get notOut;

  /// Create a copy of BatsmanStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatsmanStatsImplCopyWith<_$BatsmanStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BowlerStats _$BowlerStatsFromJson(Map<String, dynamic> json) {
  return _BowlerStats.fromJson(json);
}

/// @nodoc
mixin _$BowlerStats {
  String get playerId => throw _privateConstructorUsedError;
  String? get playerName => throw _privateConstructorUsedError;
  double get overs => throw _privateConstructorUsedError;
  int get maidens => throw _privateConstructorUsedError;
  int get runs => throw _privateConstructorUsedError;
  int get wickets => throw _privateConstructorUsedError;
  double get economy => throw _privateConstructorUsedError;
  int get wides => throw _privateConstructorUsedError;
  int get noBalls => throw _privateConstructorUsedError;

  /// Serializes this BowlerStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BowlerStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BowlerStatsCopyWith<BowlerStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BowlerStatsCopyWith<$Res> {
  factory $BowlerStatsCopyWith(
    BowlerStats value,
    $Res Function(BowlerStats) then,
  ) = _$BowlerStatsCopyWithImpl<$Res, BowlerStats>;
  @useResult
  $Res call({
    String playerId,
    String? playerName,
    double overs,
    int maidens,
    int runs,
    int wickets,
    double economy,
    int wides,
    int noBalls,
  });
}

/// @nodoc
class _$BowlerStatsCopyWithImpl<$Res, $Val extends BowlerStats>
    implements $BowlerStatsCopyWith<$Res> {
  _$BowlerStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BowlerStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = freezed,
    Object? overs = null,
    Object? maidens = null,
    Object? runs = null,
    Object? wickets = null,
    Object? economy = null,
    Object? wides = null,
    Object? noBalls = null,
  }) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
            playerName: freezed == playerName
                ? _value.playerName
                : playerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            overs: null == overs
                ? _value.overs
                : overs // ignore: cast_nullable_to_non_nullable
                      as double,
            maidens: null == maidens
                ? _value.maidens
                : maidens // ignore: cast_nullable_to_non_nullable
                      as int,
            runs: null == runs
                ? _value.runs
                : runs // ignore: cast_nullable_to_non_nullable
                      as int,
            wickets: null == wickets
                ? _value.wickets
                : wickets // ignore: cast_nullable_to_non_nullable
                      as int,
            economy: null == economy
                ? _value.economy
                : economy // ignore: cast_nullable_to_non_nullable
                      as double,
            wides: null == wides
                ? _value.wides
                : wides // ignore: cast_nullable_to_non_nullable
                      as int,
            noBalls: null == noBalls
                ? _value.noBalls
                : noBalls // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BowlerStatsImplCopyWith<$Res>
    implements $BowlerStatsCopyWith<$Res> {
  factory _$$BowlerStatsImplCopyWith(
    _$BowlerStatsImpl value,
    $Res Function(_$BowlerStatsImpl) then,
  ) = __$$BowlerStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String playerId,
    String? playerName,
    double overs,
    int maidens,
    int runs,
    int wickets,
    double economy,
    int wides,
    int noBalls,
  });
}

/// @nodoc
class __$$BowlerStatsImplCopyWithImpl<$Res>
    extends _$BowlerStatsCopyWithImpl<$Res, _$BowlerStatsImpl>
    implements _$$BowlerStatsImplCopyWith<$Res> {
  __$$BowlerStatsImplCopyWithImpl(
    _$BowlerStatsImpl _value,
    $Res Function(_$BowlerStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BowlerStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = freezed,
    Object? overs = null,
    Object? maidens = null,
    Object? runs = null,
    Object? wickets = null,
    Object? economy = null,
    Object? wides = null,
    Object? noBalls = null,
  }) {
    return _then(
      _$BowlerStatsImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        playerName: freezed == playerName
            ? _value.playerName
            : playerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        overs: null == overs
            ? _value.overs
            : overs // ignore: cast_nullable_to_non_nullable
                  as double,
        maidens: null == maidens
            ? _value.maidens
            : maidens // ignore: cast_nullable_to_non_nullable
                  as int,
        runs: null == runs
            ? _value.runs
            : runs // ignore: cast_nullable_to_non_nullable
                  as int,
        wickets: null == wickets
            ? _value.wickets
            : wickets // ignore: cast_nullable_to_non_nullable
                  as int,
        economy: null == economy
            ? _value.economy
            : economy // ignore: cast_nullable_to_non_nullable
                  as double,
        wides: null == wides
            ? _value.wides
            : wides // ignore: cast_nullable_to_non_nullable
                  as int,
        noBalls: null == noBalls
            ? _value.noBalls
            : noBalls // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BowlerStatsImpl implements _BowlerStats {
  const _$BowlerStatsImpl({
    required this.playerId,
    this.playerName,
    this.overs = 0.0,
    this.maidens = 0,
    this.runs = 0,
    this.wickets = 0,
    this.economy = 0.0,
    this.wides = 0,
    this.noBalls = 0,
  });

  factory _$BowlerStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BowlerStatsImplFromJson(json);

  @override
  final String playerId;
  @override
  final String? playerName;
  @override
  @JsonKey()
  final double overs;
  @override
  @JsonKey()
  final int maidens;
  @override
  @JsonKey()
  final int runs;
  @override
  @JsonKey()
  final int wickets;
  @override
  @JsonKey()
  final double economy;
  @override
  @JsonKey()
  final int wides;
  @override
  @JsonKey()
  final int noBalls;

  @override
  String toString() {
    return 'BowlerStats(playerId: $playerId, playerName: $playerName, overs: $overs, maidens: $maidens, runs: $runs, wickets: $wickets, economy: $economy, wides: $wides, noBalls: $noBalls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BowlerStatsImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.overs, overs) || other.overs == overs) &&
            (identical(other.maidens, maidens) || other.maidens == maidens) &&
            (identical(other.runs, runs) || other.runs == runs) &&
            (identical(other.wickets, wickets) || other.wickets == wickets) &&
            (identical(other.economy, economy) || other.economy == economy) &&
            (identical(other.wides, wides) || other.wides == wides) &&
            (identical(other.noBalls, noBalls) || other.noBalls == noBalls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerId,
    playerName,
    overs,
    maidens,
    runs,
    wickets,
    economy,
    wides,
    noBalls,
  );

  /// Create a copy of BowlerStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BowlerStatsImplCopyWith<_$BowlerStatsImpl> get copyWith =>
      __$$BowlerStatsImplCopyWithImpl<_$BowlerStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BowlerStatsImplToJson(this);
  }
}

abstract class _BowlerStats implements BowlerStats {
  const factory _BowlerStats({
    required final String playerId,
    final String? playerName,
    final double overs,
    final int maidens,
    final int runs,
    final int wickets,
    final double economy,
    final int wides,
    final int noBalls,
  }) = _$BowlerStatsImpl;

  factory _BowlerStats.fromJson(Map<String, dynamic> json) =
      _$BowlerStatsImpl.fromJson;

  @override
  String get playerId;
  @override
  String? get playerName;
  @override
  double get overs;
  @override
  int get maidens;
  @override
  int get runs;
  @override
  int get wickets;
  @override
  double get economy;
  @override
  int get wides;
  @override
  int get noBalls;

  /// Create a copy of BowlerStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BowlerStatsImplCopyWith<_$BowlerStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FallOfWicket _$FallOfWicketFromJson(Map<String, dynamic> json) {
  return _FallOfWicket.fromJson(json);
}

/// @nodoc
mixin _$FallOfWicket {
  String get batsmanId => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  double get over => throw _privateConstructorUsedError;
  int get wicketNumber => throw _privateConstructorUsedError;

  /// Serializes this FallOfWicket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FallOfWicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FallOfWicketCopyWith<FallOfWicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FallOfWicketCopyWith<$Res> {
  factory $FallOfWicketCopyWith(
    FallOfWicket value,
    $Res Function(FallOfWicket) then,
  ) = _$FallOfWicketCopyWithImpl<$Res, FallOfWicket>;
  @useResult
  $Res call({String batsmanId, int score, double over, int wicketNumber});
}

/// @nodoc
class _$FallOfWicketCopyWithImpl<$Res, $Val extends FallOfWicket>
    implements $FallOfWicketCopyWith<$Res> {
  _$FallOfWicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FallOfWicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batsmanId = null,
    Object? score = null,
    Object? over = null,
    Object? wicketNumber = null,
  }) {
    return _then(
      _value.copyWith(
            batsmanId: null == batsmanId
                ? _value.batsmanId
                : batsmanId // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
            over: null == over
                ? _value.over
                : over // ignore: cast_nullable_to_non_nullable
                      as double,
            wicketNumber: null == wicketNumber
                ? _value.wicketNumber
                : wicketNumber // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FallOfWicketImplCopyWith<$Res>
    implements $FallOfWicketCopyWith<$Res> {
  factory _$$FallOfWicketImplCopyWith(
    _$FallOfWicketImpl value,
    $Res Function(_$FallOfWicketImpl) then,
  ) = __$$FallOfWicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String batsmanId, int score, double over, int wicketNumber});
}

/// @nodoc
class __$$FallOfWicketImplCopyWithImpl<$Res>
    extends _$FallOfWicketCopyWithImpl<$Res, _$FallOfWicketImpl>
    implements _$$FallOfWicketImplCopyWith<$Res> {
  __$$FallOfWicketImplCopyWithImpl(
    _$FallOfWicketImpl _value,
    $Res Function(_$FallOfWicketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FallOfWicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batsmanId = null,
    Object? score = null,
    Object? over = null,
    Object? wicketNumber = null,
  }) {
    return _then(
      _$FallOfWicketImpl(
        batsmanId: null == batsmanId
            ? _value.batsmanId
            : batsmanId // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        over: null == over
            ? _value.over
            : over // ignore: cast_nullable_to_non_nullable
                  as double,
        wicketNumber: null == wicketNumber
            ? _value.wicketNumber
            : wicketNumber // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FallOfWicketImpl implements _FallOfWicket {
  const _$FallOfWicketImpl({
    required this.batsmanId,
    required this.score,
    required this.over,
    this.wicketNumber = 1,
  });

  factory _$FallOfWicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$FallOfWicketImplFromJson(json);

  @override
  final String batsmanId;
  @override
  final int score;
  @override
  final double over;
  @override
  @JsonKey()
  final int wicketNumber;

  @override
  String toString() {
    return 'FallOfWicket(batsmanId: $batsmanId, score: $score, over: $over, wicketNumber: $wicketNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FallOfWicketImpl &&
            (identical(other.batsmanId, batsmanId) ||
                other.batsmanId == batsmanId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.over, over) || other.over == over) &&
            (identical(other.wicketNumber, wicketNumber) ||
                other.wicketNumber == wicketNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, batsmanId, score, over, wicketNumber);

  /// Create a copy of FallOfWicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FallOfWicketImplCopyWith<_$FallOfWicketImpl> get copyWith =>
      __$$FallOfWicketImplCopyWithImpl<_$FallOfWicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FallOfWicketImplToJson(this);
  }
}

abstract class _FallOfWicket implements FallOfWicket {
  const factory _FallOfWicket({
    required final String batsmanId,
    required final int score,
    required final double over,
    final int wicketNumber,
  }) = _$FallOfWicketImpl;

  factory _FallOfWicket.fromJson(Map<String, dynamic> json) =
      _$FallOfWicketImpl.fromJson;

  @override
  String get batsmanId;
  @override
  int get score;
  @override
  double get over;
  @override
  int get wicketNumber;

  /// Create a copy of FallOfWicket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FallOfWicketImplCopyWith<_$FallOfWicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
