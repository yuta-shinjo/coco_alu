// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'anonymously_register_profile_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnonymouslyRegisterProfilePageStateTearOff {
  const _$AnonymouslyRegisterProfilePageStateTearOff();

  _AnonymouslyRegisterProfilePageState call(
      {String name = '', String profileImageUrl = '', File? imageFile}) {
    return _AnonymouslyRegisterProfilePageState(
      name: name,
      profileImageUrl: profileImageUrl,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $AnonymouslyRegisterProfilePageState =
    _$AnonymouslyRegisterProfilePageStateTearOff();

/// @nodoc
mixin _$AnonymouslyRegisterProfilePageState {
  String get name => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnonymouslyRegisterProfilePageStateCopyWith<
          AnonymouslyRegisterProfilePageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnonymouslyRegisterProfilePageStateCopyWith<$Res> {
  factory $AnonymouslyRegisterProfilePageStateCopyWith(
          AnonymouslyRegisterProfilePageState value,
          $Res Function(AnonymouslyRegisterProfilePageState) then) =
      _$AnonymouslyRegisterProfilePageStateCopyWithImpl<$Res>;
  $Res call({String name, String profileImageUrl, File? imageFile});
}

/// @nodoc
class _$AnonymouslyRegisterProfilePageStateCopyWithImpl<$Res>
    implements $AnonymouslyRegisterProfilePageStateCopyWith<$Res> {
  _$AnonymouslyRegisterProfilePageStateCopyWithImpl(this._value, this._then);

  final AnonymouslyRegisterProfilePageState _value;
  // ignore: unused_field
  final $Res Function(AnonymouslyRegisterProfilePageState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? profileImageUrl = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$AnonymouslyRegisterProfilePageStateCopyWith<$Res>
    implements $AnonymouslyRegisterProfilePageStateCopyWith<$Res> {
  factory _$AnonymouslyRegisterProfilePageStateCopyWith(
          _AnonymouslyRegisterProfilePageState value,
          $Res Function(_AnonymouslyRegisterProfilePageState) then) =
      __$AnonymouslyRegisterProfilePageStateCopyWithImpl<$Res>;
  @override
  $Res call({String name, String profileImageUrl, File? imageFile});
}

/// @nodoc
class __$AnonymouslyRegisterProfilePageStateCopyWithImpl<$Res>
    extends _$AnonymouslyRegisterProfilePageStateCopyWithImpl<$Res>
    implements _$AnonymouslyRegisterProfilePageStateCopyWith<$Res> {
  __$AnonymouslyRegisterProfilePageStateCopyWithImpl(
      _AnonymouslyRegisterProfilePageState _value,
      $Res Function(_AnonymouslyRegisterProfilePageState) _then)
      : super(_value, (v) => _then(v as _AnonymouslyRegisterProfilePageState));

  @override
  _AnonymouslyRegisterProfilePageState get _value =>
      super._value as _AnonymouslyRegisterProfilePageState;

  @override
  $Res call({
    Object? name = freezed,
    Object? profileImageUrl = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_AnonymouslyRegisterProfilePageState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_AnonymouslyRegisterProfilePageState
    implements _AnonymouslyRegisterProfilePageState {
  const _$_AnonymouslyRegisterProfilePageState(
      {this.name = '', this.profileImageUrl = '', this.imageFile});

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String profileImageUrl;
  @override
  final File? imageFile;

  @override
  String toString() {
    return 'AnonymouslyRegisterProfilePageState(name: $name, profileImageUrl: $profileImageUrl, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnonymouslyRegisterProfilePageState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profileImageUrl),
      const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  _$AnonymouslyRegisterProfilePageStateCopyWith<
          _AnonymouslyRegisterProfilePageState>
      get copyWith => __$AnonymouslyRegisterProfilePageStateCopyWithImpl<
          _AnonymouslyRegisterProfilePageState>(this, _$identity);
}

abstract class _AnonymouslyRegisterProfilePageState
    implements AnonymouslyRegisterProfilePageState {
  const factory _AnonymouslyRegisterProfilePageState(
      {String name,
      String profileImageUrl,
      File? imageFile}) = _$_AnonymouslyRegisterProfilePageState;

  @override
  String get name;
  @override
  String get profileImageUrl;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$AnonymouslyRegisterProfilePageStateCopyWith<
          _AnonymouslyRegisterProfilePageState>
      get copyWith => throw _privateConstructorUsedError;
}
