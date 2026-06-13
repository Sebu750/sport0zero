import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole { player, manager, organizer, admin }

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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
