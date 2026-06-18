// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get cnicHash => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  List<UserRole> get roles => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl =>
      throw _privateConstructorUsedError; // FR-10: Profile Information
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  List<String> get primarySports => throw _privateConstructorUsedError;
  String? get playingPosition => throw _privateConstructorUsedError;
  BattingHand get battingHand => throw _privateConstructorUsedError;
  BowlingHand get bowlingHand => throw _privateConstructorUsedError;
  PlayingHand get dominantHand =>
      throw _privateConstructorUsedError; // FR-11: Contact Info
  String? get whatsappNumber => throw _privateConstructorUsedError;
  bool get showContactToScouts =>
      throw _privateConstructorUsedError; // FR-18: Privacy
  PrivacyMode get privacyMode => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    String cnicHash,
    String phone,
    bool verified,
    List<UserRole> roles,
    DateTime createdAt,
    String? email,
    String? displayName,
    String? photoUrl,
    DateTime? dateOfBirth,
    String? city,
    List<String> primarySports,
    String? playingPosition,
    BattingHand battingHand,
    BowlingHand bowlingHand,
    PlayingHand dominantHand,
    String? whatsappNumber,
    bool showContactToScouts,
    PrivacyMode privacyMode,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cnicHash = null,
    Object? phone = null,
    Object? verified = null,
    Object? roles = null,
    Object? createdAt = null,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? city = freezed,
    Object? primarySports = null,
    Object? playingPosition = freezed,
    Object? battingHand = null,
    Object? bowlingHand = null,
    Object? dominantHand = null,
    Object? whatsappNumber = freezed,
    Object? showContactToScouts = null,
    Object? privacyMode = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            cnicHash: null == cnicHash
                ? _value.cnicHash
                : cnicHash // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            roles: null == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<UserRole>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            primarySports: null == primarySports
                ? _value.primarySports
                : primarySports // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            playingPosition: freezed == playingPosition
                ? _value.playingPosition
                : playingPosition // ignore: cast_nullable_to_non_nullable
                      as String?,
            battingHand: null == battingHand
                ? _value.battingHand
                : battingHand // ignore: cast_nullable_to_non_nullable
                      as BattingHand,
            bowlingHand: null == bowlingHand
                ? _value.bowlingHand
                : bowlingHand // ignore: cast_nullable_to_non_nullable
                      as BowlingHand,
            dominantHand: null == dominantHand
                ? _value.dominantHand
                : dominantHand // ignore: cast_nullable_to_non_nullable
                      as PlayingHand,
            whatsappNumber: freezed == whatsappNumber
                ? _value.whatsappNumber
                : whatsappNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            showContactToScouts: null == showContactToScouts
                ? _value.showContactToScouts
                : showContactToScouts // ignore: cast_nullable_to_non_nullable
                      as bool,
            privacyMode: null == privacyMode
                ? _value.privacyMode
                : privacyMode // ignore: cast_nullable_to_non_nullable
                      as PrivacyMode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String cnicHash,
    String phone,
    bool verified,
    List<UserRole> roles,
    DateTime createdAt,
    String? email,
    String? displayName,
    String? photoUrl,
    DateTime? dateOfBirth,
    String? city,
    List<String> primarySports,
    String? playingPosition,
    BattingHand battingHand,
    BowlingHand bowlingHand,
    PlayingHand dominantHand,
    String? whatsappNumber,
    bool showContactToScouts,
    PrivacyMode privacyMode,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cnicHash = null,
    Object? phone = null,
    Object? verified = null,
    Object? roles = null,
    Object? createdAt = null,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? city = freezed,
    Object? primarySports = null,
    Object? playingPosition = freezed,
    Object? battingHand = null,
    Object? bowlingHand = null,
    Object? dominantHand = null,
    Object? whatsappNumber = freezed,
    Object? showContactToScouts = null,
    Object? privacyMode = null,
  }) {
    return _then(
      _$UserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        cnicHash: null == cnicHash
            ? _value.cnicHash
            : cnicHash // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        roles: null == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<UserRole>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        primarySports: null == primarySports
            ? _value._primarySports
            : primarySports // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        playingPosition: freezed == playingPosition
            ? _value.playingPosition
            : playingPosition // ignore: cast_nullable_to_non_nullable
                  as String?,
        battingHand: null == battingHand
            ? _value.battingHand
            : battingHand // ignore: cast_nullable_to_non_nullable
                  as BattingHand,
        bowlingHand: null == bowlingHand
            ? _value.bowlingHand
            : bowlingHand // ignore: cast_nullable_to_non_nullable
                  as BowlingHand,
        dominantHand: null == dominantHand
            ? _value.dominantHand
            : dominantHand // ignore: cast_nullable_to_non_nullable
                  as PlayingHand,
        whatsappNumber: freezed == whatsappNumber
            ? _value.whatsappNumber
            : whatsappNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        showContactToScouts: null == showContactToScouts
            ? _value.showContactToScouts
            : showContactToScouts // ignore: cast_nullable_to_non_nullable
                  as bool,
        privacyMode: null == privacyMode
            ? _value.privacyMode
            : privacyMode // ignore: cast_nullable_to_non_nullable
                  as PrivacyMode,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    required this.cnicHash,
    required this.phone,
    this.verified = false,
    final List<UserRole> roles = const [UserRole.player],
    required this.createdAt,
    this.email,
    this.displayName,
    this.photoUrl,
    this.dateOfBirth,
    this.city,
    final List<String> primarySports = const [],
    this.playingPosition,
    this.battingHand = BattingHand.right,
    this.bowlingHand = BowlingHand.none,
    this.dominantHand = PlayingHand.right,
    this.whatsappNumber,
    this.showContactToScouts = false,
    this.privacyMode = PrivacyMode.public,
  }) : _roles = roles,
       _primarySports = primarySports;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String cnicHash;
  @override
  final String phone;
  @override
  @JsonKey()
  final bool verified;
  final List<UserRole> _roles;
  @override
  @JsonKey()
  List<UserRole> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final DateTime createdAt;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  // FR-10: Profile Information
  @override
  final DateTime? dateOfBirth;
  @override
  final String? city;
  final List<String> _primarySports;
  @override
  @JsonKey()
  List<String> get primarySports {
    if (_primarySports is EqualUnmodifiableListView) return _primarySports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_primarySports);
  }

  @override
  final String? playingPosition;
  @override
  @JsonKey()
  final BattingHand battingHand;
  @override
  @JsonKey()
  final BowlingHand bowlingHand;
  @override
  @JsonKey()
  final PlayingHand dominantHand;
  // FR-11: Contact Info
  @override
  final String? whatsappNumber;
  @override
  @JsonKey()
  final bool showContactToScouts;
  // FR-18: Privacy
  @override
  @JsonKey()
  final PrivacyMode privacyMode;

  @override
  String toString() {
    return 'UserModel(id: $id, cnicHash: $cnicHash, phone: $phone, verified: $verified, roles: $roles, createdAt: $createdAt, email: $email, displayName: $displayName, photoUrl: $photoUrl, dateOfBirth: $dateOfBirth, city: $city, primarySports: $primarySports, playingPosition: $playingPosition, battingHand: $battingHand, bowlingHand: $bowlingHand, dominantHand: $dominantHand, whatsappNumber: $whatsappNumber, showContactToScouts: $showContactToScouts, privacyMode: $privacyMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cnicHash, cnicHash) ||
                other.cnicHash == cnicHash) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(
              other._primarySports,
              _primarySports,
            ) &&
            (identical(other.playingPosition, playingPosition) ||
                other.playingPosition == playingPosition) &&
            (identical(other.battingHand, battingHand) ||
                other.battingHand == battingHand) &&
            (identical(other.bowlingHand, bowlingHand) ||
                other.bowlingHand == bowlingHand) &&
            (identical(other.dominantHand, dominantHand) ||
                other.dominantHand == dominantHand) &&
            (identical(other.whatsappNumber, whatsappNumber) ||
                other.whatsappNumber == whatsappNumber) &&
            (identical(other.showContactToScouts, showContactToScouts) ||
                other.showContactToScouts == showContactToScouts) &&
            (identical(other.privacyMode, privacyMode) ||
                other.privacyMode == privacyMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    cnicHash,
    phone,
    verified,
    const DeepCollectionEquality().hash(_roles),
    createdAt,
    email,
    displayName,
    photoUrl,
    dateOfBirth,
    city,
    const DeepCollectionEquality().hash(_primarySports),
    playingPosition,
    battingHand,
    bowlingHand,
    dominantHand,
    whatsappNumber,
    showContactToScouts,
    privacyMode,
  ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String id,
    required final String cnicHash,
    required final String phone,
    final bool verified,
    final List<UserRole> roles,
    required final DateTime createdAt,
    final String? email,
    final String? displayName,
    final String? photoUrl,
    final DateTime? dateOfBirth,
    final String? city,
    final List<String> primarySports,
    final String? playingPosition,
    final BattingHand battingHand,
    final BowlingHand bowlingHand,
    final PlayingHand dominantHand,
    final String? whatsappNumber,
    final bool showContactToScouts,
    final PrivacyMode privacyMode,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get cnicHash;
  @override
  String get phone;
  @override
  bool get verified;
  @override
  List<UserRole> get roles;
  @override
  DateTime get createdAt;
  @override
  String? get email;
  @override
  String? get displayName;
  @override
  String? get photoUrl; // FR-10: Profile Information
  @override
  DateTime? get dateOfBirth;
  @override
  String? get city;
  @override
  List<String> get primarySports;
  @override
  String? get playingPosition;
  @override
  BattingHand get battingHand;
  @override
  BowlingHand get bowlingHand;
  @override
  PlayingHand get dominantHand; // FR-11: Contact Info
  @override
  String? get whatsappNumber;
  @override
  bool get showContactToScouts; // FR-18: Privacy
  @override
  PrivacyMode get privacyMode;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
