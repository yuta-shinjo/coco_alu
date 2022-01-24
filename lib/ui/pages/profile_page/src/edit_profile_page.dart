import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/controllers/pages/profile_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/profile_page/src/simple_dialog.dart';
import 'package:my_collection/ui/projects/closed_button.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utiles.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const EditProfilePage(),
      settings: const RouteSettings(name: 'edit_profile_page'),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィールを編集'),
        leading: const ClosedButton(),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
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
    );
  }

  Widget _circleAvatar() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(profilePageProvider.select((s) => s.imageFile));
        return CircleAvatar(
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
        );
      },
    );
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
          ref.watch(profilePageProvider.select((s) => s.profileImageUrl));
      final imageFile =
          ref.watch(profilePageProvider.select((s) => s.imageFile));
      return SelectDialog(
        selectPicture: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          await ref
              .read(profilePageProvider.notifier)
              .pickImage(image, profileImageUrl);
          Navigator.pop(context);
        },
        deletePicture: () {
          ref
              .read(profilePageProvider.notifier)
              .deleteImage(profileImageUrl, imageFile);
          Navigator.pop(context);
        },
      );
    });
  }

  Widget _nameField() {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(profilePageProvider.notifier).btnController;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          textAlign: TextAlign.center,
          onChanged: (text) {
            ref.read(profilePageProvider.notifier).inputName(text);
            controller.reset();
          },
          controller: ref.read(profilePageProvider.notifier).profileName,
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
          ref.watch(profilePageProvider.select((s) => s.imageFile));
      final profileImageUrl =
          ref.watch(profilePageProvider.select((s) => s.profileImageUrl));
      final name = ref.watch(profilePageProvider.select((s) => s.name));
      final controller = ref.watch(profilePageProvider.notifier).btnController;
      return LoadingButton(
        primaryColor: AppColors.primary,
        controller: controller,
        onPressed: () async {
          if (name != '') {
            loadingSuccess(controller);
            //TODO 画像を設定していないと保存ができない
            try {
              await ref
                  .read(profilePageProvider.notifier)
                  .updateProfile(imageFile, profileImageUrl, name);
              editProfileSuccessMassage();
              ref.read(profilePageProvider.notifier).profileName.clear();
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
