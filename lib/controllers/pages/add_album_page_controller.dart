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
    String? latitudeRef,
    String? latitude,
    String? longitudeRef,
    String? longitude,
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

  // 投稿後に投稿ページに写真を残さないようにするため
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
    final latitudeRef = tags['GPS GPSLatitudeRef'].toString();
    final latitude = tags['GPS GPSLatitude'].toString();
    final longitudeRef = tags['GPS GPSLongitudeRef'].toString();
    final longitude = tags['GPS GPSLongitude'].toString();
    state = state.copyWith(
      imgUrls: imgUrls,
      latitudeRef:latitudeRef,
      latitude: latitude,
      longitudeRef: longitudeRef,
      longitude: longitude,
    );
  }

  final _fireAlbumService = FireAlbumService();

  Future<void> addAlbum(
    String content,
    String imgUrls,
    File? imgFile,
    List<String> tags,
    String? latitudeRef,
    String? latitude,
    String? longitudeRef,
    String? longitude,
  ) async {
    await _fireAlbumService.addAlbum(
      content,
      imgUrls,
      imgFile,
      tags,
latitudeRef,
  latitude,
     longitudeRef,
     longitude,    );
  }

  // contentを記述したalbumを作成した後に
  // contentなしのalbumを作成すると前回のcontentのデータになってしまうため
  // contentを初期化
  void clearContent() {
    state = state.copyWith(content: '');
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
