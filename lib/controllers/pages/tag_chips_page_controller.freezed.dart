// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_chips_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TagChipsPageStateTearOff {
  const _$TagChipsPageStateTearOff();

  _TagChipsPageState call(
      {List<Chip>? chipList, int keyNumber = 0, String tagTitle = ''}) {
    return _TagChipsPageState(
      chipList: chipList,
      keyNumber: keyNumber,
      tagTitle: tagTitle,
    );
  }
}

/// @nodoc
const $TagChipsPageState = _$TagChipsPageStateTearOff();

/// @nodoc
mixin _$TagChipsPageState {
  List<Chip>? get chipList => throw _privateConstructorUsedError;
  int get keyNumber => throw _privateConstructorUsedError;
  String get tagTitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagChipsPageStateCopyWith<TagChipsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagChipsPageStateCopyWith<$Res> {
  factory $TagChipsPageStateCopyWith(
          TagChipsPageState value, $Res Function(TagChipsPageState) then) =
      _$TagChipsPageStateCopyWithImpl<$Res>;
  $Res call({List<Chip>? chipList, int keyNumber, String tagTitle});
}

/// @nodoc
class _$TagChipsPageStateCopyWithImpl<$Res>
    implements $TagChipsPageStateCopyWith<$Res> {
  _$TagChipsPageStateCopyWithImpl(this._value, this._then);

  final TagChipsPageState _value;
  // ignore: unused_field
  final $Res Function(TagChipsPageState) _then;

  @override
  $Res call({
    Object? chipList = freezed,
    Object? keyNumber = freezed,
    Object? tagTitle = freezed,
  }) {
    return _then(_value.copyWith(
      chipList: chipList == freezed
          ? _value.chipList
          : chipList // ignore: cast_nullable_to_non_nullable
              as List<Chip>?,
      keyNumber: keyNumber == freezed
          ? _value.keyNumber
          : keyNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tagTitle: tagTitle == freezed
          ? _value.tagTitle
          : tagTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TagChipsPageStateCopyWith<$Res>
    implements $TagChipsPageStateCopyWith<$Res> {
  factory _$TagChipsPageStateCopyWith(
          _TagChipsPageState value, $Res Function(_TagChipsPageState) then) =
      __$TagChipsPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Chip>? chipList, int keyNumber, String tagTitle});
}

/// @nodoc
class __$TagChipsPageStateCopyWithImpl<$Res>
    extends _$TagChipsPageStateCopyWithImpl<$Res>
    implements _$TagChipsPageStateCopyWith<$Res> {
  __$TagChipsPageStateCopyWithImpl(
      _TagChipsPageState _value, $Res Function(_TagChipsPageState) _then)
      : super(_value, (v) => _then(v as _TagChipsPageState));

  @override
  _TagChipsPageState get _value => super._value as _TagChipsPageState;

  @override
  $Res call({
    Object? chipList = freezed,
    Object? keyNumber = freezed,
    Object? tagTitle = freezed,
  }) {
    return _then(_TagChipsPageState(
      chipList: chipList == freezed
          ? _value.chipList
          : chipList // ignore: cast_nullable_to_non_nullable
              as List<Chip>?,
      keyNumber: keyNumber == freezed
          ? _value.keyNumber
          : keyNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tagTitle: tagTitle == freezed
          ? _value.tagTitle
          : tagTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TagChipsPageState implements _TagChipsPageState {
  const _$_TagChipsPageState(
      {this.chipList, this.keyNumber = 0, this.tagTitle = ''});

  @override
  final List<Chip>? chipList;
  @JsonKey()
  @override
  final int keyNumber;
  @JsonKey()
  @override
  final String tagTitle;

  @override
  String toString() {
    return 'TagChipsPageState(chipList: $chipList, keyNumber: $keyNumber, tagTitle: $tagTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagChipsPageState &&
            const DeepCollectionEquality().equals(other.chipList, chipList) &&
            const DeepCollectionEquality().equals(other.keyNumber, keyNumber) &&
            const DeepCollectionEquality().equals(other.tagTitle, tagTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chipList),
      const DeepCollectionEquality().hash(keyNumber),
      const DeepCollectionEquality().hash(tagTitle));

  @JsonKey(ignore: true)
  @override
  _$TagChipsPageStateCopyWith<_TagChipsPageState> get copyWith =>
      __$TagChipsPageStateCopyWithImpl<_TagChipsPageState>(this, _$identity);
}

abstract class _TagChipsPageState implements TagChipsPageState {
  const factory _TagChipsPageState(
      {List<Chip>? chipList,
      int keyNumber,
      String tagTitle}) = _$_TagChipsPageState;

  @override
  List<Chip>? get chipList;
  @override
  int get keyNumber;
  @override
  String get tagTitle;
  @override
  @JsonKey(ignore: true)
  _$TagChipsPageStateCopyWith<_TagChipsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
