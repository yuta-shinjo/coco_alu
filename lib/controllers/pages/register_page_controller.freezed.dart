// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterPageStateTearOff {
  const _$RegisterPageStateTearOff();

  _RegisterPageState call(
      {String newEmail = '', String newPassword = '', String userId = ''}) {
    return _RegisterPageState(
      newEmail: newEmail,
      newPassword: newPassword,
      userId: userId,
    );
  }
}

/// @nodoc
const $RegisterPageState = _$RegisterPageStateTearOff();

/// @nodoc
mixin _$RegisterPageState {
  String get newEmail => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterPageStateCopyWith<RegisterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPageStateCopyWith<$Res> {
  factory $RegisterPageStateCopyWith(
          RegisterPageState value, $Res Function(RegisterPageState) then) =
      _$RegisterPageStateCopyWithImpl<$Res>;
  $Res call({String newEmail, String newPassword, String userId});
}

/// @nodoc
class _$RegisterPageStateCopyWithImpl<$Res>
    implements $RegisterPageStateCopyWith<$Res> {
  _$RegisterPageStateCopyWithImpl(this._value, this._then);

  final RegisterPageState _value;
  // ignore: unused_field
  final $Res Function(RegisterPageState) _then;

  @override
  $Res call({
    Object? newEmail = freezed,
    Object? newPassword = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      newEmail: newEmail == freezed
          ? _value.newEmail
          : newEmail // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RegisterPageStateCopyWith<$Res>
    implements $RegisterPageStateCopyWith<$Res> {
  factory _$RegisterPageStateCopyWith(
          _RegisterPageState value, $Res Function(_RegisterPageState) then) =
      __$RegisterPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String newEmail, String newPassword, String userId});
}

/// @nodoc
class __$RegisterPageStateCopyWithImpl<$Res>
    extends _$RegisterPageStateCopyWithImpl<$Res>
    implements _$RegisterPageStateCopyWith<$Res> {
  __$RegisterPageStateCopyWithImpl(
      _RegisterPageState _value, $Res Function(_RegisterPageState) _then)
      : super(_value, (v) => _then(v as _RegisterPageState));

  @override
  _RegisterPageState get _value => super._value as _RegisterPageState;

  @override
  $Res call({
    Object? newEmail = freezed,
    Object? newPassword = freezed,
    Object? userId = freezed,
  }) {
    return _then(_RegisterPageState(
      newEmail: newEmail == freezed
          ? _value.newEmail
          : newEmail // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterPageState implements _RegisterPageState {
  const _$_RegisterPageState(
      {this.newEmail = '', this.newPassword = '', this.userId = ''});

  @JsonKey()
  @override
  final String newEmail;
  @JsonKey()
  @override
  final String newPassword;
  @JsonKey()
  @override
  final String userId;

  @override
  String toString() {
    return 'RegisterPageState(newEmail: $newEmail, newPassword: $newPassword, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterPageState &&
            const DeepCollectionEquality().equals(other.newEmail, newEmail) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newEmail),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$RegisterPageStateCopyWith<_RegisterPageState> get copyWith =>
      __$RegisterPageStateCopyWithImpl<_RegisterPageState>(this, _$identity);
}

abstract class _RegisterPageState implements RegisterPageState {
  const factory _RegisterPageState(
      {String newEmail,
      String newPassword,
      String userId}) = _$_RegisterPageState;

  @override
  String get newEmail;
  @override
  String get newPassword;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$RegisterPageStateCopyWith<_RegisterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
