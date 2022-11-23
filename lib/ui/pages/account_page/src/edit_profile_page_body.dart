import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utilities.dart';

class EditProfilePageBody extends StatelessWidget {
  const EditProfilePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Focus(
        focusNode: FocusNode(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _userProfile(),
                  _effectButton(),
                ],
              ),
              const SizedBox(height: 40),
              _nameField(),
              const SizedBox(height: 30),
              _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userProfile() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(accountPageProvider.select((s) => s.imageFile));
        final imgUrls =
            ref.watch(accountPageProvider.select((s) => s.profile.imgUrls));
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grey,
              width: 2.0,
            ),
          ),
          child: _circleAvatar(imageFile, imgUrls),
        );
      },
    );
  }

  Widget _circleAvatar(File? imageFile, String imgUrls) {
    return CircleAvatar(
      radius: 120,
      backgroundColor: AppColors.lightGrey,
      child: imageFile != null
          ? ClipOval(
              child: Image.file(
                imageFile,
                width: 240,
                height: 240,
                fit: BoxFit.cover,
              ),
            )
          : ClipOval(
              child: imgUrls.isNotEmpty
                  ? UniversalImage(
                      imgUrls,
                      fit: BoxFit.cover,
                    )
                  : const UniversalImage(
                      'assets/images/avatar.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
    );
  }

  Widget _effectButton() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(accountPageProvider.notifier).btnController;
        return RawMaterialButton(
          onPressed: () async {
            await ref.read(accountPageProvider.notifier).pickImage();
            controller.reset();
          },
          child: const SizedBox(
            width: 243,
            height: 243,
          ),
          shape: const CircleBorder(),
          elevation: 0,
        );
      },
    );
  }

  Widget _nameField() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(accountPageProvider.notifier).btnController;
        final profile = ref.watch(accountPageProvider.select((s) => s.profile));
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onTap: () => controller.reset(),
            initialValue: profile.name,
            textAlign: TextAlign.center,
            onChanged: (text) {
              ref.read(accountPageProvider.notifier).inputName(text);
              controller.reset();
            },
            decoration: const InputDecoration(hintText: '名前を入力してください'),
          ),
        );
      },
    );
  }

  Widget _registerButton() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(accountPageProvider.select((s) => s.imageFile));
        final profileImageUrl =
            ref.watch(accountPageProvider.select((s) => s.profileImageUrl));
        final name = ref.watch(accountPageProvider.select((s) => s.name));
        final controller =
            ref.watch(accountPageProvider.notifier).btnController;
        return LoadingButton(
          primaryColor: AppColors.primary,
          controller: controller,
          onPressed: () async {
            if (name != '' || imageFile != null) {
              if (name == '') {
                ref.read(accountPageProvider.notifier).fixName();
              }
              loadingSuccess(controller);
              try {
                await ref
                    .read(accountPageProvider.notifier)
                    .updateProfile(imageFile, profileImageUrl, name);
                await ref.read(accountPageProvider.notifier).fetchUserProfile();
                editProfileSuccessMassage();
              } catch (e) {
                errorMassage(controller, e);
              } finally {
                Navigator.pop(context);
              }
            } else {
              profileEditErrorMassage(controller);
            }
          },
          text: const ButtonText('保存する'),
        );
      },
    );
  }
}
