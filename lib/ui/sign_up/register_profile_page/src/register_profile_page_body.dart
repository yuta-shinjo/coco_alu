import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/controllers/pages/register_profile_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utiles.dart';

class RegisterProfilePageBody extends StatelessWidget {
  const RegisterProfilePageBody({Key? key}) : super(key: key);

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
        final imageFile =
            ref.watch(registerProfilePageProvider.select((s) => s.imageFile));
        final profileImageUrl = ref.watch(
            registerProfilePageProvider.select((s) => s.profileImageUrl));
        return Stack(
          children: [
            CircleAvatar(
              radius: 120,
              backgroundColor: AppColors.circleBorder,
              child: CircleAvatar(
                radius: 118,
                backgroundImage: imageFile != null
                    ? Image.file(imageFile, fit: BoxFit.cover).image
                    : const NetworkImage(
                        //netのURLのため注意
                        'https://itojisan.xyz/wp-content/uploads/2016/09/acount-300x300.png',
                      ),
              ),
            ),
            RawMaterialButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                await ref
                    .read(registerProfilePageProvider.notifier)
                    .pickImage(image, profileImageUrl);
              },
              child: const SizedBox(
                width: 240,
                height: 240,
              ),
              shape: const CircleBorder(),
              elevation: 0,
            ),
          ],
        );
      },
    );
  }

  Widget _registerName() {
    return Consumer(builder: (context, ref, _) {
      final controller =
          ref.watch(registerProfilePageProvider.notifier).btnController;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          textInputAction: TextInputAction.done,
          onTap: () => controller.reset(),
          textAlign: TextAlign.center,
          onChanged: (text) {
            ref.read(registerProfilePageProvider.notifier).inputName(text);
            controller.reset();
          },
          controller:
              ref.read(registerProfilePageProvider.notifier).profileName,
          decoration: const InputDecoration(
            hintText: '名前を入力してください',
          ),
        ),
      );
    });
  }

  Widget _registerButton() {
    return Consumer(
      builder: (context, ref, _) {
        final name =
            ref.watch(registerProfilePageProvider.select((s) => s.name));
        final profileImageUrl = ref.watch(
            registerProfilePageProvider.select((s) => s.profileImageUrl));
        final imageFile =
            ref.watch(registerProfilePageProvider.select((s) => s.imageFile));
        final controller =
            ref.watch(registerProfilePageProvider.notifier).btnController;
        return LoadingButton(
          primaryColor: AppColors.primary,
          controller: controller,
          onPressed: () async {
            if (name != '') {
              loadingSuccess(controller);
              try {
                ref
                    .read(registerProfilePageProvider.notifier)
                    .createEmailUserProfile(name, profileImageUrl, imageFile);
                ref
                    .read(registerProfilePageProvider.notifier)
                    .profileName
                    .clear();
                Navigator.pushReplacement(context, RootPage.route());
                profileSuccessMassage;
              } catch (e) {
                errorMassage(controller, e);
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
