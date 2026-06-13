import 'package:freezed_annotation/freezed_annotation.dart';

part 'ball_event_model.freezed.dart';
part 'ball_event_model.g.dart';

enum ExtraType { none, wide, noBall, bye, legBye }
enum WicketType { none, bowled, caught, lbw, runOut, stumped, hitWicket, caughtAndBowled }

@freezed
class BallEventModel with _$BallEventModel {
  const factory BallEventModel({
    required String id,
    required String matchId,
    required int inningsNumber,
    required int overNo,
    required int ballNo,
    @Default(0) int runs,
    @Default(ExtraType.none) ExtraType extraType,
    @Default(0) int extraRuns,
    @Default(WicketType.none) WicketType wicketType,
    String? batsmanId,
    String? bowlerId,
    String? fielderId,
    String? nonStrikerId,
    @Default(false) bool isWicket,
    @Default(false) bool isBoundary,
    @Default(false) bool isSix,
    String? commentary,
    DateTime? timestamp,
  }) = _BallEventModel;

  factory BallEventModel.fromJson(Map<String, dynamic> json) =>
      _$BallEventModelFromJson(json);
}
