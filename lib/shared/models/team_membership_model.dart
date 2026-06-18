import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_membership_model.freezed.dart';
part 'team_membership_model.g.dart';

enum MembershipRole { captain, viceCaptain, player }

@freezed
class TeamMembershipModel with _$TeamMembershipModel {
  const factory TeamMembershipModel({
    required String id,
    required String playerId,
    required String teamId,
    @Default(MembershipRole.player) MembershipRole role,
    required DateTime joinedAt,
    String? playerName,
    String? teamName,
  }) = _TeamMembershipModel;

  factory TeamMembershipModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMembershipModelFromJson(json);
}
