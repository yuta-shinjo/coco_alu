import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/services/fire_creature_service.dart';

part 'add_creature_page_controller.freezed.dart';

@freezed
class AddCreaturePageState with _$AddCreaturePageState {
  const factory AddCreaturePageState({
    @Default('') String name,
    @Default('') String kinds,
    @Default('') String location,
    @Default('') String size,
    @Default('') String memo,
    @Default(false) bool isLoading,
    @Default('') String creatureImageUrl,
    @Default('') String id,
    @Default(Creature()) Creature creature,
    File? imageFile,
  }) = _AddCreaturePageState;
}

final addCreaturePageProvider = StateNotifierProvider.autoDispose<
    AddCreaturePageController, AddCreaturePageState>(
  (ref) => AddCreaturePageController(),
);

class AddCreaturePageController extends StateNotifier<AddCreaturePageState> {
  AddCreaturePageController() : super(const AddCreaturePageState());

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

  void deleteImage(String profileImageUrl, File? imageFile) {
    if (state.creatureImageUrl != '') {
      profileImageUrl = '';
    }
    if (state.imageFile != null) {
      state = state.copyWith(imageFile: null);
    }
  }

  Future<void> pickImage(XFile? image, String imageUrl) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
    state = state.copyWith(creatureImageUrl: imageUrl);
  }

  final _fireUsersService = FireCreatureService();

  Future<void> addCreature(
    String name,
    String kinds,
    String? location,
    String? size,
    String? memo,
    String? imageUrl,
    File? imageFile,
    Creature creature,
  ) async {
    await _fireUsersService.addCreature(
      name,
      kinds,
      location,
      size,
      memo,
      imageUrl,
      imageFile,
      creature: creature,
    );
  }

  final nameController = TextEditingController();
  final kindsController = TextEditingController();
  final locationController = TextEditingController();
  final sizeController = TextEditingController();
  final memoController = TextEditingController();
}
