// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
class _$AlbumTearOff {
  const _$AlbumTearOff();

  _Album call(
      {String id = '',
      String content = '',
      String imgUrls = '',
      String createdUser = '',
      int likedCount = 0,
      List<String> tags = const <String>[],
      List<String> likedUser = const <String>[],
      bool public = false,
      String? latitudeRef,
      String? latitude,
      String? longitudeRef,
      String? longitude,
      String? tookDay,
      @FireTimestampConverterNonNull() required DateTime created}) {
    return _Album(
      id: id,
      content: content,
      imgUrls: imgUrls,
      createdUser: createdUser,
      likedCount: likedCount,
      tags: tags,
      likedUser: likedUser,
      public: public,
      latitudeRef: latitudeRef,
      latitude: latitude,
      longitudeRef: longitudeRef,
      longitude: longitude,
      tookDay: tookDay,
      created: created,
    );
  }

  Album fromJson(Map<String, Object?> json) {
    return Album.fromJson(json);
  }
}

/// @nodoc
const $Album = _$AlbumTearOff();

/// @nodoc
mixin _$Album {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imgUrls => throw _privateConstructorUsedError;
  String get createdUser => throw _privateConstructorUsedError;
  int get likedCount => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get likedUser => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;
  String? get latitudeRef => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitudeRef => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get tookDay => throw _privateConstructorUsedError;
  @FireTimestampConverterNonNull()
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String content,
      String imgUrls,
      String createdUser,
      int likedCount,
      List<String> tags,
      List<String> likedUser,
      bool public,
      String? latitudeRef,
      String? latitude,
      String? longitudeRef,
      String? longitude,
      String? tookDay,
      @FireTimestampConverterNonNull() DateTime created});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res> implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  final Album _value;
  // ignore: unused_field
  final $Res Function(Album) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? imgUrls = freezed,
    Object? createdUser = freezed,
    Object? likedCount = freezed,
    Object? tags = freezed,
    Object? likedUser = freezed,
    Object? public = freezed,
    Object? latitudeRef = freezed,
    Object? latitude = freezed,
    Object? longitudeRef = freezed,
    Object? longitude = freezed,
    Object? tookDay = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrls: imgUrls == freezed
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as String,
      createdUser: createdUser == freezed
          ? _value.createdUser
          : createdUser // ignore: cast_nullable_to_non_nullable
              as String,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likedUser: likedUser == freezed
          ? _value.likedUser
          : likedUser // ignore: cast_nullable_to_non_nullable
              as List<String>,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      latitudeRef: latitudeRef == freezed
          ? _value.latitudeRef
          : latitudeRef // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitudeRef: longitudeRef == freezed
          ? _value.longitudeRef
          : longitudeRef // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      tookDay: tookDay == freezed
          ? _value.tookDay
          : tookDay // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$AlbumCopyWith(_Album value, $Res Function(_Album) then) =
      __$AlbumCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String content,
      String imgUrls,
      String createdUser,
      int likedCount,
      List<String> tags,
      List<String> likedUser,
      bool public,
      String? latitudeRef,
      String? latitude,
      String? longitudeRef,
      String? longitude,
      String? tookDay,
      @FireTimestampConverterNonNull() DateTime created});
}

