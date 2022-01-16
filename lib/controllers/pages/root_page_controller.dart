import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'root_page_controller.freezed.dart';

@freezed
class RootPageState with _$RootPageState {
  const factory RootPageState({
    @Default(0) int tabIndex,
  }) = _RootPageState;
}

final rootPageProvider =
    StateNotifierProvider.autoDispose<RootPageController, RootPageState>(
        (ref) => RootPageController());

class RootPageController extends StateNotifier<RootPageState> {
  RootPageController() : super(const RootPageState());

  void onTabTap(int index) => state = state.copyWith(tabIndex: index);
}
