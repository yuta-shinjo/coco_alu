import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/services/fire_users_service.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default('') String id,
    @Default('') String content,
    @Default('') String imgUrls,
    @Default(false) bool viewContent,
    @Default(User()) User profile,
    List<Album>? albums,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
  (ref) => HomePageController(),
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController() : super(const HomePageState()) {
    _init();
  }

  final _fireUsersService = FireUsersService();

  void _init() async {
    await _fireUsersService.fetchPublicAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }

  // 作成ページで作成ボタンを押したときにhomePageのリストを更新するため
  Future<void> fetchPublicAlbumList() async {
    await _fireUsersService.fetchPublicAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
    );
  }

  Future<void> fetchCreatedUserProfile(String createdUserId) async {
    final profile =
        await _fireUsersService.fetchCreatedUserProfile(createdUserId);
    if (profile != null) state = state.copyWith(profile: profile);
  }

  void viewContent() {
    state = state.copyWith(viewContent: !state.viewContent);
  }
}
