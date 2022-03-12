// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_list_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyListPageStateTearOff {
  const _$MyListPageStateTearOff();

  _MyListPageState call(
      {String id = '',
      String content = '',
      String imgUrls = '',
      List<Album>? albums}) {
    return _MyListPageState(
      id: id,
      content: content,
      imgUrls: imgUrls,
      albums: albums,
    );
  }
}

/// @nodoc
const $MyListPageState = _$MyListPageStateTearOff();

/// @nodoc
mixin _$MyListPageState {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imgUrls => throw _privateConstructorUsedError;
  List<Album>? get albums => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyListPageStateCopyWith<MyListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyListPageStateCopyWith<$Res> {
  factory $MyListPageStateCopyWith(
          MyListPageState value, $Res Function(MyListPageState) then) =
      _$MyListPageStateCopyWithImpl<$Res>;
  $Res call({String id, String content, String imgUrls, List<Album>? albums});
}

/// @nodoc
class _$MyListPageStateCopyWithImpl<$Res>
    implements $MyListPageStateCopyWith<$Res> {
  _$MyListPageStateCopyWithImpl(this._value, this._then);

  final MyListPageState _value;
  // ignore: unused_field
  final $Res Function(MyListPageState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? imgUrls = freezed,
    Object? albums = freezed,
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
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc
abstract class _$MyListPageStateCopyWith<$Res>
    implements $MyListPageStateCopyWith<$Res> {
  factory _$MyListPageStateCopyWith(
          _MyListPageState value, $Res Function(_MyListPageState) then) =
      __$MyListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String id, String content, String imgUrls, List<Album>? albums});
}

/// @nodoc
class __$MyListPageStateCopyWithImpl<$Res>
    extends _$MyListPageStateCopyWithImpl<$Res>
    implements _$MyListPageStateCopyWith<$Res> {
  __$MyListPageStateCopyWithImpl(
      _MyListPageState _value, $Res Function(_MyListPageState) _then)
      : super(_value, (v) => _then(v as _MyListPageState));

  @override
  _MyListPageState get _value => super._value as _MyListPageState;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? imgUrls = freezed,
    Object? albums = freezed,
  }) {
    return _then(_MyListPageState(
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
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc

class _$_MyListPageState implements _MyListPageState {
  const _$_MyListPageState(
      {this.id = '', this.content = '', this.imgUrls = '', this.albums});

  @JsonKey()
  @override
  final String id;
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
    return 'MyListPageState(id: $id, content: $content, imgUrls: $imgUrls, albums: $albums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyListPageState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.imgUrls, imgUrls) &&
            const DeepCollectionEquality().equals(other.albums, albums));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(imgUrls),
      const DeepCollectionEquality().hash(albums));

  @JsonKey(ignore: true)
  @override
  _$MyListPageStateCopyWith<_MyListPageState> get copyWith =>
      __$MyListPageStateCopyWithImpl<_MyListPageState>(this, _$identity);
}

abstract class _MyListPageState implements MyListPageState {
  const factory _MyListPageState(
      {String id,
      String content,
      String imgUrls,
      List<Album>? albums}) = _$_MyListPageState;

  @override
  String get id;
  @override
  String get content;
  @override
  String get imgUrls;
  @override
  List<Album>? get albums;
  @override
  @JsonKey(ignore: true)
  _$MyListPageStateCopyWith<_MyListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
