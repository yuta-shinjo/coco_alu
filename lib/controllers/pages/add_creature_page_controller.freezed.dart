// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_creature_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddCreaturePageStateTearOff {
  const _$AddCreaturePageStateTearOff();

  _AddCreaturePageState call(
      {String loginEmail = '',
      String loginPassword = '',
      String infoText = ''}) {
    return _AddCreaturePageState(
      loginEmail: loginEmail,
      loginPassword: loginPassword,
      infoText: infoText,
    );
  }
}

/// @nodoc
const $AddCreaturePageState = _$AddCreaturePageStateTearOff();

/// @nodoc
mixin _$AddCreaturePageState {
  String get loginEmail => throw _privateConstructorUsedError;
  String get loginPassword => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCreaturePageStateCopyWith<AddCreaturePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCreaturePageStateCopyWith<$Res> {
  factory $AddCreaturePageStateCopyWith(AddCreaturePageState value,
          $Res Function(AddCreaturePageState) then) =
      _$AddCreaturePageStateCopyWithImpl<$Res>;
  $Res call({String loginEmail, String loginPassword, String infoText});
}

/// @nodoc
class _$AddCreaturePageStateCopyWithImpl<$Res>
    implements $AddCreaturePageStateCopyWith<$Res> {
  _$AddCreaturePageStateCopyWithImpl(this._value, this._then);

  final AddCreaturePageState _value;
  // ignore: unused_field
  final $Res Function(AddCreaturePageState) _then;

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
abstract class _$AddCreaturePageStateCopyWith<$Res>
    implements $AddCreaturePageStateCopyWith<$Res> {
  factory _$AddCreaturePageStateCopyWith(_AddCreaturePageState value,
          $Res Function(_AddCreaturePageState) then) =
      __$AddCreaturePageStateCopyWithImpl<$Res>;
  @override
  $Res call({String loginEmail, String loginPassword, String infoText});
}

/// @nodoc
class __$AddCreaturePageStateCopyWithImpl<$Res>
    extends _$AddCreaturePageStateCopyWithImpl<$Res>
    implements _$AddCreaturePageStateCopyWith<$Res> {
  __$AddCreaturePageStateCopyWithImpl(
      _AddCreaturePageState _value, $Res Function(_AddCreaturePageState) _then)
      : super(_value, (v) => _then(v as _AddCreaturePageState));

  @override
  _AddCreaturePageState get _value => super._value as _AddCreaturePageState;

  @override
  $Res call({
    Object? loginEmail = freezed,
    Object? loginPassword = freezed,
    Object? infoText = freezed,
  }) {
    return _then(_AddCreaturePageState(
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

class _$_AddCreaturePageState implements _AddCreaturePageState {
  const _$_AddCreaturePageState(
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
    return 'AddCreaturePageState(loginEmail: $loginEmail, loginPassword: $loginPassword, infoText: $infoText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCreaturePageState &&
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
  _$AddCreaturePageStateCopyWith<_AddCreaturePageState> get copyWith =>
      __$AddCreaturePageStateCopyWithImpl<_AddCreaturePageState>(
          this, _$identity);
}

abstract class _AddCreaturePageState implements AddCreaturePageState {
  const factory _AddCreaturePageState(
      {String loginEmail,
      String loginPassword,
      String infoText}) = _$_AddCreaturePageState;

  @override
  String get loginEmail;
  @override
  String get loginPassword;
  @override
  String get infoText;
  @override
  @JsonKey(ignore: true)
  _$AddCreaturePageStateCopyWith<_AddCreaturePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
