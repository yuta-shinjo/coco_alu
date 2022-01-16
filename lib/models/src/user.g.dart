// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      name: json['name'] as String? ?? '',
      profileImageUrl: json['profileImageUrl'] as String? ?? '',
      id: json['id'] as String? ?? '',
      capsule: (json['capsule'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'id': instance.id,
      'capsule': instance.capsule,
    };
