import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/controllers/pages/anonymously_register_profile_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/pages/introduction_page/introduction_page.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utilities.dart';

class AnonymouslyRegisterProfilePageBody extends StatelessWidget {
  const AnonymouslyRegisterProfilePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _profile(),
          const SizedBox(height: 40),
          _registerName(),
          const SizedBox(height: 30),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _profile() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile = ref
            .watch(anonymouslyRegisterPageProvider.select((s) => s.imageFile));
        final profileImageUrl = ref.watch(
            anonymouslyRegisterPageProvider.select((s) => s.profileImageUrl));
        return Stack(
          children: [
            _userProfile(imageFile),
            _effectButton(profileImageUrl),
          ],
        );
      },
    );
  }

  Widget _userProfile(File? imageFile) {
    return CircleAvatar(
      radius: 120,
      backgroundColor: AppColors.circleBorder,
      child: CircleAvatar(
        radius: 118,
        backgroundImage: imageFile != null
            ? Image.file(imageFile, fit: BoxFit.cover).image
            : const AssetImage('assets/images/avatar.jpg'),
      ),
    );
  }

  Widget _effectButton(String profileImageUrl) {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(anonymouslyRegisterPageProvider.notifier).btnController;
        return RawMaterialButton(
          onPressed: () async {
            await ref
                .read(anonymouslyRegisterPageProvider.notifier)
                .pickImage();
            controller.reset();
          },
          child: const SizedBox(
            width: 240,
            height: 240,
          ),
          shape: const CircleBorder(),
          elevation: 0,
        );
      },
    );
  }

  Widget _registerName() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(anonymouslyRegisterPageProvider.notifier).btnController;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            textInputAction: TextInputAction.done,
            onTap: () => controller.reset(),
            textAlign: TextAlign.center,
            onChanged: (text) {
              ref
                  .read(anonymouslyRegisterPageProvider.notifier)
                  .inputName(text);
              controller.reset();
            },
            controller:
                ref.read(anonymouslyRegisterPageProvider.notifier).profileName,
            decoration: const InputDecoration(hintText: '名前を入力してください'),
          ),
        );
      },
    );
  }

  Widget _registerButton() {
    return Consumer(
      builder: (context, ref, _) {
        final name =
            ref.watch(anonymouslyRegisterPageProvider.select((s) => s.name));
        final controller =
            ref.watch(anonymouslyRegisterPageProvider.notifier).btnController;
        return LoadingButton(
          primaryColor: AppColors.primary,
          controller: controller,
          onPressed: () async {
            if (name != '') {
              loadingSuccess(controller);
              try {
                await ref
                    .read(anonymouslyRegisterPageProvider.notifier)
                    .isRegister();
                await ref
                    .read(anonymouslyRegisterPageProvider.notifier)
                    .createAnonymouslyUserProfile(name);
                profileSuccessMassage();
              } catch (e) {
                errorMassage(controller, e);
              } finally {
                ref.read(accountPageProvider.notifier).fetchUserProfile();
                Navigator.pushReplacement(context, IntroductionPage.route());
              }
            } else {
              nameErrorMassage(controller);
            }
          },
          text: const ButtonText('作成する'),
        );
      },
    );
  }
}
