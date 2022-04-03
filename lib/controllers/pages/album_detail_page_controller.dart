import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'album_detail_page_controller.freezed.dart';

@freezed
class AlbumDetailPageState with _$AlbumDetailPageState {
  const factory AlbumDetailPageState({
    @Default(false) bool viewContent,
  }) = _AlbumDetailPageState;
}

final albumDetailPageProvider = StateNotifierProvider.autoDispose<
    AlbumDetailPageController, AlbumDetailPageState>(
  (ref) => AlbumDetailPageController(),
);

class AlbumDetailPageController extends StateNotifier<AlbumDetailPageState> {
  AlbumDetailPageController() : super(const AlbumDetailPageState());

  // コンテンツの表示の切り替え
  void viewContent() {
    state = state.copyWith(viewContent: !state.viewContent);
  }
}
