// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'link_account_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LinkAccountPageStateTearOff {
  const _$LinkAccountPageStateTearOff();

  _LinkAccountPageState call(
      {String newEmail = '', String newPassword = '', String userId = ''}) {
    return _LinkAccountPageState(
      newEmail: newEmail,
      newPassword: newPassword,
      userId: userId,
    );
  }
}

/// @nodoc
const $LinkAccountPageState = _$LinkAccountPageStateTearOff();

/// @nodoc
mixin _$LinkAccountPageState {
  String get newEmail => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LinkAccountPageStateCopyWith<LinkAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkAccountPageStateCopyWith<$Res> {
  factory $LinkAccountPageStateCopyWith(LinkAccountPageState value,
          $Res Function(LinkAccountPageState) then) =
      _$LinkAccountPageStateCopyWithImpl<$Res>;
  $Res call({String newEmail, String newPassword, String userId});
}

/// @nodoc
class _$LinkAccountPageStateCopyWithImpl<$Res>
    implements $LinkAccountPageStateCopyWith<$Res> {
  _$LinkAccountPageStateCopyWithImpl(this._value, this._then);

  final LinkAccountPageState _value;
  // ignore: unused_field
  final $Res Function(LinkAccountPageState) _then;

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
abstract class _$LinkAccountPageStateCopyWith<$Res>
    implements $LinkAccountPageStateCopyWith<$Res> {
  factory _$LinkAccountPageStateCopyWith(_LinkAccountPageState value,
          $Res Function(_LinkAccountPageState) then) =
      __$LinkAccountPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String newEmail, String newPassword, String userId});
}

/// @nodoc
class __$LinkAccountPageStateCopyWithImpl<$Res>
    extends _$LinkAccountPageStateCopyWithImpl<$Res>
    implements _$LinkAccountPageStateCopyWith<$Res> {
  __$LinkAccountPageStateCopyWithImpl(
      _LinkAccountPageState _value, $Res Function(_LinkAccountPageState) _then)
      : super(_value, (v) => _then(v as _LinkAccountPageState));

  @override
  _LinkAccountPageState get _value => super._value as _LinkAccountPageState;

  @override
  $Res call({
    Object? newEmail = freezed,
    Object? newPassword = freezed,
    Object? userId = freezed,
  }) {
    return _then(_LinkAccountPageState(
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

class _$_LinkAccountPageState implements _LinkAccountPageState {
  const _$_LinkAccountPageState(
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
    return 'LinkAccountPageState(newEmail: $newEmail, newPassword: $newPassword, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkAccountPageState &&
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
  _$LinkAccountPageStateCopyWith<_LinkAccountPageState> get copyWith =>
      __$LinkAccountPageStateCopyWithImpl<_LinkAccountPageState>(
          this, _$identity);
}

abstract class _LinkAccountPageState implements LinkAccountPageState {
  const factory _LinkAccountPageState(
      {String newEmail,
      String newPassword,
      String userId}) = _$_LinkAccountPageState;

  @override
  String get newEmail;
  @override
  String get newPassword;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$LinkAccountPageStateCopyWith<_LinkAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
