// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Creature _$$_CreatureFromJson(Map<String, dynamic> json) => _$_Creature(
      name: json['name'] as String? ?? '',
      kinds: json['kinds'] as String? ?? '',
      size: json['size'] as String? ?? '',
      location: json['location'] as String? ?? '',
      memo: json['memo'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreatureToJson(_$_Creature instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kinds': instance.kinds,
      'size': instance.size,
      'location': instance.location,
      'memo': instance.memo,
      'imageUrl': instance.imageUrl,
      'id': instance.id,
    };
