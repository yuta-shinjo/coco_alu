import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/utilities.dart';

part 'tag_chips_page_controller.freezed.dart';

@freezed
class TagChipsPageState with _$TagChipsPageState {
  const factory TagChipsPageState({
    List<Chip>? chipList,
    List<String>? labelList,
    @Default('') String tagTitle,
  }) = _TagChipsPageState;
}

final tagChipsPageProvider = StateNotifierProvider.autoDispose<
    TagChipsPageController, TagChipsPageState>((ref) {
  return TagChipsPageController();
});

class TagChipsPageController extends StateNotifier<TagChipsPageState> {
  TagChipsPageController() : super(const TagChipsPageState());

  void inputTag(String tagTitle) => state = state.copyWith(tagTitle: tagTitle);

  final tagController = TextEditingController();

  void onSubmitted(String text) {
    // 空のタグを追加できないようにしている
    if (text != '') {
      try {
        addChip(text);
        tagController.clear();
      } catch (e) {
        print(e);
      }
    }
  }

  void addChip(String text) {
    final labelList = [...?state.labelList];
    // 同じやつを追加できないようにする
    if (!labelList.contains(text)) {
      labelList.add(text);
      state = state.copyWith(labelList: labelList);
    } else {
      notAddChip();
    }
  }

  Future<void> deleteChip(int index) async {
    final labelList = [...?state.labelList];
    labelList.removeAt(index);
    state = state.copyWith(labelList: labelList);
  }

  void clearChips() {
    state = state.copyWith(labelList: []);
  }
}
