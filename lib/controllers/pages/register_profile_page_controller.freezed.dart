// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_profile_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterProfilePageStateTearOff {
  const _$RegisterProfilePageStateTearOff();

  _RegisterProfilePageState call(
      {String name = '', String profileImageUrl = '', File? imageFile}) {
    return _RegisterProfilePageState(
      name: name,
      profileImageUrl: profileImageUrl,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $RegisterProfilePageState = _$RegisterProfilePageStateTearOff();

/// @nodoc
mixin _$RegisterProfilePageState {
  String get name => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterProfilePageStateCopyWith<RegisterProfilePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterProfilePageStateCopyWith<$Res> {
  factory $RegisterProfilePageStateCopyWith(RegisterProfilePageState value,
          $Res Function(RegisterProfilePageState) then) =
      _$RegisterProfilePageStateCopyWithImpl<$Res>;
  $Res call({String name, String profileImageUrl, File? imageFile});
}

/// @nodoc
class _$RegisterProfilePageStateCopyWithImpl<$Res>
    implements $RegisterProfilePageStateCopyWith<$Res> {
  _$RegisterProfilePageStateCopyWithImpl(this._value, this._then);

  final RegisterProfilePageState _value;
  // ignore: unused_field
  final $Res Function(RegisterProfilePageState) _then;

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
abstract class _$RegisterProfilePageStateCopyWith<$Res>
    implements $RegisterProfilePageStateCopyWith<$Res> {
  factory _$RegisterProfilePageStateCopyWith(_RegisterProfilePageState value,
          $Res Function(_RegisterProfilePageState) then) =
      __$RegisterProfilePageStateCopyWithImpl<$Res>;
  @override
  $Res call({String name, String profileImageUrl, File? imageFile});
}

/// @nodoc
class __$RegisterProfilePageStateCopyWithImpl<$Res>
    extends _$RegisterProfilePageStateCopyWithImpl<$Res>
    implements _$RegisterProfilePageStateCopyWith<$Res> {
  __$RegisterProfilePageStateCopyWithImpl(_RegisterProfilePageState _value,
      $Res Function(_RegisterProfilePageState) _then)
      : super(_value, (v) => _then(v as _RegisterProfilePageState));

  @override
  _RegisterProfilePageState get _value =>
      super._value as _RegisterProfilePageState;

  @override
  $Res call({
    Object? name = freezed,
    Object? profileImageUrl = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_RegisterProfilePageState(
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

class _$_RegisterProfilePageState implements _RegisterProfilePageState {
  const _$_RegisterProfilePageState(
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
    return 'RegisterProfilePageState(name: $name, profileImageUrl: $profileImageUrl, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterProfilePageState &&
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
  _$RegisterProfilePageStateCopyWith<_RegisterProfilePageState> get copyWith =>
      __$RegisterProfilePageStateCopyWithImpl<_RegisterProfilePageState>(
          this, _$identity);
}

abstract class _RegisterProfilePageState implements RegisterProfilePageState {
  const factory _RegisterProfilePageState(
      {String name,
      String profileImageUrl,
      File? imageFile}) = _$_RegisterProfilePageState;

  @override
  String get name;
  @override
  String get profileImageUrl;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$RegisterProfilePageStateCopyWith<_RegisterProfilePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
