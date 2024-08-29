// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieVideoModelImpl _$$MovieVideoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieVideoModelImpl(
      iso639_1: json['iso_639_1'] as String?,
      iso3166_1: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      official: json['official'] as bool?,
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$MovieVideoModelImplToJson(
        _$MovieVideoModelImpl instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso639_1,
      'iso_3166_1': instance.iso3166_1,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt?.toIso8601String(),
      'id': instance.id,
    };
