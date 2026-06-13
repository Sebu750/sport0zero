// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ball_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BallEventModel _$BallEventModelFromJson(Map<String, dynamic> json) {
  return _BallEventModel.fromJson(json);
}

/// @nodoc
mixin _$BallEventModel {
  String get id => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  int get inningsNumber => throw _privateConstructorUsedError;
  int get overNo => throw _privateConstructorUsedError;
  int get ballNo => throw _privateConstructorUsedError;
  int get runs => throw _privateConstructorUsedError;
  ExtraType get extraType => throw _privateConstructorUsedError;
  int get extraRuns => throw _privateConstructorUsedError;
  WicketType get wicketType => throw _privateConstructorUsedError;
  String? get batsmanId => throw _privateConstructorUsedError;
  String? get bowlerId => throw _privateConstructorUsedError;
  String? get fielderId => throw _privateConstructorUsedError;
  String? get nonStrikerId => throw _privateConstructorUsedError;
  bool get isWicket => throw _privateConstructorUsedError;
  bool get isBoundary => throw _privateConstructorUsedError;
  bool get isSix => throw _privateConstructorUsedError;
  String? get commentary => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this BallEventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BallEventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BallEventModelCopyWith<BallEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BallEventModelCopyWith<$Res> {
  factory $BallEventModelCopyWith(
    BallEventModel value,
    $Res Function(BallEventModel) then,
  ) = _$BallEventModelCopyWithImpl<$Res, BallEventModel>;
  @useResult
  $Res call({
    String id,
    String matchId,
    int inningsNumber,
    int overNo,
    int ballNo,
    int runs,
    ExtraType extraType,
    int extraRuns,
    WicketType wicketType,
    String? batsmanId,
    String? bowlerId,
    String? fielderId,
    String? nonStrikerId,
    bool isWicket,
    bool isBoundary,
    bool isSix,
    String? commentary,
    DateTime? timestamp,
  });
}

/// @nodoc
class _$BallEventModelCopyWithImpl<$Res, $Val extends BallEventModel>
    implements $BallEventModelCopyWith<$Res> {
  _$BallEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BallEventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? inningsNumber = null,
    Object? overNo = null,
    Object? ballNo = null,
    Object? runs = null,
    Object? extraType = null,
    Object? extraRuns = null,
    Object? wicketType = null,
    Object? batsmanId = freezed,
    Object? bowlerId = freezed,
    Object? fielderId = freezed,
    Object? nonStrikerId = freezed,
    Object? isWicket = null,
    Object? isBoundary = null,
    Object? isSix = null,
    Object? commentary = freezed,
    Object? timestamp = freezed,
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
            inningsNumber: null == inningsNumber
                ? _value.inningsNumber
                : inningsNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            overNo: null == overNo
                ? _value.overNo
                : overNo // ignore: cast_nullable_to_non_nullable
                      as int,
            ballNo: null == ballNo
                ? _value.ballNo
                : ballNo // ignore: cast_nullable_to_non_nullable
                      as int,
            runs: null == runs
                ? _value.runs
                : runs // ignore: cast_nullable_to_non_nullable
                      as int,
            extraType: null == extraType
                ? _value.extraType
                : extraType // ignore: cast_nullable_to_non_nullable
                      as ExtraType,
            extraRuns: null == extraRuns
                ? _value.extraRuns
                : extraRuns // ignore: cast_nullable_to_non_nullable
                      as int,
            wicketType: null == wicketType
                ? _value.wicketType
                : wicketType // ignore: cast_nullable_to_non_nullable
                      as WicketType,
            batsmanId: freezed == batsmanId
                ? _value.batsmanId
                : batsmanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bowlerId: freezed == bowlerId
                ? _value.bowlerId
                : bowlerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fielderId: freezed == fielderId
                ? _value.fielderId
                : fielderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            nonStrikerId: freezed == nonStrikerId
                ? _value.nonStrikerId
                : nonStrikerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isWicket: null == isWicket
                ? _value.isWicket
                : isWicket // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBoundary: null == isBoundary
                ? _value.isBoundary
                : isBoundary // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSix: null == isSix
                ? _value.isSix
                : isSix // ignore: cast_nullable_to_non_nullable
                      as bool,
            commentary: freezed == commentary
                ? _value.commentary
                : commentary // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BallEventModelImplCopyWith<$Res>
    implements $BallEventModelCopyWith<$Res> {
  factory _$$BallEventModelImplCopyWith(
    _$BallEventModelImpl value,
    $Res Function(_$BallEventModelImpl) then,
  ) = __$$BallEventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String matchId,
    int inningsNumber,
    int overNo,
    int ballNo,
    int runs,
    ExtraType extraType,
    int extraRuns,
    WicketType wicketType,
    String? batsmanId,
    String? bowlerId,
    String? fielderId,
    String? nonStrikerId,
    bool isWicket,
    bool isBoundary,
    bool isSix,
    String? commentary,
    DateTime? timestamp,
  });
}

