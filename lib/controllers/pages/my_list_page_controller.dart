import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/fire_users_service.dart';

part 'my_list_page_controller.freezed.dart';

@freezed
class MyListPageState with _$MyListPageState {
  const factory MyListPageState({
    @Default('') String id,
    @Default('') String content,
    @Default('') String imgUrls,
    List<Album>? albums,
  }) = _MyListPageState;
}

final myListPageProvider =
    StateNotifierProvider.autoDispose<MyListPageController, MyListPageState>(
  (ref) => MyListPageController(),
);

class MyListPageController extends StateNotifier<MyListPageState> {
  MyListPageController() : super(const MyListPageState()) {
    _init();
  }

  final _fireUsersService = FireUsersService();

  void _init() async {
    await _fireUsersService.fetchMyAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }

  // 作成ページで作成ボタンを押したときにhomePageのリストを更新するため
  Future<void> fetchAlbumList() async {
    await _fireUsersService.fetchMyAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    ); 
  }
}
