// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return _Tags.fromJson(json);
}

/// @nodoc
class _$TagsTearOff {
  const _$TagsTearOff();

  _Tags call({String title = '', bool isSelected = false}) {
    return _Tags(
      title: title,
      isSelected: isSelected,
    );
  }

  Tags fromJson(Map<String, Object?> json) {
    return Tags.fromJson(json);
  }
}

/// @nodoc
const $Tags = _$TagsTearOff();

/// @nodoc
mixin _$Tags {
  String get title => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagsCopyWith<Tags> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsCopyWith<$Res> {
  factory $TagsCopyWith(Tags value, $Res Function(Tags) then) =
      _$TagsCopyWithImpl<$Res>;
  $Res call({String title, bool isSelected});
}

/// @nodoc
class _$TagsCopyWithImpl<$Res> implements $TagsCopyWith<$Res> {
  _$TagsCopyWithImpl(this._value, this._then);

  final Tags _value;
  // ignore: unused_field
  final $Res Function(Tags) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TagsCopyWith<$Res> implements $TagsCopyWith<$Res> {
  factory _$TagsCopyWith(_Tags value, $Res Function(_Tags) then) =
      __$TagsCopyWithImpl<$Res>;
  @override
  $Res call({String title, bool isSelected});
}

/// @nodoc
class __$TagsCopyWithImpl<$Res> extends _$TagsCopyWithImpl<$Res>
    implements _$TagsCopyWith<$Res> {
  __$TagsCopyWithImpl(_Tags _value, $Res Function(_Tags) _then)
      : super(_value, (v) => _then(v as _Tags));

  @override
  _Tags get _value => super._value as _Tags;

  @override
  $Res call({
    Object? title = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_Tags(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tags implements _Tags {
  const _$_Tags({this.title = '', this.isSelected = false});

  factory _$_Tags.fromJson(Map<String, dynamic> json) => _$$_TagsFromJson(json);

  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'Tags(title: $title, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tags &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$TagsCopyWith<_Tags> get copyWith =>
      __$TagsCopyWithImpl<_Tags>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagsToJson(this);
  }
}

abstract class _Tags implements Tags {
  const factory _Tags({String title, bool isSelected}) = _$_Tags;

  factory _Tags.fromJson(Map<String, dynamic> json) = _$_Tags.fromJson;

  @override
  String get title;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$TagsCopyWith<_Tags> get copyWith => throw _privateConstructorUsedError;
}
