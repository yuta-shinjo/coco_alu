// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
class _$AppConfigTearOff {
  const _$AppConfigTearOff();

  _AppConfig call(
      {int minBuildNumberAndroid = 100000, int minBuildNumberIos = 100000}) {
    return _AppConfig(
      minBuildNumberAndroid: minBuildNumberAndroid,
      minBuildNumberIos: minBuildNumberIos,
    );
  }

  AppConfig fromJson(Map<String, Object?> json) {
    return AppConfig.fromJson(json);
  }
}

/// @nodoc
const $AppConfig = _$AppConfigTearOff();

/// @nodoc
mixin _$AppConfig {
  int get minBuildNumberAndroid => throw _privateConstructorUsedError;
  int get minBuildNumberIos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res>;
  $Res call({int minBuildNumberAndroid, int minBuildNumberIos});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res> implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  final AppConfig _value;
  // ignore: unused_field
  final $Res Function(AppConfig) _then;

  @override
  $Res call({
    Object? minBuildNumberAndroid = freezed,
    Object? minBuildNumberIos = freezed,
  }) {
    return _then(_value.copyWith(
      minBuildNumberAndroid: minBuildNumberAndroid == freezed
          ? _value.minBuildNumberAndroid
          : minBuildNumberAndroid // ignore: cast_nullable_to_non_nullable
              as int,
      minBuildNumberIos: minBuildNumberIos == freezed
          ? _value.minBuildNumberIos
          : minBuildNumberIos // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(
          _AppConfig value, $Res Function(_AppConfig) then) =
      __$AppConfigCopyWithImpl<$Res>;
  @override
  $Res call({int minBuildNumberAndroid, int minBuildNumberIos});
}

/// @nodoc
class __$AppConfigCopyWithImpl<$Res> extends _$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(_AppConfig _value, $Res Function(_AppConfig) _then)
      : super(_value, (v) => _then(v as _AppConfig));

  @override
  _AppConfig get _value => super._value as _AppConfig;

  @override
  $Res call({
    Object? minBuildNumberAndroid = freezed,
    Object? minBuildNumberIos = freezed,
  }) {
    return _then(_AppConfig(
      minBuildNumberAndroid: minBuildNumberAndroid == freezed
          ? _value.minBuildNumberAndroid
          : minBuildNumberAndroid // ignore: cast_nullable_to_non_nullable
              as int,
      minBuildNumberIos: minBuildNumberIos == freezed
          ? _value.minBuildNumberIos
          : minBuildNumberIos // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppConfig implements _AppConfig {
  const _$_AppConfig(
      {this.minBuildNumberAndroid = 100000, this.minBuildNumberIos = 100000});

  factory _$_AppConfig.fromJson(Map<String, dynamic> json) =>
      _$$_AppConfigFromJson(json);

  @JsonKey()
  @override
  final int minBuildNumberAndroid;
  @JsonKey()
  @override
  final int minBuildNumberIos;

  @override
  String toString() {
    return 'AppConfig(minBuildNumberAndroid: $minBuildNumberAndroid, minBuildNumberIos: $minBuildNumberIos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppConfig &&
            const DeepCollectionEquality()
                .equals(other.minBuildNumberAndroid, minBuildNumberAndroid) &&
            const DeepCollectionEquality()
                .equals(other.minBuildNumberIos, minBuildNumberIos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(minBuildNumberAndroid),
      const DeepCollectionEquality().hash(minBuildNumberIos));

  @JsonKey(ignore: true)
  @override
  _$AppConfigCopyWith<_AppConfig> get copyWith =>
      __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppConfigToJson(this);
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig({int minBuildNumberAndroid, int minBuildNumberIos}) =
      _$_AppConfig;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$_AppConfig.fromJson;

  @override
  int get minBuildNumberAndroid;
  @override
  int get minBuildNumberIos;
  @override
  @JsonKey(ignore: true)
  _$AppConfigCopyWith<_AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
