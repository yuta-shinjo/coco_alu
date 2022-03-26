// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'root_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RootPageStateTearOff {
  const _$RootPageStateTearOff();

  _RootPageState call(
      {int tabIndex = 0,
      bool needUpdate = false,
      AppConfig appConfig = const AppConfig()}) {
    return _RootPageState(
      tabIndex: tabIndex,
      needUpdate: needUpdate,
      appConfig: appConfig,
    );
  }
}

/// @nodoc
const $RootPageState = _$RootPageStateTearOff();

/// @nodoc
mixin _$RootPageState {
  int get tabIndex => throw _privateConstructorUsedError;
  bool get needUpdate => throw _privateConstructorUsedError;
  AppConfig get appConfig => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RootPageStateCopyWith<RootPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootPageStateCopyWith<$Res> {
  factory $RootPageStateCopyWith(
          RootPageState value, $Res Function(RootPageState) then) =
      _$RootPageStateCopyWithImpl<$Res>;
  $Res call({int tabIndex, bool needUpdate, AppConfig appConfig});

  $AppConfigCopyWith<$Res> get appConfig;
}

/// @nodoc
class _$RootPageStateCopyWithImpl<$Res>
    implements $RootPageStateCopyWith<$Res> {
  _$RootPageStateCopyWithImpl(this._value, this._then);

  final RootPageState _value;
  // ignore: unused_field
  final $Res Function(RootPageState) _then;

  @override
  $Res call({
    Object? tabIndex = freezed,
    Object? needUpdate = freezed,
    Object? appConfig = freezed,
  }) {
    return _then(_value.copyWith(
      tabIndex: tabIndex == freezed
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      needUpdate: needUpdate == freezed
          ? _value.needUpdate
          : needUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      appConfig: appConfig == freezed
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig,
    ));
  }

  @override
  $AppConfigCopyWith<$Res> get appConfig {
    return $AppConfigCopyWith<$Res>(_value.appConfig, (value) {
      return _then(_value.copyWith(appConfig: value));
    });
  }
}

/// @nodoc
abstract class _$RootPageStateCopyWith<$Res>
    implements $RootPageStateCopyWith<$Res> {
  factory _$RootPageStateCopyWith(
          _RootPageState value, $Res Function(_RootPageState) then) =
      __$RootPageStateCopyWithImpl<$Res>;
  @override
  $Res call({int tabIndex, bool needUpdate, AppConfig appConfig});

  @override
  $AppConfigCopyWith<$Res> get appConfig;
}

/// @nodoc
class __$RootPageStateCopyWithImpl<$Res>
    extends _$RootPageStateCopyWithImpl<$Res>
    implements _$RootPageStateCopyWith<$Res> {
  __$RootPageStateCopyWithImpl(
      _RootPageState _value, $Res Function(_RootPageState) _then)
      : super(_value, (v) => _then(v as _RootPageState));

  @override
  _RootPageState get _value => super._value as _RootPageState;

  @override
  $Res call({
    Object? tabIndex = freezed,
    Object? needUpdate = freezed,
    Object? appConfig = freezed,
  }) {
    return _then(_RootPageState(
      tabIndex: tabIndex == freezed
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      needUpdate: needUpdate == freezed
          ? _value.needUpdate
          : needUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      appConfig: appConfig == freezed
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig,
    ));
  }
}

/// @nodoc

class _$_RootPageState implements _RootPageState {
  const _$_RootPageState(
      {this.tabIndex = 0,
      this.needUpdate = false,
      this.appConfig = const AppConfig()});

  @JsonKey()
  @override
  final int tabIndex;
  @JsonKey()
  @override
  final bool needUpdate;
  @JsonKey()
  @override
  final AppConfig appConfig;

  @override
  String toString() {
    return 'RootPageState(tabIndex: $tabIndex, needUpdate: $needUpdate, appConfig: $appConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RootPageState &&
            const DeepCollectionEquality().equals(other.tabIndex, tabIndex) &&
            const DeepCollectionEquality()
                .equals(other.needUpdate, needUpdate) &&
            const DeepCollectionEquality().equals(other.appConfig, appConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tabIndex),
      const DeepCollectionEquality().hash(needUpdate),
      const DeepCollectionEquality().hash(appConfig));

  @JsonKey(ignore: true)
  @override
  _$RootPageStateCopyWith<_RootPageState> get copyWith =>
      __$RootPageStateCopyWithImpl<_RootPageState>(this, _$identity);
}

abstract class _RootPageState implements RootPageState {
  const factory _RootPageState(
      {int tabIndex, bool needUpdate, AppConfig appConfig}) = _$_RootPageState;

  @override
  int get tabIndex;
  @override
  bool get needUpdate;
  @override
  AppConfig get appConfig;
  @override
  @JsonKey(ignore: true)
  _$RootPageStateCopyWith<_RootPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
