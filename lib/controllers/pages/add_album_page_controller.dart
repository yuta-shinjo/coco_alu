import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/fire_public_service.dart';
import 'package:my_collection/services/fire_storage_service.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'add_album_page_controller.freezed.dart';

@freezed
class AddAlbumPageState with _$AddAlbumPageState {
  const factory AddAlbumPageState({
    @Default('') String id,
    @Default('') String content,
    @Default('') String imgUrls,
    @Default('') String userId,
    List<String>? tags,
    List<Album>? albums,
    String? tookDay,
    String? latitudeRef,
    String? latitude,
    String? longitudeRef,
    String? longitude,
    @Default(false) bool isLoading,
    @Default(false) bool public,
    // @Default(false) bool like,
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

// 投稿する写真を選び直したときに
// 前回選んだ写真の位置情報が反映されないようにする
  void resetLatLong() {
    state = state.copyWith(
      latitudeRef: null,
      latitude: null,
      longitudeRef: null,
      longitude: null,
      imgFile: null,
    );
  }

  Future<void> pickImage(String imgUrls) async {
    //画像取得&軽量化
    final ImagePicker picker = ImagePicker();
    final pickedImageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 60,
    );
    //トリミング
    if (pickedImageFile == null) return;
    final croppedImageFile = await ImageCropper().cropImage(
      sourcePath: pickedImageFile.path,
    );
    state = state.copyWith(imgFile: croppedImageFile);

    final tags = await readExifFromBytes(await pickedImageFile.readAsBytes());
    final tookDay = tags["Image DateTime"].toString();
    final latitudeRef = tags['GPS GPSLatitudeRef'].toString();

    // 緯度は[35, 12, 1781/100]のような感じで取得できるため、
    // Google Mapで使えるように10進数に変換する
    final lat = tags['GPS GPSLatitude'];
    final changeListLat = lat?.values.toList();
    final lat0 = changeListLat?[0].toDouble();
    final lat1 = changeListLat?[1].toDouble();
    final lat2 = changeListLat?[2].toDouble();
    final latitude = (lat0 + lat1 / 60 + lat2 / 3600).toString();
    final longitudeRef = tags['GPS GPSLongitudeRef'].toString();
    // 経度も同様にGoogle Mapで使えるように10進数に変換する
    final lon = tags['GPS GPSLongitude'];
    final changeListLon = lon?.values.toList();
    final lon0 = changeListLon?[0].toDouble();
    final lon1 = changeListLon?[1].toDouble();
    final lon2 = changeListLon?[2].toDouble();
    final longitude = (lon0 + lon1 / 60 + lon2 / 3600).toString();

    state = state.copyWith(
      imgUrls: imgUrls,
      tookDay: tookDay,
      latitudeRef: latitudeRef,
      latitude: latitude,
      longitudeRef: longitudeRef,
      longitude: longitude,
      imgFile: croppedImageFile,
    );
  }

  final _firePublicService = FirePublicService();
  final _fireUsersService = FireUsersService();

  // firebaseとstorageに同じidで保存できるようにするために
  // 予めidを作成しておく
  Future<void> createId() async {
    final docId = await _fireUsersService.createId();
    state = state.copyWith(id: docId);
  }

  Future<void> createAlbum(
    String content,
    List<String> tags,
  ) async {
    await createId();
    await uploadImage();
    final tagsList = await _fireUsersService.createAlbum(
      content,
      state.imgUrls,
      state.id,
      state.tookDay,
      state.latitudeRef,
      state.latitude,
      state.longitudeRef,
      state.longitude,
      tags,
      state.public,
    );
    // publicがtrueのときfirebaseのpublic部分に追加
    if (state.public)
      await _firePublicService.releaseAlbum(
        content,
        state.imgUrls,
        state.id,
        _firePublicService.auth.currentUser!.uid,
        state.tookDay,
        state.latitudeRef,
        state.latitude,
        state.longitudeRef,
        state.longitude,
        tagsList,
        state.public,
      );
  }

  final _fireStorageService = FireStorageService();

  Future<void> uploadImage() async {
    final uploadUrl = await _fireStorageService.uploadAlbumImage(
      croppedImageFile: state.imgFile,
      id: state.id,
    );
    EasyLoading.dismiss();
    if (uploadUrl == null) return;
    state = state.copyWith(imgUrls: uploadUrl);
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

  void changeToggle() {
    state = state.copyWith(public: !state.public);
  }
}
