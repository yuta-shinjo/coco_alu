import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/fire_album_service.dart';

part 'map_page_controller.freezed.dart';

@freezed
class MapPageState with _$MapPageState {
  const factory MapPageState({
    @Default('') String markerId,
    @Default('') String content,
    @Default('') String imgUrls,
    List<Album>? albums,
  }) = _MapPageState;
}

final mapPageProvider =
    StateNotifierProvider.autoDispose<MapPageController, MapPageState>(
  (ref) => MapPageController(),
);

class MapPageController extends StateNotifier<MapPageState> {
  MapPageController() : super(const MapPageState()) {
    _init();
  }

  final _fireAlbumService = FireAlbumService();

  void _init() async {
    await _fireAlbumService.fetchAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }

  // 作成ページで作成ボタンを押したときにhomePageのリストを更新するため
  Future<void> fetchAlbumList() async {
    await _fireAlbumService.fetchAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }
}
