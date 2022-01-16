// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Creature _$$_CreatureFromJson(Map<String, dynamic> json) => _$_Creature(
      name: json['name'] as String? ?? '',
      kinds: json['kinds'] as String? ?? '',
      size: json['size'] as String? ?? '',
      memo: json['memo'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreatureToJson(_$_Creature instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kinds': instance.kinds,
      'size': instance.size,
      'memo': instance.memo,
    };
