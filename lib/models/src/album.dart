import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_collection/models/libs/fire_timestamp_converter.dart';

part 'album.freezed.dart';

part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    @Default('') String id,
    @Default('') String content,
    @Default('') String imgUrls,
    @Default(<String>[]) List<String> tags,
    @Default(false) bool public,
    @Default('') String latitudeRef,
    @Default('') String latitude,
    @Default('') String longitudeRef,
    @Default('') String longitude,
    @Default('') String imgLocation,
    @FireTimestampConverterNonNull() required DateTime created,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
