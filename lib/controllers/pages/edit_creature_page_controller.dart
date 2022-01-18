import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/services/fire_creature_service.dart';

part 'edit_creature_page_controller.freezed.dart';

@freezed
class EditCreaturePageState with _$EditCreaturePageState {
  const factory EditCreaturePageState({
    @Default('') String name,
    @Default('') String kinds,
    @Default('') String location,
    @Default('') String size,
    @Default('') String memo,
    @Default(false) bool isLoading,
    @Default(false) bool changeFlag,
    @Default('') String creatureImageUrl,
    File? imageFile,
  }) = _EditCreaturePageState;
}

final editCreaturePageProvider = StateNotifierProvider.autoDispose<
    EditCreaturePageController, EditCreaturePageState>(
  (ref) => EditCreaturePageController(),
);

class EditCreaturePageController extends StateNotifier<EditCreaturePageState> {
  EditCreaturePageController() : super(const EditCreaturePageState());

  void inputName(String name) => state = state.copyWith(name: name);

  void inputKinds(String kinds) => state = state.copyWith(kinds: kinds);

  void inputLocation(String location) =>
      state = state.copyWith(location: location);

  void inputSize(String size) => state = state.copyWith(size: size);

  void inputMemo(String memo) => state = state.copyWith(memo: memo);

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void endLoading() {
    state = state.copyWith(isLoading: false);
  }

  ImageProvider displayImage() {
    if (state.imageFile != null) {
      return Image.file(state.imageFile!).image;
    }
    if (state.creatureImageUrl != '') {
      return NetworkImage(state.creatureImageUrl);
    }
    return Image.asset(kDefaultImageURL).image;
  }

  void deleteImage(String profileImageUrl, File? imageFile) {
    if (state.creatureImageUrl != '') {
      profileImageUrl = '';
    }
    if (state.imageFile != null) {
      state = state.copyWith(imageFile: null);
    }
  }

  final _fireUsersService = FireCreatureService();

  Future<void> updateCreature(
    String? name,
    String? kinds,
    String? location,
    String? size,
    String? memo,
    String? imgUrl,
    File? imageFile,
  ) async {
    await _fireUsersService.updateCreature(
      name,
      kinds,
      location,
      size,
      memo,
      imgUrl,
      imageFile,
    );
  }

  Future<void> pickImage(XFile? image, String imageUrl) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
    state = state.copyWith(creatureImageUrl: imageUrl);
  }

  final nameController = TextEditingController();
  final kindsController = TextEditingController();
  final locationController = TextEditingController();
  final sizeController = TextEditingController();
  final memoController = TextEditingController();

  void ableButton() {
    state = state.copyWith(changeFlag: true);
  }
}