/// @nodoc
class __$$BallEventModelImplCopyWithImpl<$Res>
    extends _$BallEventModelCopyWithImpl<$Res, _$BallEventModelImpl>
    implements _$$BallEventModelImplCopyWith<$Res> {
  __$$BallEventModelImplCopyWithImpl(
    _$BallEventModelImpl _value,
    $Res Function(_$BallEventModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BallEventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? inningsNumber = null,
    Object? overNo = null,
    Object? ballNo = null,
    Object? runs = null,
    Object? extraType = null,
    Object? extraRuns = null,
    Object? wicketType = null,
    Object? batsmanId = freezed,
    Object? bowlerId = freezed,
    Object? fielderId = freezed,
    Object? nonStrikerId = freezed,
    Object? isWicket = null,
    Object? isBoundary = null,
    Object? isSix = null,
    Object? commentary = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _$BallEventModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        matchId: null == matchId
            ? _value.matchId
            : matchId // ignore: cast_nullable_to_non_nullable
                  as String,
        inningsNumber: null == inningsNumber
            ? _value.inningsNumber
            : inningsNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        overNo: null == overNo
            ? _value.overNo
            : overNo // ignore: cast_nullable_to_non_nullable
                  as int,
        ballNo: null == ballNo
            ? _value.ballNo
            : ballNo // ignore: cast_nullable_to_non_nullable
                  as int,
        runs: null == runs
            ? _value.runs
            : runs // ignore: cast_nullable_to_non_nullable
                  as int,
        extraType: null == extraType
            ? _value.extraType
            : extraType // ignore: cast_nullable_to_non_nullable
                  as ExtraType,
        extraRuns: null == extraRuns
            ? _value.extraRuns
            : extraRuns // ignore: cast_nullable_to_non_nullable
                  as int,
        wicketType: null == wicketType
            ? _value.wicketType
            : wicketType // ignore: cast_nullable_to_non_nullable
                  as WicketType,
        batsmanId: freezed == batsmanId
            ? _value.batsmanId
            : batsmanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bowlerId: freezed == bowlerId
            ? _value.bowlerId
            : bowlerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fielderId: freezed == fielderId
            ? _value.fielderId
            : fielderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        nonStrikerId: freezed == nonStrikerId
            ? _value.nonStrikerId
            : nonStrikerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isWicket: null == isWicket
            ? _value.isWicket
            : isWicket // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBoundary: null == isBoundary
            ? _value.isBoundary
            : isBoundary // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSix: null == isSix
            ? _value.isSix
            : isSix // ignore: cast_nullable_to_non_nullable
                  as bool,
        commentary: freezed == commentary
            ? _value.commentary
            : commentary // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BallEventModelImpl implements _BallEventModel {
  const _$BallEventModelImpl({
    required this.id,
    required this.matchId,
    required this.inningsNumber,
    required this.overNo,
    required this.ballNo,
    this.runs = 0,
    this.extraType = ExtraType.none,
    this.extraRuns = 0,
    this.wicketType = WicketType.none,
    this.batsmanId,
    this.bowlerId,
    this.fielderId,
    this.nonStrikerId,
    this.isWicket = false,
    this.isBoundary = false,
    this.isSix = false,
    this.commentary,
    this.timestamp,
  });

  factory _$BallEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BallEventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String matchId;
  @override
  final int inningsNumber;
  @override
  final int overNo;
  @override
  final int ballNo;
  @override
  @JsonKey()
  final int runs;
  @override
  @JsonKey()
  final ExtraType extraType;
  @override
  @JsonKey()
  final int extraRuns;
  @override
  @JsonKey()
  final WicketType wicketType;
  @override
  final String? batsmanId;
  @override
  final String? bowlerId;
  @override
  final String? fielderId;
  @override
  final String? nonStrikerId;
  @override
  @JsonKey()
  final bool isWicket;
  @override
  @JsonKey()
  final bool isBoundary;
  @override
  @JsonKey()
  final bool isSix;
  @override
  final String? commentary;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'BallEventModel(id: $id, matchId: $matchId, inningsNumber: $inningsNumber, overNo: $overNo, ballNo: $ballNo, runs: $runs, extraType: $extraType, extraRuns: $extraRuns, wicketType: $wicketType, batsmanId: $batsmanId, bowlerId: $bowlerId, fielderId: $fielderId, nonStrikerId: $nonStrikerId, isWicket: $isWicket, isBoundary: $isBoundary, isSix: $isSix, commentary: $commentary, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BallEventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.inningsNumber, inningsNumber) ||
                other.inningsNumber == inningsNumber) &&
            (identical(other.overNo, overNo) || other.overNo == overNo) &&
            (identical(other.ballNo, ballNo) || other.ballNo == ballNo) &&
            (identical(other.runs, runs) || other.runs == runs) &&
            (identical(other.extraType, extraType) ||
                other.extraType == extraType) &&
            (identical(other.extraRuns, extraRuns) ||
                other.extraRuns == extraRuns) &&
            (identical(other.wicketType, wicketType) ||
                other.wicketType == wicketType) &&
            (identical(other.batsmanId, batsmanId) ||
                other.batsmanId == batsmanId) &&
            (identical(other.bowlerId, bowlerId) ||
                other.bowlerId == bowlerId) &&
            (identical(other.fielderId, fielderId) ||
                other.fielderId == fielderId) &&
            (identical(other.nonStrikerId, nonStrikerId) ||
                other.nonStrikerId == nonStrikerId) &&
            (identical(other.isWicket, isWicket) ||
                other.isWicket == isWicket) &&
            (identical(other.isBoundary, isBoundary) ||
                other.isBoundary == isBoundary) &&
            (identical(other.isSix, isSix) || other.isSix == isSix) &&
            (identical(other.commentary, commentary) ||
                other.commentary == commentary) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    matchId,
    inningsNumber,
    overNo,
    ballNo,
    runs,
    extraType,
    extraRuns,
    wicketType,
    batsmanId,
    bowlerId,
    fielderId,
    nonStrikerId,
    isWicket,
    isBoundary,
    isSix,
    commentary,
    timestamp,
  );

  /// Create a copy of BallEventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BallEventModelImplCopyWith<_$BallEventModelImpl> get copyWith =>
      __$$BallEventModelImplCopyWithImpl<_$BallEventModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BallEventModelImplToJson(this);
  }
}

