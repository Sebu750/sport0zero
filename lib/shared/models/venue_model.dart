import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue_model.freezed.dart';
part 'venue_model.g.dart';

@freezed
class VenueModel with _$VenueModel {
  const factory VenueModel({
    required String id,
    required String name,
    String? address,
    double? lat,
    double? lng,
    @Default(1) int courtsCount,
    String? city,
    String? imageUrl,
    @Default(true) bool isActive,
  }) = _VenueModel;

  factory VenueModel.fromJson(Map<String, dynamic> json) =>
      _$VenueModelFromJson(json);
}
