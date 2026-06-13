// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'venue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VenueModel _$VenueModelFromJson(Map<String, dynamic> json) {
  return _VenueModel.fromJson(json);
}

/// @nodoc
mixin _$VenueModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  int get courtsCount => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this VenueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VenueModelCopyWith<VenueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueModelCopyWith<$Res> {
  factory $VenueModelCopyWith(
    VenueModel value,
    $Res Function(VenueModel) then,
  ) = _$VenueModelCopyWithImpl<$Res, VenueModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String? address,
    double? lat,
    double? lng,
    int courtsCount,
    String? city,
    String? imageUrl,
    bool isActive,
  });
}

/// @nodoc
class _$VenueModelCopyWithImpl<$Res, $Val extends VenueModel>
    implements $VenueModelCopyWith<$Res> {
  _$VenueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? courtsCount = null,
    Object? city = freezed,
    Object? imageUrl = freezed,
    Object? isActive = null,
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
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            lat: freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double?,
            lng: freezed == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double?,
            courtsCount: null == courtsCount
                ? _value.courtsCount
                : courtsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VenueModelImplCopyWith<$Res>
    implements $VenueModelCopyWith<$Res> {
  factory _$$VenueModelImplCopyWith(
    _$VenueModelImpl value,
    $Res Function(_$VenueModelImpl) then,
  ) = __$$VenueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? address,
    double? lat,
    double? lng,
    int courtsCount,
    String? city,
    String? imageUrl,
    bool isActive,
  });
}

/// @nodoc
class __$$VenueModelImplCopyWithImpl<$Res>
    extends _$VenueModelCopyWithImpl<$Res, _$VenueModelImpl>
    implements _$$VenueModelImplCopyWith<$Res> {
  __$$VenueModelImplCopyWithImpl(
    _$VenueModelImpl _value,
    $Res Function(_$VenueModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? courtsCount = null,
    Object? city = freezed,
    Object? imageUrl = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$VenueModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        lat: freezed == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double?,
        lng: freezed == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double?,
        courtsCount: null == courtsCount
            ? _value.courtsCount
            : courtsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VenueModelImpl implements _VenueModel {
  const _$VenueModelImpl({
    required this.id,
    required this.name,
    this.address,
    this.lat,
    this.lng,
    this.courtsCount = 1,
    this.city,
    this.imageUrl,
    this.isActive = true,
  });

  factory _$VenueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VenueModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? address;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  @JsonKey()
  final int courtsCount;
  @override
  final String? city;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'VenueModel(id: $id, name: $name, address: $address, lat: $lat, lng: $lng, courtsCount: $courtsCount, city: $city, imageUrl: $imageUrl, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VenueModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.courtsCount, courtsCount) ||
                other.courtsCount == courtsCount) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    address,
    lat,
    lng,
    courtsCount,
    city,
    imageUrl,
    isActive,
  );

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VenueModelImplCopyWith<_$VenueModelImpl> get copyWith =>
      __$$VenueModelImplCopyWithImpl<_$VenueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VenueModelImplToJson(this);
  }
}

abstract class _VenueModel implements VenueModel {
  const factory _VenueModel({
    required final String id,
    required final String name,
    final String? address,
    final double? lat,
    final double? lng,
    final int courtsCount,
    final String? city,
    final String? imageUrl,
    final bool isActive,
  }) = _$VenueModelImpl;

  factory _VenueModel.fromJson(Map<String, dynamic> json) =
      _$VenueModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get address;
  @override
  double? get lat;
  @override
  double? get lng;
  @override
  int get courtsCount;
  @override
  String? get city;
  @override
  String? get imageUrl;
  @override
  bool get isActive;

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VenueModelImplCopyWith<_$VenueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
