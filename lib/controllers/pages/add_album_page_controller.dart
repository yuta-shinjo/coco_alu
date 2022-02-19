import 'dart:io';

import 'package:exif/exif.dart';
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
    @Default('') String imgUrls,
    List<Album>? albums,
    List<Tags>? tag,
    @Default('') String latitudeRef,
    @Default('') String latitude,
    @Default('') String longitudeRef,
    @Default('') String longitude,
    @Default('') String imgTag,
    @Default(false) bool isLoading,
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

  void deleteImage(String imgUrls, File? imgFile) async {
    if (state.imgUrls != '') {
      imgUrls = '';
    }
    if (state.imgFile != null) {
      state = state.copyWith(imgFile: null);
    }
  }

  Future<void> pickImage(XFile? imgFile, String imgUrls) async {
    if (imgFile == null) return;
    state = state.copyWith(imgFile: File(imgFile.path));
    final tags =
        await readExifFromBytes(await File(imgFile.path).readAsBytes());
    state = state.copyWith(
      imgUrls: imgUrls,
      imgTag: tags.toString(),
    );
  }

  final _fireAlbumService = FireAlbumService();

  Future<void> addAlbum(
    String content,
    String imgUrls,
    File? imgFile,
    List<String> tags,
    String imgTag,
  ) async {
    await _fireAlbumService.addAlbum(
      content,
      imgUrls,
      imgFile,
      tags,
      imgTag,
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
  final btnController = RoundedLoadingButtonController();

  void loadingSuccess(RoundedLoadingButtonController controller) {
    controller.success();
  }

  void loadingError(RoundedLoadingButtonController controller) {
    controller.error();
  }
}
