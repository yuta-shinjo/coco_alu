import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:my_collection/services/fire_storage_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'account_page_controller.freezed.dart';

@freezed
class AccountPageState with _$AccountPageState {
  const factory AccountPageState({
    @Default(User()) User profile,
    @Default('') String name,
    @Default('') String profileImageUrl,
    @Default('') String email,
    File? imageFile,
  }) = _AccountPageState;
}

final accountPageProvider =
    StateNotifierProvider.autoDispose<AccountPageController, AccountPageState>(
        (ref) {
  return AccountPageController();
});

class AccountPageController extends StateNotifier<AccountPageState> {
  AccountPageController() : super(const AccountPageState()) {
    _init();
  }

  void _init() async {
    final profile = await _fireUsersService.fetchUserProfile();
    if (profile != null) state = state.copyWith(profile: profile);
  }

  void fixName() => state = state.copyWith(name: state.profile.name);

  // プロフィールを編集した時に時にリアルタイムに反映させるようにするため
  Future<void> fetchUserProfile() async {
    final profile = await _fireUsersService.fetchUserProfile();
    if (profile != null) {
      state = state.copyWith(profile: profile);
    }
  }

  // 編集ページで呼び出さないのは、変更ボタンを押さずにaccount_pageに戻った後、
  // 再度変更ボタンを押すと前回の内容が反映されてしまうためaccount_pageで実装した
  // 登録後に入力した内容を削除するため
  void resetProfile() {
    if (state.name != '') {
      state = state.copyWith(name: '');
    }
    if (state.imageFile != null) {
      state = state.copyWith(imageFile: null);
    }
  }

  final profileName = TextEditingController();

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

  void inputName(String name) => state = state.copyWith(name: name);

  final _fireUsersService = FireUsersService();

  Future<void> updateProfile(
      File? imageFile, String imgUrls, String name) async {
    await uploadImage();
    await _fireUsersService.updateProfile(
      state.imageFile,
      state.profileImageUrl,
      state.name,
    );
  }

  final _fireStorageService = FireStorageService();

  Future<void> uploadImage() async {
    final uploadUrl = await _fireStorageService.uploadProfileImage(
      croppedImageFile: state.imageFile,
    );
    EasyLoading.dismiss();
    if (uploadUrl == null) return;
    state = state.copyWith(profileImageUrl: uploadUrl);
  }

  final btnController = RoundedLoadingButtonController();

  Future<void> isSignOut() async {
    await _fireUsersService.signOut();
  }
}
