// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerProfileModelImpl _$$PlayerProfileModelImplFromJson(
  Map<String, dynamic> json,
) => _$PlayerProfileModelImpl(
  userId: json['userId'] as String,
  sportId: json['sportId'] as String,
  position: json['position'] as String?,
  area: json['area'] as String?,
  bio: json['bio'] as String?,
  battingStyle: json['battingStyle'] as String?,
  bowlingStyle: json['bowlingStyle'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  profileImageUrl: json['profileImageUrl'] as String?,
);

Map<String, dynamic> _$$PlayerProfileModelImplToJson(
  _$PlayerProfileModelImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'sportId': instance.sportId,
  'position': instance.position,
  'area': instance.area,
  'bio': instance.bio,
  'battingStyle': instance.battingStyle,
  'bowlingStyle': instance.bowlingStyle,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'profileImageUrl': instance.profileImageUrl,
};
