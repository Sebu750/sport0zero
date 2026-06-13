import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamModel with _$TeamModel {
  const factory TeamModel({
    required String id,
    required String name,
    required String sportId,
    String? managerId,
    String? logoUrl,
    String? shortName,
    String? homeGround,
    @Default([]) List<String> playerIds,
    DateTime? foundedAt,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}
