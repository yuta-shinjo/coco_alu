import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/services/fire_storage_service.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'register_profile_page_controller.freezed.dart';

@freezed
class RegisterProfilePageState with _$RegisterProfilePageState {
  const factory RegisterProfilePageState({
    @Default('') String name,
    @Default('') String profileImageUrl,
    File? imageFile,
  }) = _RegisterProfilePageState;
}

final registerProfilePageProvider = StateNotifierProvider.autoDispose<
    RegisterProfilePageController, RegisterProfilePageState>(
  (ref) {
    return RegisterProfilePageController();
  },
);

class RegisterProfilePageController
    extends StateNotifier<RegisterProfilePageState> {
  RegisterProfilePageController() : super(const RegisterProfilePageState());

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

  Future<void> createEmailUserProfile(String name) async {
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

  Future<void> createGoogleUserProfile(
    String? name,
    String? imgUrls,
  ) async {
    await _fireUsersService.registerGoogleUserProfile(name, imgUrls);
  }

  final btnController = RoundedLoadingButtonController();
}
