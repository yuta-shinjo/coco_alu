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
      latitudeRef: latitudeRef,
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
      longitude,
    );
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

abstract class IfdValues {
  const IfdValues();

  List toList();

  int get length;

  int firstAsInt();

  int secondInt();
}
