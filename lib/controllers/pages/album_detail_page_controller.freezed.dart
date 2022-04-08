// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_detail_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlbumDetailPageStateTearOff {
  const _$AlbumDetailPageStateTearOff();

  _AlbumDetailPageState call({bool viewContent = false}) {
    return _AlbumDetailPageState(
      viewContent: viewContent,
    );
  }
}

/// @nodoc
const $AlbumDetailPageState = _$AlbumDetailPageStateTearOff();

/// @nodoc
mixin _$AlbumDetailPageState {
  bool get viewContent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumDetailPageStateCopyWith<AlbumDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDetailPageStateCopyWith<$Res> {
  factory $AlbumDetailPageStateCopyWith(AlbumDetailPageState value,
          $Res Function(AlbumDetailPageState) then) =
      _$AlbumDetailPageStateCopyWithImpl<$Res>;
  $Res call({bool viewContent});
}

/// @nodoc
class _$AlbumDetailPageStateCopyWithImpl<$Res>
    implements $AlbumDetailPageStateCopyWith<$Res> {
  _$AlbumDetailPageStateCopyWithImpl(this._value, this._then);

  final AlbumDetailPageState _value;
  // ignore: unused_field
  final $Res Function(AlbumDetailPageState) _then;

  @override
  $Res call({
    Object? viewContent = freezed,
  }) {
    return _then(_value.copyWith(
      viewContent: viewContent == freezed
          ? _value.viewContent
          : viewContent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AlbumDetailPageStateCopyWith<$Res>
    implements $AlbumDetailPageStateCopyWith<$Res> {
  factory _$AlbumDetailPageStateCopyWith(_AlbumDetailPageState value,
          $Res Function(_AlbumDetailPageState) then) =
      __$AlbumDetailPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool viewContent});
}

/// @nodoc
class __$AlbumDetailPageStateCopyWithImpl<$Res>
    extends _$AlbumDetailPageStateCopyWithImpl<$Res>
    implements _$AlbumDetailPageStateCopyWith<$Res> {
  __$AlbumDetailPageStateCopyWithImpl(
      _AlbumDetailPageState _value, $Res Function(_AlbumDetailPageState) _then)
      : super(_value, (v) => _then(v as _AlbumDetailPageState));

  @override
  _AlbumDetailPageState get _value => super._value as _AlbumDetailPageState;

  @override
  $Res call({
    Object? viewContent = freezed,
  }) {
    return _then(_AlbumDetailPageState(
      viewContent: viewContent == freezed
          ? _value.viewContent
          : viewContent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AlbumDetailPageState implements _AlbumDetailPageState {
  const _$_AlbumDetailPageState({this.viewContent = false});

  @JsonKey()
  @override
  final bool viewContent;

  @override
  String toString() {
    return 'AlbumDetailPageState(viewContent: $viewContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlbumDetailPageState &&
            const DeepCollectionEquality()
                .equals(other.viewContent, viewContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(viewContent));

  @JsonKey(ignore: true)
  @override
  _$AlbumDetailPageStateCopyWith<_AlbumDetailPageState> get copyWith =>
      __$AlbumDetailPageStateCopyWithImpl<_AlbumDetailPageState>(
          this, _$identity);
}

abstract class _AlbumDetailPageState implements AlbumDetailPageState {
  const factory _AlbumDetailPageState({bool viewContent}) =
      _$_AlbumDetailPageState;

  @override
  bool get viewContent;
  @override
  @JsonKey(ignore: true)
  _$AlbumDetailPageStateCopyWith<_AlbumDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
