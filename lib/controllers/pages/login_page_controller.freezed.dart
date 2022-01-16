// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginPageStateTearOff {
  const _$LoginPageStateTearOff();

  _LoginPageState call(
      {String loginEmail = '',
      String loginPassword = '',
      String infoText = ''}) {
    return _LoginPageState(
      loginEmail: loginEmail,
      loginPassword: loginPassword,
      infoText: infoText,
    );
  }
}

/// @nodoc
const $LoginPageState = _$LoginPageStateTearOff();

/// @nodoc
mixin _$LoginPageState {
  String get loginEmail => throw _privateConstructorUsedError;
  String get loginPassword => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res>;
  $Res call({String loginEmail, String loginPassword, String infoText});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  final LoginPageState _value;
  // ignore: unused_field
  final $Res Function(LoginPageState) _then;

  @override
  $Res call({
    Object? loginEmail = freezed,
    Object? loginPassword = freezed,
    Object? infoText = freezed,
  }) {
    return _then(_value.copyWith(
      loginEmail: loginEmail == freezed
          ? _value.loginEmail
          : loginEmail // ignore: cast_nullable_to_non_nullable
              as String,
      loginPassword: loginPassword == freezed
          ? _value.loginPassword
          : loginPassword // ignore: cast_nullable_to_non_nullable
              as String,
      infoText: infoText == freezed
          ? _value.infoText
          : infoText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginPageStateCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$LoginPageStateCopyWith(
          _LoginPageState value, $Res Function(_LoginPageState) then) =
      __$LoginPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String loginEmail, String loginPassword, String infoText});
}

/// @nodoc
class __$LoginPageStateCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res>
    implements _$LoginPageStateCopyWith<$Res> {
  __$LoginPageStateCopyWithImpl(
      _LoginPageState _value, $Res Function(_LoginPageState) _then)
      : super(_value, (v) => _then(v as _LoginPageState));

  @override
  _LoginPageState get _value => super._value as _LoginPageState;

  @override
  $Res call({
    Object? loginEmail = freezed,
    Object? loginPassword = freezed,
    Object? infoText = freezed,
  }) {
    return _then(_LoginPageState(
      loginEmail: loginEmail == freezed
          ? _value.loginEmail
          : loginEmail // ignore: cast_nullable_to_non_nullable
              as String,
      loginPassword: loginPassword == freezed
          ? _value.loginPassword
          : loginPassword // ignore: cast_nullable_to_non_nullable
              as String,
      infoText: infoText == freezed
          ? _value.infoText
          : infoText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginPageState implements _LoginPageState {
  const _$_LoginPageState(
      {this.loginEmail = '', this.loginPassword = '', this.infoText = ''});

  @JsonKey()
  @override
  final String loginEmail;
  @JsonKey()
  @override
  final String loginPassword;
  @JsonKey()
  @override
  final String infoText;

  @override
  String toString() {
    return 'LoginPageState(loginEmail: $loginEmail, loginPassword: $loginPassword, infoText: $infoText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginPageState &&
            const DeepCollectionEquality()
                .equals(other.loginEmail, loginEmail) &&
            const DeepCollectionEquality()
                .equals(other.loginPassword, loginPassword) &&
            const DeepCollectionEquality().equals(other.infoText, infoText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loginEmail),
      const DeepCollectionEquality().hash(loginPassword),
      const DeepCollectionEquality().hash(infoText));

  @JsonKey(ignore: true)
  @override
  _$LoginPageStateCopyWith<_LoginPageState> get copyWith =>
      __$LoginPageStateCopyWithImpl<_LoginPageState>(this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  const factory _LoginPageState(
      {String loginEmail,
      String loginPassword,
      String infoText}) = _$_LoginPageState;

  @override
  String get loginEmail;
  @override
  String get loginPassword;
  @override
  String get infoText;
  @override
  @JsonKey(ignore: true)
  _$LoginPageStateCopyWith<_LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
