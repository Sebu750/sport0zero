// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueModelImpl _$$VenueModelImplFromJson(Map<String, dynamic> json) =>
    _$VenueModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      courtsCount: (json['courtsCount'] as num?)?.toInt() ?? 1,
      city: json['city'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$VenueModelImplToJson(_$VenueModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'courtsCount': instance.courtsCount,
      'city': instance.city,
      'imageUrl': instance.imageUrl,
      'isActive': instance.isActive,
    };
