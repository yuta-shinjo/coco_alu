import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/fire_storage_service.dart';
import 'package:my_collection/services/fire_users_service.dart';

part 'album_list_page_controller.freezed.dart';

@freezed
class AlbumListPageState with _$AlbumListPageState {
  const factory AlbumListPageState({
    List<Album>? albums,
  }) = _AlbumListPageState;
}

final albumListPageProvider = StateNotifierProvider.autoDispose<
    AlbumListPageController, AlbumListPageState>((ref) {
  return AlbumListPageController();
});

class AlbumListPageController extends StateNotifier<AlbumListPageState> {
  AlbumListPageController() : super(const AlbumListPageState()) {
    _init();
  }

  final _fireUsersService = FireUsersService();

  void _init() async {
    await _fireUsersService.fetchAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }

  // 作成ページで作成ボタンを押したときにalbum_list_pageのリストを更新するため
  Future<void> fetchAlbumList() async {
    await _fireUsersService.fetchAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }

  Future<void> deleteAlbum(Album album, int index) async {
    final albums = [...?state.albums];
    albums.removeAt(index);
    await _fireUsersService.deleteMyAlbum(album);
    if (album.public) await _fireUsersService.deletePublicAlbum(album);

    state = state.copyWith(albums: albums);
  }

  final _fireStorageService = FireStorageService();

  Future<void> deleteStorage(String id) async =>
      await _fireStorageService.deleteStorage(id);
}
