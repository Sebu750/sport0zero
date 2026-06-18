import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

enum NotificationType { match, team, tournament, system }

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    @Default(NotificationType.system) NotificationType type,
    required String title,
    required String message,
    @Default(false) bool read,
    @Default({}) Map<String, dynamic> data,
    required DateTime createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