/// @nodoc
class __$AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res>
    implements _$AlbumCopyWith<$Res> {
  __$AlbumCopyWithImpl(_Album _value, $Res Function(_Album) _then)
      : super(_value, (v) => _then(v as _Album));

  @override
  _Album get _value => super._value as _Album;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? imgUrls = freezed,
    Object? createdUser = freezed,
    Object? likedCount = freezed,
    Object? tags = freezed,
    Object? likedUser = freezed,
    Object? public = freezed,
    Object? latitudeRef = freezed,
    Object? latitude = freezed,
    Object? longitudeRef = freezed,
    Object? longitude = freezed,
    Object? tookDay = freezed,
    Object? created = freezed,
  }) {
    return _then(_Album(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrls: imgUrls == freezed
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as String,
      createdUser: createdUser == freezed
          ? _value.createdUser
          : createdUser // ignore: cast_nullable_to_non_nullable
              as String,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likedUser: likedUser == freezed
          ? _value.likedUser
          : likedUser // ignore: cast_nullable_to_non_nullable
              as List<String>,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      latitudeRef: latitudeRef == freezed
          ? _value.latitudeRef
          : latitudeRef // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitudeRef: longitudeRef == freezed
          ? _value.longitudeRef
          : longitudeRef // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      tookDay: tookDay == freezed
          ? _value.tookDay
          : tookDay // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Album implements _Album {
  const _$_Album(
      {this.id = '',
      this.content = '',
      this.imgUrls = '',
      this.createdUser = '',
      this.likedCount = 0,
      this.tags = const <String>[],
      this.likedUser = const <String>[],
      this.public = false,
      this.latitudeRef,
      this.latitude,
      this.longitudeRef,
      this.longitude,
      this.tookDay,
      @FireTimestampConverterNonNull() required this.created});

  factory _$_Album.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String content;
  @JsonKey()
  @override
  final String imgUrls;
  @JsonKey()
  @override
  final String createdUser;
  @JsonKey()
  @override
  final int likedCount;
  @JsonKey()
  @override
  final List<String> tags;
  @JsonKey()
  @override
  final List<String> likedUser;
  @JsonKey()
  @override
  final bool public;
  @override
  final String? latitudeRef;
  @override
  final String? latitude;
  @override
  final String? longitudeRef;
  @override
  final String? longitude;
  @override
  final String? tookDay;
  @override
  @FireTimestampConverterNonNull()
  final DateTime created;

  @override
  String toString() {
    return 'Album(id: $id, content: $content, imgUrls: $imgUrls, createdUser: $createdUser, likedCount: $likedCount, tags: $tags, likedUser: $likedUser, public: $public, latitudeRef: $latitudeRef, latitude: $latitude, longitudeRef: $longitudeRef, longitude: $longitude, tookDay: $tookDay, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Album &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.imgUrls, imgUrls) &&
            const DeepCollectionEquality()
                .equals(other.createdUser, createdUser) &&
            const DeepCollectionEquality()
                .equals(other.likedCount, likedCount) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.likedUser, likedUser) &&
            const DeepCollectionEquality().equals(other.public, public) &&
            const DeepCollectionEquality()
                .equals(other.latitudeRef, latitudeRef) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality()
                .equals(other.longitudeRef, longitudeRef) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.tookDay, tookDay) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(imgUrls),
      const DeepCollectionEquality().hash(createdUser),
      const DeepCollectionEquality().hash(likedCount),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(likedUser),
      const DeepCollectionEquality().hash(public),
      const DeepCollectionEquality().hash(latitudeRef),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitudeRef),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(tookDay),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  _$AlbumCopyWith<_Album> get copyWith =>
      __$AlbumCopyWithImpl<_Album>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumToJson(this);
  }
}

abstract class _Album implements Album {
  const factory _Album(
      {String id,
      String content,
      String imgUrls,
      String createdUser,
      int likedCount,
      List<String> tags,
      List<String> likedUser,
      bool public,
      String? latitudeRef,
      String? latitude,
      String? longitudeRef,
      String? longitude,
      String? tookDay,
      @FireTimestampConverterNonNull() required DateTime created}) = _$_Album;

  factory _Album.fromJson(Map<String, dynamic> json) = _$_Album.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get imgUrls;
  @override
  String get createdUser;
  @override
  int get likedCount;
  @override
  List<String> get tags;
  @override
  List<String> get likedUser;
  @override
  bool get public;
  @override
  String? get latitudeRef;
  @override
  String? get latitude;
  @override
  String? get longitudeRef;
  @override
  String? get longitude;
  @override
  String? get tookDay;
  @override
  @FireTimestampConverterNonNull()
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$AlbumCopyWith<_Album> get copyWith => throw _privateConstructorUsedError;
}
