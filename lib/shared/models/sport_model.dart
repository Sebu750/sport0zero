import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_model.freezed.dart';
part 'sport_model.g.dart';

enum ScoringEngineType { cricket, football, basketball, hockey }

@freezed
class SportModel with _$SportModel {
  const factory SportModel({
    required String id,
    required String name,
    @Default(ScoringEngineType.cricket) ScoringEngineType scoringEngineType,
    String? iconUrl,
    @Default(true) bool isActive,
  }) = _SportModel;

  factory SportModel.fromJson(Map<String, dynamic> json) =>
      _$SportModelFromJson(json);
}
