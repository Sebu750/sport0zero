import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_profile_model.freezed.dart';
part 'player_profile_model.g.dart';

@freezed
class PlayerProfileModel with _$PlayerProfileModel {
  const factory PlayerProfileModel({
    required String userId,
    required String sportId,
    String? position,
    String? area,
    String? bio,
    String? battingStyle,
    String? bowlingStyle,
    DateTime? dateOfBirth,
    String? profileImageUrl,
  }) = _PlayerProfileModel;

  factory PlayerProfileModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerProfileModelFromJson(json);
}
