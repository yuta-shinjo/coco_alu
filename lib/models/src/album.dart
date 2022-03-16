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
    @Default('') String createdUser,
    @Default(0) int likedCount,
    @Default(<String>[]) List<String> tags,
    @Default(<String>[]) List<String> likedUser,
    @Default(false) bool public,
    String? latitudeRef,
    String? latitude,
    String? longitudeRef,
    String? longitude,
    String? tookDay,
    @FireTimestampConverterNonNull() required DateTime created,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
