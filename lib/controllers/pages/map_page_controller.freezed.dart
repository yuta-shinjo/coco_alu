// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MapPageStateTearOff {
  const _$MapPageStateTearOff();

  _MapPageState call(
      {String markerId = '',
      String content = '',
      String imgUrls = '',
      List<Album>? albums}) {
    return _MapPageState(
      markerId: markerId,
      content: content,
      imgUrls: imgUrls,
      albums: albums,
    );
  }
}

/// @nodoc
const $MapPageState = _$MapPageStateTearOff();

/// @nodoc
mixin _$MapPageState {
  String get markerId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imgUrls => throw _privateConstructorUsedError;
  List<Album>? get albums => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapPageStateCopyWith<MapPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPageStateCopyWith<$Res> {
  factory $MapPageStateCopyWith(
          MapPageState value, $Res Function(MapPageState) then) =
      _$MapPageStateCopyWithImpl<$Res>;
  $Res call(
      {String markerId, String content, String imgUrls, List<Album>? albums});
}

/// @nodoc
class _$MapPageStateCopyWithImpl<$Res> implements $MapPageStateCopyWith<$Res> {
  _$MapPageStateCopyWithImpl(this._value, this._then);

  final MapPageState _value;
  // ignore: unused_field
  final $Res Function(MapPageState) _then;

  @override
  $Res call({
    Object? markerId = freezed,
    Object? content = freezed,
    Object? imgUrls = freezed,
    Object? albums = freezed,
  }) {
    return _then(_value.copyWith(
      markerId: markerId == freezed
          ? _value.markerId
          : markerId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrls: imgUrls == freezed
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as String,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc
abstract class _$MapPageStateCopyWith<$Res>
    implements $MapPageStateCopyWith<$Res> {
  factory _$MapPageStateCopyWith(
          _MapPageState value, $Res Function(_MapPageState) then) =
      __$MapPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String markerId, String content, String imgUrls, List<Album>? albums});
}

/// @nodoc
class __$MapPageStateCopyWithImpl<$Res> extends _$MapPageStateCopyWithImpl<$Res>
    implements _$MapPageStateCopyWith<$Res> {
  __$MapPageStateCopyWithImpl(
      _MapPageState _value, $Res Function(_MapPageState) _then)
      : super(_value, (v) => _then(v as _MapPageState));

  @override
  _MapPageState get _value => super._value as _MapPageState;

  @override
  $Res call({
    Object? markerId = freezed,
    Object? content = freezed,
    Object? imgUrls = freezed,
    Object? albums = freezed,
  }) {
    return _then(_MapPageState(
      markerId: markerId == freezed
          ? _value.markerId
          : markerId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrls: imgUrls == freezed
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as String,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc

class _$_MapPageState implements _MapPageState {
  const _$_MapPageState(
      {this.markerId = '', this.content = '', this.imgUrls = '', this.albums});

  @JsonKey()
  @override
  final String markerId;
  @JsonKey()
  @override
  final String content;
  @JsonKey()
  @override
  final String imgUrls;
  @override
  final List<Album>? albums;

  @override
  String toString() {
    return 'MapPageState(markerId: $markerId, content: $content, imgUrls: $imgUrls, albums: $albums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapPageState &&
            const DeepCollectionEquality().equals(other.markerId, markerId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.imgUrls, imgUrls) &&
            const DeepCollectionEquality().equals(other.albums, albums));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(markerId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(imgUrls),
      const DeepCollectionEquality().hash(albums));

  @JsonKey(ignore: true)
  @override
  _$MapPageStateCopyWith<_MapPageState> get copyWith =>
      __$MapPageStateCopyWithImpl<_MapPageState>(this, _$identity);
}

abstract class _MapPageState implements MapPageState {
  const factory _MapPageState(
      {String markerId,
      String content,
      String imgUrls,
      List<Album>? albums}) = _$_MapPageState;

  @override
  String get markerId;
  @override
  String get content;
  @override
  String get imgUrls;
  @override
  List<Album>? get albums;
  @override
  @JsonKey(ignore: true)
  _$MapPageStateCopyWith<_MapPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
