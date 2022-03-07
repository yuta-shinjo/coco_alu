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
      int currentPage = 0,
      int activeAlbumIndex = 0,
      bool isViewAlbums = false,
      List<Album>? albums,
      Album? selectedAlbum}) {
    return _MapPageState(
      markerId: markerId,
      content: content,
      imgUrls: imgUrls,
      currentPage: currentPage,
      activeAlbumIndex: activeAlbumIndex,
      isViewAlbums: isViewAlbums,
      albums: albums,
      selectedAlbum: selectedAlbum,
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
  int get currentPage => throw _privateConstructorUsedError;
  int get activeAlbumIndex => throw _privateConstructorUsedError;
  bool get isViewAlbums => throw _privateConstructorUsedError;
  List<Album>? get albums => throw _privateConstructorUsedError;
  Album? get selectedAlbum => throw _privateConstructorUsedError;

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
      {String markerId,
      String content,
      String imgUrls,
      int currentPage,
      int activeAlbumIndex,
      bool isViewAlbums,
      List<Album>? albums,
      Album? selectedAlbum});

  $AlbumCopyWith<$Res>? get selectedAlbum;
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
    Object? currentPage = freezed,
    Object? activeAlbumIndex = freezed,
    Object? isViewAlbums = freezed,
    Object? albums = freezed,
    Object? selectedAlbum = freezed,
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
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      activeAlbumIndex: activeAlbumIndex == freezed
          ? _value.activeAlbumIndex
          : activeAlbumIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isViewAlbums: isViewAlbums == freezed
          ? _value.isViewAlbums
          : isViewAlbums // ignore: cast_nullable_to_non_nullable
              as bool,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
      selectedAlbum: selectedAlbum == freezed
          ? _value.selectedAlbum
          : selectedAlbum // ignore: cast_nullable_to_non_nullable
              as Album?,
    ));
  }

  @override
  $AlbumCopyWith<$Res>? get selectedAlbum {
    if (_value.selectedAlbum == null) {
      return null;
    }

    return $AlbumCopyWith<$Res>(_value.selectedAlbum!, (value) {
      return _then(_value.copyWith(selectedAlbum: value));
    });
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
      {String markerId,
      String content,
      String imgUrls,
      int currentPage,
      int activeAlbumIndex,
      bool isViewAlbums,
      List<Album>? albums,
      Album? selectedAlbum});

  @override
  $AlbumCopyWith<$Res>? get selectedAlbum;
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
    Object? currentPage = freezed,
    Object? activeAlbumIndex = freezed,
    Object? isViewAlbums = freezed,
    Object? albums = freezed,
    Object? selectedAlbum = freezed,
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
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      activeAlbumIndex: activeAlbumIndex == freezed
          ? _value.activeAlbumIndex
          : activeAlbumIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isViewAlbums: isViewAlbums == freezed
          ? _value.isViewAlbums
          : isViewAlbums // ignore: cast_nullable_to_non_nullable
              as bool,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
      selectedAlbum: selectedAlbum == freezed
          ? _value.selectedAlbum
          : selectedAlbum // ignore: cast_nullable_to_non_nullable
              as Album?,
    ));
  }
}

/// @nodoc

class _$_MapPageState implements _MapPageState {
  const _$_MapPageState(
      {this.markerId = '',
      this.content = '',
      this.imgUrls = '',
      this.currentPage = 0,
      this.activeAlbumIndex = 0,
      this.isViewAlbums = false,
      this.albums,
      this.selectedAlbum});

  @JsonKey()
  @override
  final String markerId;
  @JsonKey()
  @override
  final String content;
  @JsonKey()
  @override
  final String imgUrls;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int activeAlbumIndex;
  @JsonKey()
  @override
  final bool isViewAlbums;
  @override
  final List<Album>? albums;
  @override
  final Album? selectedAlbum;

  @override
  String toString() {
    return 'MapPageState(markerId: $markerId, content: $content, imgUrls: $imgUrls, currentPage: $currentPage, activeAlbumIndex: $activeAlbumIndex, isViewAlbums: $isViewAlbums, albums: $albums, selectedAlbum: $selectedAlbum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapPageState &&
            const DeepCollectionEquality().equals(other.markerId, markerId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.imgUrls, imgUrls) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.activeAlbumIndex, activeAlbumIndex) &&
            const DeepCollectionEquality()
                .equals(other.isViewAlbums, isViewAlbums) &&
            const DeepCollectionEquality().equals(other.albums, albums) &&
            const DeepCollectionEquality()
                .equals(other.selectedAlbum, selectedAlbum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(markerId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(imgUrls),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(activeAlbumIndex),
      const DeepCollectionEquality().hash(isViewAlbums),
      const DeepCollectionEquality().hash(albums),
      const DeepCollectionEquality().hash(selectedAlbum));

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
      int currentPage,
      int activeAlbumIndex,
      bool isViewAlbums,
      List<Album>? albums,
      Album? selectedAlbum}) = _$_MapPageState;

  @override
  String get markerId;
  @override
  String get content;
  @override
  String get imgUrls;
  @override
  int get currentPage;
  @override
  int get activeAlbumIndex;
  @override
  bool get isViewAlbums;
  @override
  List<Album>? get albums;
  @override
  Album? get selectedAlbum;
  @override
  @JsonKey(ignore: true)
  _$MapPageStateCopyWith<_MapPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
