// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TournamentModel _$TournamentModelFromJson(Map<String, dynamic> json) {
  return _TournamentModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  TournamentFormat get format => throw _privateConstructorUsedError;
  TournamentStatus get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<String> get teamIds => throw _privateConstructorUsedError;
  String? get venueId => throw _privateConstructorUsedError;

  /// Serializes this TournamentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TournamentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TournamentModelCopyWith<TournamentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentModelCopyWith<$Res> {
  factory $TournamentModelCopyWith(
    TournamentModel value,
    $Res Function(TournamentModel) then,
  ) = _$TournamentModelCopyWithImpl<$Res, TournamentModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String sportId,
    String organizerId,
    TournamentFormat format,
    TournamentStatus status,
    String? description,
    String? logoUrl,
    DateTime? startDate,
    DateTime? endDate,
    List<String> teamIds,
    String? venueId,
  });
}

/// @nodoc
class _$TournamentModelCopyWithImpl<$Res, $Val extends TournamentModel>
    implements $TournamentModelCopyWith<$Res> {
  _$TournamentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TournamentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sportId = null,
    Object? organizerId = null,
    Object? format = null,
    Object? status = null,
    Object? description = freezed,
    Object? logoUrl = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? teamIds = null,
    Object? venueId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            sportId: null == sportId
                ? _value.sportId
                : sportId // ignore: cast_nullable_to_non_nullable
                      as String,
            organizerId: null == organizerId
                ? _value.organizerId
                : organizerId // ignore: cast_nullable_to_non_nullable
                      as String,
            format: null == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as TournamentFormat,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TournamentStatus,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            teamIds: null == teamIds
                ? _value.teamIds
                : teamIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            venueId: freezed == venueId
                ? _value.venueId
                : venueId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TournamentModelImplCopyWith<$Res>
    implements $TournamentModelCopyWith<$Res> {
  factory _$$TournamentModelImplCopyWith(
    _$TournamentModelImpl value,
    $Res Function(_$TournamentModelImpl) then,
  ) = __$$TournamentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String sportId,
    String organizerId,
    TournamentFormat format,
    TournamentStatus status,
    String? description,
    String? logoUrl,
    DateTime? startDate,
    DateTime? endDate,
    List<String> teamIds,
    String? venueId,
  });
}

/// @nodoc
class __$$TournamentModelImplCopyWithImpl<$Res>
    extends _$TournamentModelCopyWithImpl<$Res, _$TournamentModelImpl>
    implements _$$TournamentModelImplCopyWith<$Res> {
  __$$TournamentModelImplCopyWithImpl(
    _$TournamentModelImpl _value,
    $Res Function(_$TournamentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TournamentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sportId = null,
    Object? organizerId = null,
    Object? format = null,
    Object? status = null,
    Object? description = freezed,
    Object? logoUrl = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? teamIds = null,
    Object? venueId = freezed,
  }) {
    return _then(
      _$TournamentModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sportId: null == sportId
            ? _value.sportId
            : sportId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizerId: null == organizerId
            ? _value.organizerId
            : organizerId // ignore: cast_nullable_to_non_nullable
                  as String,
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as TournamentFormat,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TournamentStatus,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        teamIds: null == teamIds
            ? _value._teamIds
            : teamIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        venueId: freezed == venueId
            ? _value.venueId
            : venueId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentModelImpl implements _TournamentModel {
  const _$TournamentModelImpl({
    required this.id,
    required this.name,
    required this.sportId,
    required this.organizerId,
    this.format = TournamentFormat.league,
    this.status = TournamentStatus.upcoming,
    this.description,
    this.logoUrl,
    this.startDate,
    this.endDate,
    final List<String> teamIds = const [],
    this.venueId,
  }) : _teamIds = teamIds;

  factory _$TournamentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String sportId;
  @override
  final String organizerId;
  @override
  @JsonKey()
  final TournamentFormat format;
  @override
  @JsonKey()
  final TournamentStatus status;
  @override
  final String? description;
  @override
  final String? logoUrl;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<String> _teamIds;
  @override
  @JsonKey()
  List<String> get teamIds {
    if (_teamIds is EqualUnmodifiableListView) return _teamIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamIds);
  }

  @override
  final String? venueId;

  @override
  String toString() {
    return 'TournamentModel(id: $id, name: $name, sportId: $sportId, organizerId: $organizerId, format: $format, status: $status, description: $description, logoUrl: $logoUrl, startDate: $startDate, endDate: $endDate, teamIds: $teamIds, venueId: $venueId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sportId, sportId) || other.sportId == sportId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._teamIds, _teamIds) &&
            (identical(other.venueId, venueId) || other.venueId == venueId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    sportId,
    organizerId,
    format,
    status,
    description,
    logoUrl,
    startDate,
    endDate,
    const DeepCollectionEquality().hash(_teamIds),
    venueId,
  );

  /// Create a copy of TournamentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentModelImplCopyWith<_$TournamentModelImpl> get copyWith =>
      __$$TournamentModelImplCopyWithImpl<_$TournamentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentModelImplToJson(this);
  }
}

abstract class _TournamentModel implements TournamentModel {
  const factory _TournamentModel({
    required final String id,
    required final String name,
    required final String sportId,
    required final String organizerId,
    final TournamentFormat format,
    final TournamentStatus status,
    final String? description,
    final String? logoUrl,
    final DateTime? startDate,
    final DateTime? endDate,
    final List<String> teamIds,
    final String? venueId,
  }) = _$TournamentModelImpl;

  factory _TournamentModel.fromJson(Map<String, dynamic> json) =
      _$TournamentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get sportId;
  @override
  String get organizerId;
  @override
  TournamentFormat get format;
  @override
  TournamentStatus get status;
  @override
  String? get description;
  @override
  String? get logoUrl;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  List<String> get teamIds;
  @override
  String? get venueId;

  /// Create a copy of TournamentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TournamentModelImplCopyWith<_$TournamentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
