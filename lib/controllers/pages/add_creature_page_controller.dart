import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'add_creature_page_controller.freezed.dart';

@freezed
class AddCreaturePageState with _$AddCreaturePageState {
  const factory AddCreaturePageState({
    @Default('') String loginEmail,
    @Default('') String loginPassword,
    @Default('') String infoText,
  }) = _AddCreaturePageState;
}

final addCreaturePageProvider =
StateNotifierProvider.autoDispose<AddCreaturePageController, AddCreaturePageState>(
      (ref) => AddCreaturePageController(),
);

class AddCreaturePageController extends StateNotifier<AddCreaturePageState> {
  AddCreaturePageController() : super(const AddCreaturePageState());


}
