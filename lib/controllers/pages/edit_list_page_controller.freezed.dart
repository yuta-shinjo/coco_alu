// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_list_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditListPageStateTearOff {
  const _$EditListPageStateTearOff();

  _EditListPageState call(
      {List<Creature>? creatures,
      Creature creature = const Creature(),
      String name = ''}) {
    return _EditListPageState(
      creatures: creatures,
      creature: creature,
      name: name,
    );
  }
}

/// @nodoc
const $EditListPageState = _$EditListPageStateTearOff();

/// @nodoc
mixin _$EditListPageState {
  List<Creature>? get creatures => throw _privateConstructorUsedError;
  Creature get creature => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditListPageStateCopyWith<EditListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditListPageStateCopyWith<$Res> {
  factory $EditListPageStateCopyWith(
          EditListPageState value, $Res Function(EditListPageState) then) =
      _$EditListPageStateCopyWithImpl<$Res>;
  $Res call({List<Creature>? creatures, Creature creature, String name});

  $CreatureCopyWith<$Res> get creature;
}

/// @nodoc
class _$EditListPageStateCopyWithImpl<$Res>
    implements $EditListPageStateCopyWith<$Res> {
  _$EditListPageStateCopyWithImpl(this._value, this._then);

  final EditListPageState _value;
  // ignore: unused_field
  final $Res Function(EditListPageState) _then;

  @override
  $Res call({
    Object? creatures = freezed,
    Object? creature = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      creatures: creatures == freezed
          ? _value.creatures
          : creatures // ignore: cast_nullable_to_non_nullable
              as List<Creature>?,
      creature: creature == freezed
          ? _value.creature
          : creature // ignore: cast_nullable_to_non_nullable
              as Creature,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$EditListPageStateCopyWith<$Res>
    implements $EditListPageStateCopyWith<$Res> {
  factory _$EditListPageStateCopyWith(
          _EditListPageState value, $Res Function(_EditListPageState) then) =
      __$EditListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Creature>? creatures, Creature creature, String name});

  @override
  $CreatureCopyWith<$Res> get creature;
}

/// @nodoc
class __$EditListPageStateCopyWithImpl<$Res>
    extends _$EditListPageStateCopyWithImpl<$Res>
    implements _$EditListPageStateCopyWith<$Res> {
  __$EditListPageStateCopyWithImpl(
      _EditListPageState _value, $Res Function(_EditListPageState) _then)
      : super(_value, (v) => _then(v as _EditListPageState));

  @override
  _EditListPageState get _value => super._value as _EditListPageState;

  @override
  $Res call({
    Object? creatures = freezed,
    Object? creature = freezed,
    Object? name = freezed,
  }) {
    return _then(_EditListPageState(
      creatures: creatures == freezed
          ? _value.creatures
          : creatures // ignore: cast_nullable_to_non_nullable
              as List<Creature>?,
      creature: creature == freezed
          ? _value.creature
          : creature // ignore: cast_nullable_to_non_nullable
              as Creature,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditListPageState implements _EditListPageState {
  const _$_EditListPageState(
      {this.creatures, this.creature = const Creature(), this.name = ''});

  @override
  final List<Creature>? creatures;
  @JsonKey()
  @override
  final Creature creature;
  @JsonKey()
  @override
  final String name;

  @override
  String toString() {
    return 'EditListPageState(creatures: $creatures, creature: $creature, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditListPageState &&
            const DeepCollectionEquality().equals(other.creatures, creatures) &&
            const DeepCollectionEquality().equals(other.creature, creature) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(creatures),
      const DeepCollectionEquality().hash(creature),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$EditListPageStateCopyWith<_EditListPageState> get copyWith =>
      __$EditListPageStateCopyWithImpl<_EditListPageState>(this, _$identity);
}

abstract class _EditListPageState implements EditListPageState {
  const factory _EditListPageState(
      {List<Creature>? creatures,
      Creature creature,
      String name}) = _$_EditListPageState;

  @override
  List<Creature>? get creatures;
  @override
  Creature get creature;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$EditListPageStateCopyWith<_EditListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
