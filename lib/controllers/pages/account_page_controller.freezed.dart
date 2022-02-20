// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountPageStateTearOff {
  const _$AccountPageStateTearOff();

  _AccountPageState call(
      {User profile = const User(),
      String name = '',
      String profileImageUrl = '',
      String email = '',
      File? imageFile}) {
    return _AccountPageState(
      profile: profile,
      name: name,
      profileImageUrl: profileImageUrl,
      email: email,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $AccountPageState = _$AccountPageStateTearOff();

/// @nodoc
mixin _$AccountPageState {
  User get profile => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountPageStateCopyWith<AccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountPageStateCopyWith<$Res> {
  factory $AccountPageStateCopyWith(
          AccountPageState value, $Res Function(AccountPageState) then) =
      _$AccountPageStateCopyWithImpl<$Res>;
  $Res call(
      {User profile,
      String name,
      String profileImageUrl,
      String email,
      File? imageFile});

  $UserCopyWith<$Res> get profile;
}

/// @nodoc
class _$AccountPageStateCopyWithImpl<$Res>
    implements $AccountPageStateCopyWith<$Res> {
  _$AccountPageStateCopyWithImpl(this._value, this._then);

  final AccountPageState _value;
  // ignore: unused_field
  final $Res Function(AccountPageState) _then;

  @override
  $Res call({
    Object? profile = freezed,
    Object? name = freezed,
    Object? profileImageUrl = freezed,
    Object? email = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as User,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }

  @override
  $UserCopyWith<$Res> get profile {
    return $UserCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc
abstract class _$AccountPageStateCopyWith<$Res>
    implements $AccountPageStateCopyWith<$Res> {
  factory _$AccountPageStateCopyWith(
          _AccountPageState value, $Res Function(_AccountPageState) then) =
      __$AccountPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User profile,
      String name,
      String profileImageUrl,
      String email,
      File? imageFile});

  @override
  $UserCopyWith<$Res> get profile;
}

/// @nodoc
class __$AccountPageStateCopyWithImpl<$Res>
    extends _$AccountPageStateCopyWithImpl<$Res>
    implements _$AccountPageStateCopyWith<$Res> {
  __$AccountPageStateCopyWithImpl(
      _AccountPageState _value, $Res Function(_AccountPageState) _then)
      : super(_value, (v) => _then(v as _AccountPageState));

  @override
  _AccountPageState get _value => super._value as _AccountPageState;

  @override
  $Res call({
    Object? profile = freezed,
    Object? name = freezed,
    Object? profileImageUrl = freezed,
    Object? email = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_AccountPageState(
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as User,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_AccountPageState implements _AccountPageState {
  const _$_AccountPageState(
      {this.profile = const User(),
      this.name = '',
      this.profileImageUrl = '',
      this.email = '',
      this.imageFile});

  @JsonKey()
  @override
  final User profile;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String profileImageUrl;
  @JsonKey()
  @override
  final String email;
  @override
  final File? imageFile;

  @override
  String toString() {
    return 'AccountPageState(profile: $profile, name: $name, profileImageUrl: $profileImageUrl, email: $email, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountPageState &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profile),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profileImageUrl),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  _$AccountPageStateCopyWith<_AccountPageState> get copyWith =>
      __$AccountPageStateCopyWithImpl<_AccountPageState>(this, _$identity);
}

abstract class _AccountPageState implements AccountPageState {
  const factory _AccountPageState(
      {User profile,
      String name,
      String profileImageUrl,
      String email,
      File? imageFile}) = _$_AccountPageState;

  @override
  User get profile;
  @override
  String get name;
  @override
  String get profileImageUrl;
  @override
  String get email;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$AccountPageStateCopyWith<_AccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
