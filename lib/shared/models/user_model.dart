import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole { player, manager, organizer, admin }
enum BattingHand { right, left, both }
enum BowlingHand { right, left, none }
enum PlayingHand { right, left, both }
enum PrivacyMode { public, private }

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String cnicHash,
    required String phone,
    @Default(false) bool verified,
    @Default([UserRole.player]) List<UserRole> roles,
    required DateTime createdAt,
    String? email,
    String? displayName,
    String? photoUrl,
    // FR-10: Profile Information
    DateTime? dateOfBirth,
    String? city,
    @Default([]) List<String> primarySports,
    String? playingPosition,
    @Default(BattingHand.right) BattingHand battingHand,
    @Default(BowlingHand.none) BowlingHand bowlingHand,
    @Default(PlayingHand.right) PlayingHand dominantHand,
    // FR-11: Contact Info
    String? whatsappNumber,
    @Default(false) bool showContactToScouts,
    // FR-18: Privacy
    @Default(PrivacyMode.public) PrivacyMode privacyMode,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
