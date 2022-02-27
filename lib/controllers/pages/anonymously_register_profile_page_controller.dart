import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> pickImage(XFile? image, String imageUrl) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
    state = state.copyWith(profileImageUrl: imageUrl);
  }

// firebaseにそのユーザーのデータ欄を作成する
// 呼び出しているところの引数の順番も大切な気がした
//(例: profileImageUrl,name,imageFile だったらうまくいかなかった)
  Future<void> createAnonymouslyUserProfile(
    String name,
    String imgUrls,
    File? imgFile,
  ) async {
    await _fireUsersService.registerAnonymouslyUserProfile(
      name,
      imgUrls,
      imgFile,
    );
  }

  // Authenticationにuidを追加する
  Future<void> isRegister() async =>
      await _fireUsersService.anonymouslyRegisterUser();

  final btnController = RoundedLoadingButtonController();
}
