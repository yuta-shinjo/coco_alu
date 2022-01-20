// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'picture_book_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PictureBookPageStateTearOff {
  const _$PictureBookPageStateTearOff();

  _PictureBookPageState call(
      {Creature creature = const Creature(), List<Creature>? creatures}) {
    return _PictureBookPageState(
      creature: creature,
      creatures: creatures,
    );
  }
}

/// @nodoc
const $PictureBookPageState = _$PictureBookPageStateTearOff();

/// @nodoc
mixin _$PictureBookPageState {
  Creature get creature => throw _privateConstructorUsedError;
  List<Creature>? get creatures => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureBookPageStateCopyWith<PictureBookPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureBookPageStateCopyWith<$Res> {
  factory $PictureBookPageStateCopyWith(PictureBookPageState value,
          $Res Function(PictureBookPageState) then) =
      _$PictureBookPageStateCopyWithImpl<$Res>;
  $Res call({Creature creature, List<Creature>? creatures});

  $CreatureCopyWith<$Res> get creature;
}

/// @nodoc
class _$PictureBookPageStateCopyWithImpl<$Res>
    implements $PictureBookPageStateCopyWith<$Res> {
  _$PictureBookPageStateCopyWithImpl(this._value, this._then);

  final PictureBookPageState _value;
  // ignore: unused_field
  final $Res Function(PictureBookPageState) _then;

  @override
  $Res call({
    Object? creature = freezed,
    Object? creatures = freezed,
  }) {
    return _then(_value.copyWith(
      creature: creature == freezed
          ? _value.creature
          : creature // ignore: cast_nullable_to_non_nullable
              as Creature,
      creatures: creatures == freezed
          ? _value.creatures
          : creatures // ignore: cast_nullable_to_non_nullable
              as List<Creature>?,
    ));
  }

  @override
  $CreatureCopyWith<$Res> get creature {
    return $CreatureCopyWith<$Res>(_value.creature, (value) {
      return _then(_value.copyWith(creature: value));
    });
  }
}

/// @nodoc
abstract class _$PictureBookPageStateCopyWith<$Res>
    implements $PictureBookPageStateCopyWith<$Res> {
  factory _$PictureBookPageStateCopyWith(_PictureBookPageState value,
          $Res Function(_PictureBookPageState) then) =
      __$PictureBookPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Creature creature, List<Creature>? creatures});

  @override
  $CreatureCopyWith<$Res> get creature;
}

/// @nodoc
class __$PictureBookPageStateCopyWithImpl<$Res>
    extends _$PictureBookPageStateCopyWithImpl<$Res>
    implements _$PictureBookPageStateCopyWith<$Res> {
  __$PictureBookPageStateCopyWithImpl(
      _PictureBookPageState _value, $Res Function(_PictureBookPageState) _then)
      : super(_value, (v) => _then(v as _PictureBookPageState));

  @override
  _PictureBookPageState get _value => super._value as _PictureBookPageState;

  @override
  $Res call({
    Object? creature = freezed,
    Object? creatures = freezed,
  }) {
    return _then(_PictureBookPageState(
      creature: creature == freezed
          ? _value.creature
          : creature // ignore: cast_nullable_to_non_nullable
              as Creature,
      creatures: creatures == freezed
          ? _value.creatures
          : creatures // ignore: cast_nullable_to_non_nullable
              as List<Creature>?,
    ));
  }
}

/// @nodoc

class _$_PictureBookPageState implements _PictureBookPageState {
  const _$_PictureBookPageState(
      {this.creature = const Creature(), this.creatures});

  @JsonKey()
  @override
  final Creature creature;
  @override
  final List<Creature>? creatures;

  @override
  String toString() {
    return 'PictureBookPageState(creature: $creature, creatures: $creatures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PictureBookPageState &&
            const DeepCollectionEquality().equals(other.creature, creature) &&
            const DeepCollectionEquality().equals(other.creatures, creatures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(creature),
      const DeepCollectionEquality().hash(creatures));

  @JsonKey(ignore: true)
  @override
  _$PictureBookPageStateCopyWith<_PictureBookPageState> get copyWith =>
      __$PictureBookPageStateCopyWithImpl<_PictureBookPageState>(
          this, _$identity);
}

abstract class _PictureBookPageState implements PictureBookPageState {
  const factory _PictureBookPageState(
      {Creature creature, List<Creature>? creatures}) = _$_PictureBookPageState;

  @override
  Creature get creature;
  @override
  List<Creature>? get creatures;
  @override
  @JsonKey(ignore: true)
  _$PictureBookPageStateCopyWith<_PictureBookPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
