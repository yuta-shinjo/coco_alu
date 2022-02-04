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
    final fechProfile = await _fireUsersService.fetchUserProfile();
    final profiles = [...fechProfile];
    state = state.copyWith(profiles: profiles);
  }

  final _fireUsersService = FireUsersService();

  final profileName = TextEditingController();

  Future<void> pickImage(XFile? image, String imageUrl) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
    state = state.copyWith(profileImageUrl: imageUrl);
  }

  void inputName(String name) => state = state.copyWith(name: name);

  void deleteImage(String imgUrl, File? imageFile) {
    if (state.imageFile != null) {
      state = state.copyWith(imageFile: null);
    }
    if (state.profiles?.firstWhere((imgUrl) => imgUrl == imgUrl).imgUrls !=
        '') {
      print(state.profiles?.firstWhere((imgUrl) => imgUrl == imgUrl).imgUrls);
    }
  }

  Future<void> updateProfile(
      File? imageFile, String imgUrls, String name) async {
    await _fireUsersService.update(
      state.imageFile,
      state.profiles!.first.imgUrls,
      state.name,
    );
  }

  final btnController = RoundedLoadingButtonController();

  Future<void> isSignOut() async {
    await _fireUsersService.signOut();
  }
}
