import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/tag.dart';
import 'package:my_collection/services/fire_album_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'add_album_page_controller.freezed.dart';

@freezed
class AddAlbumPageState with _$AddAlbumPageState {
  const factory AddAlbumPageState({
    @Default('') String id,
    @Default('') String content,
    @Default('') String imgUrl,
    List<Album>? album,
    List<Tags>? tag,
    @Default(false) bool isLoading,
    @Default(false) bool isTravel,
    @Default(false) bool isFood,
    @Default(false) bool isFamily,
    @Default(false) bool isSelected,
    File? imgFile,
  }) = _AddAlbumPageState;
}

final addAlbumPageProvider = StateNotifierProvider.autoDispose<
    AddAlbumPageController, AddAlbumPageState>(
  (ref) => AddAlbumPageController(),
);

class AddAlbumPageController extends StateNotifier<AddAlbumPageState> {
  AddAlbumPageController() : super(const AddAlbumPageState());

  void inputContent(String content) => state = state.copyWith(content: content);

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void endLoading() {
    state = state.copyWith(isLoading: false);
  }

  void deleteImage(String imgUrl, File? imgFile) async {
    if (state.imgUrl != '') {
      imgUrl = '';
    }
    if (state.imgFile != null) {
      state = state.copyWith(imgFile: null);
    }
  }

  Future<void> pickImage(XFile? imgFile, String imgUrl) async {
    if (imgFile == null) return;
    state = state.copyWith(imgFile: File(imgFile.path));
    state = state.copyWith(imgUrl: imgUrl);
  }

  final _fireAlbumService = FireAlbumService();

  Future<void> addAlbum(
    String content,
    String imgUrls,
    File? imgFile,
    List<String> tags,
  ) async {
    await _fireAlbumService.addAlbum(
      content,
      imgUrls,
      imgFile,
      tags,
    );
  }

  Future<void> addTags(
    List<String> tags,
  ) async {
    await _fireAlbumService.addTags(
      tags,
    );
  }

  final contentController = TextEditingController();
  final tagTextFieldCntroller = TextEditingController();
  final btnController = RoundedLoadingButtonController();

  void loadingSuccess(RoundedLoadingButtonController controller) {
    controller.success();
  }

  void loadingError(RoundedLoadingButtonController controller) {
    controller.error();
  }

  void travelSelect(bool selected) {
    state = state.copyWith(isSelected: selected);
  }

  void foodSelect(bool selected) {
    state = state.copyWith(isFood: selected);
  }

  void familySelect(bool selected) {
    state = state.copyWith(isFamily: selected);
  }
}
