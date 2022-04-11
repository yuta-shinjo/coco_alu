import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/services/fire_storage_service.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'anonymously_register_profile_page_controller.freezed.dart';

@freezed
class AnonymouslyRegisterProfilePageState
    with _$AnonymouslyRegisterProfilePageState {
  const factory AnonymouslyRegisterProfilePageState({
    @Default('') String name,
    @Default('') String profileImageUrl,
    File? imageFile,
  }) = _AnonymouslyRegisterProfilePageState;
}

final anonymouslyRegisterPageProvider = StateNotifierProvider.autoDispose<
        AnonymouslyRegisterProfilePageController,
        AnonymouslyRegisterProfilePageState>(
    (ref) => AnonymouslyRegisterProfilePageController());

class AnonymouslyRegisterProfilePageController
    extends StateNotifier<AnonymouslyRegisterProfilePageState> {
  AnonymouslyRegisterProfilePageController()
      : super(const AnonymouslyRegisterProfilePageState());

  void inputName(String name) => state = state.copyWith(name: name);

  final profileName = TextEditingController();

  final _fireUsersService = FireUsersService();

  Future<void> pickImage() async {
    //画像取得&軽量化
    final ImagePicker picker = ImagePicker();
    final pickedImageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 1,
    );
    //トリミング
    if (pickedImageFile == null) return;
    final croppedImageFile = await ImageCropper().cropImage(
      sourcePath: pickedImageFile.path,
      cropStyle: CropStyle.circle,
    );
    state = state.copyWith(imageFile: croppedImageFile);
  }

  // firebaseにそのユーザーのデータ欄を作成する
  // 呼び出しているところの引数の順番も大切な気がした
  //(例: profileImageUrl,name,imageFile だったらうまくいかなかった)
  Future<void> createAnonymouslyUserProfile(String name) async {
    await uploadImage();
    await _fireUsersService.registerUserProfile(name, state.profileImageUrl);
  }

  final _fireStorageService = FireStorageService();

  Future<void> uploadImage() async {
    final uploadUrl = await _fireStorageService.uploadProfileImage(
      croppedImageFile: state.imageFile,
    );
    if (uploadUrl == null) return;
    state = state.copyWith(profileImageUrl: uploadUrl);
  }

  // Authenticationにuidを追加する
  Future<void> isRegister() async =>
      await _fireUsersService.anonymouslyRegisterUser();

  final btnController = RoundedLoadingButtonController();
}
