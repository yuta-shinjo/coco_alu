// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Creature _$CreatureFromJson(Map<String, dynamic> json) {
  return _Creature.fromJson(json);
}

/// @nodoc
class _$CreatureTearOff {
  const _$CreatureTearOff();

  _Creature call(
      {String name = '',
      String kinds = '',
      String size = '',
      String location = '',
      String memo = '',
      String imageUrl = ''}) {
    return _Creature(
      name: name,
      kinds: kinds,
      size: size,
      location: location,
      memo: memo,
      imageUrl: imageUrl,
    );
  }

  Creature fromJson(Map<String, Object?> json) {
    return Creature.fromJson(json);
  }
}

/// @nodoc
const $Creature = _$CreatureTearOff();

/// @nodoc
mixin _$Creature {
  String get name => throw _privateConstructorUsedError;
  String get kinds => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatureCopyWith<Creature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatureCopyWith<$Res> {
  factory $CreatureCopyWith(Creature value, $Res Function(Creature) then) =
      _$CreatureCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String kinds,
      String size,
      String location,
      String memo,
      String imageUrl});
}

/// @nodoc
class _$CreatureCopyWithImpl<$Res> implements $CreatureCopyWith<$Res> {
  _$CreatureCopyWithImpl(this._value, this._then);

  final Creature _value;
  // ignore: unused_field
  final $Res Function(Creature) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? kinds = freezed,
    Object? size = freezed,
    Object? location = freezed,
    Object? memo = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kinds: kinds == freezed
          ? _value.kinds
          : kinds // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreatureCopyWith<$Res> implements $CreatureCopyWith<$Res> {
  factory _$CreatureCopyWith(_Creature value, $Res Function(_Creature) then) =
      __$CreatureCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String kinds,
      String size,
      String location,
      String memo,
      String imageUrl});
}

/// @nodoc
class __$CreatureCopyWithImpl<$Res> extends _$CreatureCopyWithImpl<$Res>
    implements _$CreatureCopyWith<$Res> {
  __$CreatureCopyWithImpl(_Creature _value, $Res Function(_Creature) _then)
      : super(_value, (v) => _then(v as _Creature));

  @override
  _Creature get _value => super._value as _Creature;

  @override
  $Res call({
    Object? name = freezed,
    Object? kinds = freezed,
    Object? size = freezed,
    Object? location = freezed,
    Object? memo = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Creature(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kinds: kinds == freezed
          ? _value.kinds
          : kinds // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Creature implements _Creature {
  const _$_Creature(
      {this.name = '',
      this.kinds = '',
      this.size = '',
      this.location = '',
      this.memo = '',
      this.imageUrl = ''});

  factory _$_Creature.fromJson(Map<String, dynamic> json) =>
      _$$_CreatureFromJson(json);

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String kinds;
  @JsonKey()
  @override
  final String size;
  @JsonKey()
  @override
  final String location;
  @JsonKey()
  @override
  final String memo;
  @JsonKey()
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Creature(name: $name, kinds: $kinds, size: $size, location: $location, memo: $memo, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Creature &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.kinds, kinds) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(kinds),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$CreatureCopyWith<_Creature> get copyWith =>
      __$CreatureCopyWithImpl<_Creature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatureToJson(this);
  }
}

abstract class _Creature implements Creature {
  const factory _Creature(
      {String name,
      String kinds,
      String size,
      String location,
      String memo,
      String imageUrl}) = _$_Creature;

  factory _Creature.fromJson(Map<String, dynamic> json) = _$_Creature.fromJson;

  @override
  String get name;
  @override
  String get kinds;
  @override
  String get size;
  @override
  String get location;
  @override
  String get memo;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$CreatureCopyWith<_Creature> get copyWith =>
      throw _privateConstructorUsedError;
}