abstract class _BallEventModel implements BallEventModel {
  const factory _BallEventModel({
    required final String id,
    required final String matchId,
    required final int inningsNumber,
    required final int overNo,
    required final int ballNo,
    final int runs,
    final ExtraType extraType,
    final int extraRuns,
    final WicketType wicketType,
    final String? batsmanId,
    final String? bowlerId,
    final String? fielderId,
    final String? nonStrikerId,
    final bool isWicket,
    final bool isBoundary,
    final bool isSix,
    final String? commentary,
    final DateTime? timestamp,
  }) = _$BallEventModelImpl;

  factory _BallEventModel.fromJson(Map<String, dynamic> json) =
      _$BallEventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get matchId;
  @override
  int get inningsNumber;
  @override
  int get overNo;
  @override
  int get ballNo;
  @override
  int get runs;
  @override
  ExtraType get extraType;
  @override
  int get extraRuns;
  @override
  WicketType get wicketType;
  @override
  String? get batsmanId;
  @override
  String? get bowlerId;
  @override
  String? get fielderId;
  @override
  String? get nonStrikerId;
  @override
  bool get isWicket;
  @override
  bool get isBoundary;
  @override
  bool get isSix;
  @override
  String? get commentary;
  @override
  DateTime? get timestamp;

  /// Create a copy of BallEventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BallEventModelImplCopyWith<_$BallEventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
