import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/profile_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/profile_page/src/edit_profile_page.dart';
import 'package:my_collection/ui/projects/elevated_button.dart';

class ProfilePageBody extends ConsumerWidget {
  const ProfilePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profilePageProvider.select((s) => s.profiles));
    try {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _profileImage(),
            const SizedBox(height: 5),
            BodyText1Text(profile!.firstWhere((name) => name == name).name),
            const SizedBox(height: 50),
            PressedButton(
              primaryColor: AppColors.primary,
              onPressed: () async {
                await Navigator.push(context, EditProfilePage.route());
              },
              text: const ButtonText('プロフィールを編集する'),
            ),
          ],
        ),
      );
    } catch (e) {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _profileImage() {
    return Consumer(
      builder: (context, ref, _) {
        final profile =
            ref.watch(profilePageProvider.select((s) => s.profiles));
        return Stack(
          children: [
            CircleAvatar(
              radius: 120,
              backgroundColor: AppColors.circleBorder,
              child: CircleAvatar(
                radius: 118,
                backgroundImage: profile![0].profileImageUrl != ''
                    ? NetworkImage(profile[0].profileImageUrl)
                    : const NetworkImage(
                        'https://itojisan.xyz/wp-content/uploads/2016/09/acount-300x300.png',
                      ),
              ),
            ),
            const SizedBox(
              width: 240,
              height: 240,
            ),
          ],
        );
      },
    );
  }
}
