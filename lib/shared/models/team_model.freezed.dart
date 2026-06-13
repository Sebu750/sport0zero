// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) {
  return _TeamModel.fromJson(json);
}

/// @nodoc
mixin _$TeamModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  String? get managerId => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  String? get homeGround => throw _privateConstructorUsedError;
  List<String> get playerIds => throw _privateConstructorUsedError;
  DateTime? get foundedAt => throw _privateConstructorUsedError;

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamModelCopyWith<TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) then) =
      _$TeamModelCopyWithImpl<$Res, TeamModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String sportId,
    String? managerId,
    String? logoUrl,
    String? shortName,
    String? homeGround,
    List<String> playerIds,
    DateTime? foundedAt,
  });
}

/// @nodoc
class _$TeamModelCopyWithImpl<$Res, $Val extends TeamModel>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sportId = null,
    Object? managerId = freezed,
    Object? logoUrl = freezed,
    Object? shortName = freezed,
    Object? homeGround = freezed,
    Object? playerIds = null,
    Object? foundedAt = freezed,
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
            managerId: freezed == managerId
                ? _value.managerId
                : managerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            shortName: freezed == shortName
                ? _value.shortName
                : shortName // ignore: cast_nullable_to_non_nullable
                      as String?,
            homeGround: freezed == homeGround
                ? _value.homeGround
                : homeGround // ignore: cast_nullable_to_non_nullable
                      as String?,
            playerIds: null == playerIds
                ? _value.playerIds
                : playerIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            foundedAt: freezed == foundedAt
                ? _value.foundedAt
                : foundedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TeamModelImplCopyWith<$Res>
    implements $TeamModelCopyWith<$Res> {
  factory _$$TeamModelImplCopyWith(
    _$TeamModelImpl value,
    $Res Function(_$TeamModelImpl) then,
  ) = __$$TeamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String sportId,
    String? managerId,
    String? logoUrl,
    String? shortName,
    String? homeGround,
    List<String> playerIds,
    DateTime? foundedAt,
  });
}

/// @nodoc
class __$$TeamModelImplCopyWithImpl<$Res>
    extends _$TeamModelCopyWithImpl<$Res, _$TeamModelImpl>
    implements _$$TeamModelImplCopyWith<$Res> {
  __$$TeamModelImplCopyWithImpl(
    _$TeamModelImpl _value,
    $Res Function(_$TeamModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sportId = null,
    Object? managerId = freezed,
    Object? logoUrl = freezed,
    Object? shortName = freezed,
    Object? homeGround = freezed,
    Object? playerIds = null,
    Object? foundedAt = freezed,
  }) {
    return _then(
      _$TeamModelImpl(
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
        managerId: freezed == managerId
            ? _value.managerId
            : managerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        shortName: freezed == shortName
            ? _value.shortName
            : shortName // ignore: cast_nullable_to_non_nullable
                  as String?,
        homeGround: freezed == homeGround
            ? _value.homeGround
            : homeGround // ignore: cast_nullable_to_non_nullable
                  as String?,
        playerIds: null == playerIds
            ? _value._playerIds
            : playerIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        foundedAt: freezed == foundedAt
            ? _value.foundedAt
            : foundedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamModelImpl implements _TeamModel {
  const _$TeamModelImpl({
    required this.id,
    required this.name,
    required this.sportId,
    this.managerId,
    this.logoUrl,
    this.shortName,
    this.homeGround,
    final List<String> playerIds = const [],
    this.foundedAt,
  }) : _playerIds = playerIds;

  factory _$TeamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String sportId;
  @override
  final String? managerId;
  @override
  final String? logoUrl;
  @override
  final String? shortName;
  @override
  final String? homeGround;
  final List<String> _playerIds;
  @override
  @JsonKey()
  List<String> get playerIds {
    if (_playerIds is EqualUnmodifiableListView) return _playerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerIds);
  }

  @override
  final DateTime? foundedAt;

  @override
  String toString() {
    return 'TeamModel(id: $id, name: $name, sportId: $sportId, managerId: $managerId, logoUrl: $logoUrl, shortName: $shortName, homeGround: $homeGround, playerIds: $playerIds, foundedAt: $foundedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sportId, sportId) || other.sportId == sportId) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.homeGround, homeGround) ||
                other.homeGround == homeGround) &&
            const DeepCollectionEquality().equals(
              other._playerIds,
              _playerIds,
            ) &&
            (identical(other.foundedAt, foundedAt) ||
                other.foundedAt == foundedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    sportId,
    managerId,
    logoUrl,
    shortName,
    homeGround,
    const DeepCollectionEquality().hash(_playerIds),
    foundedAt,
  );

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamModelImplCopyWith<_$TeamModelImpl> get copyWith =>
      __$$TeamModelImplCopyWithImpl<_$TeamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamModelImplToJson(this);
  }
}

abstract class _TeamModel implements TeamModel {
  const factory _TeamModel({
    required final String id,
    required final String name,
    required final String sportId,
    final String? managerId,
    final String? logoUrl,
    final String? shortName,
    final String? homeGround,
    final List<String> playerIds,
    final DateTime? foundedAt,
  }) = _$TeamModelImpl;

  factory _TeamModel.fromJson(Map<String, dynamic> json) =
      _$TeamModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get sportId;
  @override
  String? get managerId;
  @override
  String? get logoUrl;
  @override
  String? get shortName;
  @override
  String? get homeGround;
  @override
  List<String> get playerIds;
  @override
  DateTime? get foundedAt;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamModelImplCopyWith<_$TeamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
