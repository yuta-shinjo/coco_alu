import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/ui/components/components.dart';

part 'tag_chips_page_controller.freezed.dart';

@freezed
class TagChipsPageState with _$TagChipsPageState {
  const factory TagChipsPageState({
    List<Chip>? chipList,
    @Default(0) int keyNumber,
    @Default('') String tagTitle,
  }) = _TagChipsPageState;
}

final tagChipsPageProvider = StateNotifierProvider.autoDispose<
    TagChipsPageController, TagChipsPageState>((ref) {
  return TagChipsPageController();
});

class TagChipsPageController extends StateNotifier<TagChipsPageState> {
  TagChipsPageController() : super(const TagChipsPageState());

  void deleteChip(String text) {
    final chipList = state.chipList;
    print(chipList);
    chipList!.remove(text);
    state = state.copyWith(chipList: chipList);
  }

  void inputTag(String tagTitle) => state = state.copyWith(tagTitle: tagTitle);

  void addChip(String text) {
    state = state.copyWith(keyNumber: state.keyNumber + 1);
    final chipList = [...?state.chipList];
    chipList.add(
      Chip(
        label: Subtitle2Text(text),
        onDeleted: () => deleteChip(text),
      ),
    );
    state = state.copyWith(chipList: chipList);
  }

  final tagController = TextEditingController();

  void onSubmitted(String text) {
    try {
      addChip(text);
      tagController.clear();
    } catch (e) {
      print(e);
    }
  }
}
