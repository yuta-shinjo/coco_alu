// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      imgUrls: json['imgUrls'] as String? ?? '',
      createdUser: json['createdUser'] as String? ?? '',
      likedCount: json['likedCount'] as int? ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      likedUser: (json['likedUser'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      public: json['public'] as bool? ?? false,
      latitudeRef: json['latitudeRef'] as String?,
      latitude: json['latitude'] as String?,
      longitudeRef: json['longitudeRef'] as String?,
      longitude: json['longitude'] as String?,
      tookDay: json['tookDay'] as String?,
      created: const FireTimestampConverterNonNull().fromJson(json['created']),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'imgUrls': instance.imgUrls,
      'createdUser': instance.createdUser,
      'likedCount': instance.likedCount,
      'tags': instance.tags,
      'likedUser': instance.likedUser,
      'public': instance.public,
      'latitudeRef': instance.latitudeRef,
      'latitude': instance.latitude,
      'longitudeRef': instance.longitudeRef,
      'longitude': instance.longitude,
      'tookDay': instance.tookDay,
      'created': const FireTimestampConverterNonNull().toJson(instance.created),
    };
