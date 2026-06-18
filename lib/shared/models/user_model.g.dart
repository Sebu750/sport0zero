// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      cnicHash: json['cnicHash'] as String,
      phone: json['phone'] as String,
      verified: json['verified'] as bool? ?? false,
      roles:
          (json['roles'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$UserRoleEnumMap, e))
              .toList() ??
          const [UserRole.player],
      createdAt: DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      city: json['city'] as String?,
      primarySports:
          (json['primarySports'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      playingPosition: json['playingPosition'] as String?,
      battingHand:
          $enumDecodeNullable(_$BattingHandEnumMap, json['battingHand']) ??
          BattingHand.right,
      bowlingHand:
          $enumDecodeNullable(_$BowlingHandEnumMap, json['bowlingHand']) ??
          BowlingHand.none,
      dominantHand:
          $enumDecodeNullable(_$PlayingHandEnumMap, json['dominantHand']) ??
          PlayingHand.right,
      whatsappNumber: json['whatsappNumber'] as String?,
      showContactToScouts: json['showContactToScouts'] as bool? ?? false,
      privacyMode:
          $enumDecodeNullable(_$PrivacyModeEnumMap, json['privacyMode']) ??
          PrivacyMode.public,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cnicHash': instance.cnicHash,
      'phone': instance.phone,
      'verified': instance.verified,
      'roles': instance.roles.map((e) => _$UserRoleEnumMap[e]!).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'city': instance.city,
      'primarySports': instance.primarySports,
      'playingPosition': instance.playingPosition,
      'battingHand': _$BattingHandEnumMap[instance.battingHand]!,
      'bowlingHand': _$BowlingHandEnumMap[instance.bowlingHand]!,
      'dominantHand': _$PlayingHandEnumMap[instance.dominantHand]!,
      'whatsappNumber': instance.whatsappNumber,
      'showContactToScouts': instance.showContactToScouts,
      'privacyMode': _$PrivacyModeEnumMap[instance.privacyMode]!,
    };

const _$UserRoleEnumMap = {
  UserRole.player: 'player',
  UserRole.manager: 'manager',
  UserRole.organizer: 'organizer',
  UserRole.admin: 'admin',
};

const _$BattingHandEnumMap = {
  BattingHand.right: 'right',
  BattingHand.left: 'left',
  BattingHand.both: 'both',
};

const _$BowlingHandEnumMap = {
  BowlingHand.right: 'right',
  BowlingHand.left: 'left',
  BowlingHand.none: 'none',
};

const _$PlayingHandEnumMap = {
  PlayingHand.right: 'right',
  PlayingHand.left: 'left',
  PlayingHand.both: 'both',
};

const _$PrivacyModeEnumMap = {
  PrivacyMode.public: 'public',
  PrivacyMode.private: 'private',
};
