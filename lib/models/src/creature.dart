import 'package:freezed_annotation/freezed_annotation.dart';

part 'creature.freezed.dart';

part 'creature.g.dart';

@freezed
class Creature with _$Creature {
  const factory Creature({
    @Default('') String name,
    @Default('') String kinds,
    @Default('') String size,
    @Default('') String location,
    @Default('') String memo,
    @Default('') String imageUrl,
  }) = _Creature;

  factory Creature.fromJson(Map<String, dynamic> json) => _$CreatureFromJson(json);
}
