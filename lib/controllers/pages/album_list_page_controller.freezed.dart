// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_list_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlbumListPageStateTearOff {
  const _$AlbumListPageStateTearOff();

  _AlbumListPageState call({List<Album>? albums}) {
    return _AlbumListPageState(
      albums: albums,
    );
  }
}

/// @nodoc
const $AlbumListPageState = _$AlbumListPageStateTearOff();

/// @nodoc
mixin _$AlbumListPageState {
  List<Album>? get albums => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumListPageStateCopyWith<AlbumListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumListPageStateCopyWith<$Res> {
  factory $AlbumListPageStateCopyWith(
          AlbumListPageState value, $Res Function(AlbumListPageState) then) =
      _$AlbumListPageStateCopyWithImpl<$Res>;
  $Res call({List<Album>? albums});
}

/// @nodoc
class _$AlbumListPageStateCopyWithImpl<$Res>
    implements $AlbumListPageStateCopyWith<$Res> {
  _$AlbumListPageStateCopyWithImpl(this._value, this._then);

  final AlbumListPageState _value;
  // ignore: unused_field
  final $Res Function(AlbumListPageState) _then;

  @override
  $Res call({
    Object? albums = freezed,
  }) {
    return _then(_value.copyWith(
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc
abstract class _$AlbumListPageStateCopyWith<$Res>
    implements $AlbumListPageStateCopyWith<$Res> {
  factory _$AlbumListPageStateCopyWith(
          _AlbumListPageState value, $Res Function(_AlbumListPageState) then) =
      __$AlbumListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Album>? albums});
}

/// @nodoc
class __$AlbumListPageStateCopyWithImpl<$Res>
    extends _$AlbumListPageStateCopyWithImpl<$Res>
    implements _$AlbumListPageStateCopyWith<$Res> {
  __$AlbumListPageStateCopyWithImpl(
      _AlbumListPageState _value, $Res Function(_AlbumListPageState) _then)
      : super(_value, (v) => _then(v as _AlbumListPageState));

  @override
  _AlbumListPageState get _value => super._value as _AlbumListPageState;

  @override
  $Res call({
    Object? albums = freezed,
  }) {
    return _then(_AlbumListPageState(
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc

class _$_AlbumListPageState implements _AlbumListPageState {
  const _$_AlbumListPageState({this.albums});

  @override
  final List<Album>? albums;

  @override
  String toString() {
    return 'AlbumListPageState(albums: $albums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlbumListPageState &&
            const DeepCollectionEquality().equals(other.albums, albums));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(albums));

  @JsonKey(ignore: true)
  @override
  _$AlbumListPageStateCopyWith<_AlbumListPageState> get copyWith =>
      __$AlbumListPageStateCopyWithImpl<_AlbumListPageState>(this, _$identity);
}

abstract class _AlbumListPageState implements AlbumListPageState {
  const factory _AlbumListPageState({List<Album>? albums}) =
      _$_AlbumListPageState;

  @override
  List<Album>? get albums;
  @override
  @JsonKey(ignore: true)
  _$AlbumListPageStateCopyWith<_AlbumListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
