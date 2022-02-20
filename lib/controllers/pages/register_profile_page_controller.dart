import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> pickImage(XFile? image, String imageUrl) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
    state = state.copyWith(profileImageUrl: imageUrl);
  }

  Future<void> createEmailUserProfile(
    String name,
    String imgUrls,
    File? imgFile,
  ) async {
    await _fireUsersService.registerEmailUserProfile(
      name,
      imgUrls,
      imgFile,
    );
  }
  
  Future<void> createGoogleUserProfile(
    String? name,
    String? imgUrls,
  ) async {
    await _fireUsersService.registerGoogleUserProfile(
      name,
      imgUrls,
    );
  }

  final btnController = RoundedLoadingButtonController();
}
