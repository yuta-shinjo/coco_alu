import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/account_page/src/simple_dialog.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utiles.dart';

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
                  _circleAvatar(),
                  _pressedButton(context),
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

  Widget _circleAvatar() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(accountPageProvider.select((s) => s.imageFile));
        final profile =
            ref.watch(accountPageProvider.select((s) => s.profiles));
        if (profile == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CircleAvatar(
          radius: 120,
          backgroundColor: AppColors.circleBorder,
          child: CircleAvatar(
            radius: 118,
            backgroundImage: displayImage(imageFile, profile),
          ),
        );
      },
    );
  }

  ImageProvider<Object>? displayImage(File? imgFile, List<User>? profile) {
    if (profile?.firstWhere((imgUrl) => imgUrl == imgUrl).imgUrls != '') {
      return NetworkImage(
          profile!.firstWhere((imgUrl) => imgUrl == imgUrl).imgUrls);
    } else if (imgFile != null) {
      Image.file(imgFile, fit: BoxFit.cover).image;
    } else {
      UniversalImage(
        //netのURLのため注意
        'https://itojisan.xyz/wp-content/uploads/2016/09/acount-300x300.png',
      );
    }
  }

  Widget _pressedButton(BuildContext context) {
    return RawMaterialButton(
      onPressed: () async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return _dialog();
          },
        );
      },
      child: const SizedBox(
        width: 240,
        height: 240,
      ),
      shape: const CircleBorder(),
      elevation: 0,
    );
  }

  Widget _dialog() {
    return Consumer(builder: (context, ref, _) {
      final profileImageUrl =
          ref.watch(accountPageProvider.select((s) => s.profileImageUrl));
      final imageFile =
          ref.watch(accountPageProvider.select((s) => s.imageFile));
      return SelectDialog(
        selectPicture: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          await ref
              .read(accountPageProvider.notifier)
              .pickImage(image, profileImageUrl);
          Navigator.pop(context);
        },
        deletePicture: () {
          // TODO deleteImageがうまくいっていない
          ref
              .read(accountPageProvider.notifier)
              .deleteImage(profileImageUrl, imageFile);
          Navigator.pop(context);
        },
      );
    });
  }

  Widget _nameField() {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(accountPageProvider.notifier).btnController;
      final profile =
            ref.watch(accountPageProvider.select((s) => s.profiles));
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          onTap: () => controller.reset(),
          initialValue: profile?.firstWhere((name) => name == name).name,
          textAlign: TextAlign.center,
          onChanged: (text) {
            ref.read(accountPageProvider.notifier).inputName(text);
            controller.reset();
          },
          decoration: const InputDecoration(
            hintText: '名前を入力してください',
          ),
        ),
      );
    });
  }

  Widget _registerButton() {
    return Consumer(builder: (context, ref, _) {
      final imageFile =
          ref.watch(accountPageProvider.select((s) => s.imageFile));
      final profileImageUrl =
          ref.watch(accountPageProvider.select((s) => s.profileImageUrl));
      final name = ref.watch(accountPageProvider.select((s) => s.name));
      final controller = ref.watch(accountPageProvider.notifier).btnController;
      return LoadingButton(
        primaryColor: AppColors.primary,
        controller: controller,
        onPressed: () async {
          if (name != '') {
            loadingSuccess(controller);
            //TODO 画像を設定していないと保存ができない
            try {
              await ref
                  .read(accountPageProvider.notifier)
                  .updateProfile(imageFile, profileImageUrl, name);
              editProfileSuccessMassage();
              ref.read(accountPageProvider.notifier).profileName.clear();
              Navigator.pop(context);
            } catch (e) {
              errorMassage(controller, e);
            }
          } else {
            nameErrorMassage(controller);
          }
        },
        text: const ButtonText('保存する'),
      );
    });
  }
}
