import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'edit_creature_page_controller.freezed.dart';

@freezed
class EditCreaturePageState with _$EditCreaturePageState {
  const factory EditCreaturePageState({
    @Default('') String loginEmail,
    @Default('') String loginPassword,
    @Default('') String infoText,
  }) = _EditCreaturePageState;
}

final editCreaturePageProvider =
StateNotifierProvider.autoDispose<EditCreaturePageController, EditCreaturePageState>(
      (ref) => EditCreaturePageController(),
);

class EditCreaturePageController extends StateNotifier<EditCreaturePageState> {
  EditCreaturePageController() : super(const EditCreaturePageState());


}
