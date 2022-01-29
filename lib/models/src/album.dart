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
    @FireTimestampConverterNonNull() DateTime? created,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}