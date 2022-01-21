import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/services/fire_creature_service.dart';

part 'edit_list_page_controller.freezed.dart';

@freezed
class EditListPageState with _$EditListPageState {
  const factory EditListPageState({
    List<Creature>? creatures,
    @Default(Creature()) Creature creature,
    @Default('') String name,
  }) = _EditListPageState;
}

final editListPageProvider = StateNotifierProvider.autoDispose<
    EditListPageController, EditListPageState>((ref) {
  return EditListPageController();
});

class EditListPageController extends StateNotifier<EditListPageState> {
  EditListPageController() : super(const EditListPageState()) {
    _init();
  }

  final _fireCreatureService = FireCreatureService();

  void _init() async {
    _fireCreatureService.fetchCreatureList(
      onValueChanged: (creatures) {
        state = state.copyWith(creatures: creatures);
      },
    );
  }

  Future<void> deleteCreature(Creature creature) async =>
      await _fireCreatureService.deleteCreature(creature);

  Future<void> deleteStorage(String id) async =>
      await _fireCreatureService.deleteStorage(id);

  //TODO
  void endOnReOrder() {
    // state.creatures.clear()..addAll(state.creatures);
  }
}
