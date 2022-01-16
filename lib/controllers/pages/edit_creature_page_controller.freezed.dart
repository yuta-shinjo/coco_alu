// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_creature_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditCreaturePageStateTearOff {
  const _$EditCreaturePageStateTearOff();

  _EditCreaturePageState call(
      {String loginEmail = '',
      String loginPassword = '',
      String infoText = ''}) {
    return _EditCreaturePageState(
      loginEmail: loginEmail,
      loginPassword: loginPassword,
      infoText: infoText,
    );
  }
}

/// @nodoc
const $EditCreaturePageState = _$EditCreaturePageStateTearOff();

/// @nodoc
mixin _$EditCreaturePageState {
  String get loginEmail => throw _privateConstructorUsedError;
  String get loginPassword => throw _privateConstructorUsedError;
  String get infoText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCreaturePageStateCopyWith<EditCreaturePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCreaturePageStateCopyWith<$Res> {
  factory $EditCreaturePageStateCopyWith(EditCreaturePageState value,
          $Res Function(EditCreaturePageState) then) =
      _$EditCreaturePageStateCopyWithImpl<$Res>;
  $Res call({String loginEmail, String loginPassword, String infoText});
}

/// @nodoc
class _$EditCreaturePageStateCopyWithImpl<$Res>
    implements $EditCreaturePageStateCopyWith<$Res> {
  _$EditCreaturePageStateCopyWithImpl(this._value, this._then);

  final EditCreaturePageState _value;
  // ignore: unused_field
  final $Res Function(EditCreaturePageState) _then;

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
abstract class _$EditCreaturePageStateCopyWith<$Res>
    implements $EditCreaturePageStateCopyWith<$Res> {
  factory _$EditCreaturePageStateCopyWith(_EditCreaturePageState value,
          $Res Function(_EditCreaturePageState) then) =
      __$EditCreaturePageStateCopyWithImpl<$Res>;
  @override
  $Res call({String loginEmail, String loginPassword, String infoText});
}

/// @nodoc
class __$EditCreaturePageStateCopyWithImpl<$Res>
    extends _$EditCreaturePageStateCopyWithImpl<$Res>
    implements _$EditCreaturePageStateCopyWith<$Res> {
  __$EditCreaturePageStateCopyWithImpl(_EditCreaturePageState _value,
      $Res Function(_EditCreaturePageState) _then)
      : super(_value, (v) => _then(v as _EditCreaturePageState));

  @override
  _EditCreaturePageState get _value => super._value as _EditCreaturePageState;

  @override
  $Res call({
    Object? loginEmail = freezed,
    Object? loginPassword = freezed,
    Object? infoText = freezed,
  }) {
    return _then(_EditCreaturePageState(
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

class _$_EditCreaturePageState implements _EditCreaturePageState {
  const _$_EditCreaturePageState(
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
    return 'EditCreaturePageState(loginEmail: $loginEmail, loginPassword: $loginPassword, infoText: $infoText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditCreaturePageState &&
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
  _$EditCreaturePageStateCopyWith<_EditCreaturePageState> get copyWith =>
      __$EditCreaturePageStateCopyWithImpl<_EditCreaturePageState>(
          this, _$identity);
}

abstract class _EditCreaturePageState implements EditCreaturePageState {
  const factory _EditCreaturePageState(
      {String loginEmail,
      String loginPassword,
      String infoText}) = _$_EditCreaturePageState;

  @override
  String get loginEmail;
  @override
  String get loginPassword;
  @override
  String get infoText;
  @override
  @JsonKey(ignore: true)
  _$EditCreaturePageStateCopyWith<_EditCreaturePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
