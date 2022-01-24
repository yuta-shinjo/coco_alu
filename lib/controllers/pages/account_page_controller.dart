import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'account_page_controller.freezed.dart';

@freezed
class AccountPageState with _$AccountPageState {
  const factory AccountPageState({
    List<User>? profiles,
    @Default(User()) User user,
    @Default('') String name,
    @Default('') String profileImageUrl,
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

  final _fireUsersService = FireUsersService();

  Future<void> _init() async {
    // final fetchProfile = _fireUsersService.fetchUserProfile();
    // final profiles = [...fetchProfile];
    // state = state.copyWith(profiles: profiles);
  }

  final profileName = TextEditingController();

  Future<void> pickImage(XFile? image, String imageUrl) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
    state = state.copyWith(profileImageUrl: imageUrl);
  }

  void inputName(String name) => state = state.copyWith(name: name);

  void deleteImage(String profileImageUrl, File? imageFile) {
    if (state.profileImageUrl != '') {
      profileImageUrl = '';
    }
    if (state.imageFile != null) {
      state = state.copyWith(imageFile: null);
    }
  }

  Future<void> updateProfile(
      File? imageFile, String profileImageUrl, String name) async {
    await _fireUsersService.update(
      state.imageFile,
      state.profileImageUrl,
      state.name,
    );
  }

  final btnController = RoundedLoadingButtonController();

  Future<void> fetchAccount() async {
    await _fireUsersService.fetchAccount();
  }
}
