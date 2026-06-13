// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserModelImpl(
  id: json['id'] as String,
  cnicHash: json['cnicHash'] as String,
  phone: json['phone'] as String,
  verified: json['verified'] as bool? ?? false,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.player,
  createdAt: DateTime.parse(json['createdAt'] as String),
  email: json['email'] as String?,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cnicHash': instance.cnicHash,
      'phone': instance.phone,
      'verified': instance.verified,
      'role': _$UserRoleEnumMap[instance.role]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
    };

const _$UserRoleEnumMap = {
  UserRole.player: 'player',
  UserRole.manager: 'manager',
  UserRole.organizer: 'organizer',
  UserRole.admin: 'admin',
};
