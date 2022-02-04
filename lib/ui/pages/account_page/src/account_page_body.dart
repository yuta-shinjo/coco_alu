import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/account_page/src/edit_profile_page.dart';
import 'package:my_collection/ui/sign_up/login_page/login_page.dart';
import 'package:my_collection/ui/pages/album_list_page/src/alert_dialog.dart';

class AccountPageBody extends ConsumerWidget {
  const AccountPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO riverpodに直す
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    final email = user.email;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            _profileDisplay(),
            const Divider(color: AppColors.grey),
            const SizedBox(height: 60),
            Column(
              children: [
                ListTile(
                  title: const Subtitle2Text('プロフィールを編集する'),
                  onTap: () async {
                    await Navigator.push(context, EditProfilePage.route());
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                  ),
                ),
                const Divider(color: AppColors.grey),
                ListTile(
                  title: const Subtitle2Text('メールアドレス'),
                  trailing: Subtitle1Text(email, color: AppColors.textDisable),
                ),
                const Divider(color: AppColors.grey),
                ListTile(
                  title: const Subtitle2Text('ログアウト'),
                  onTap: () async {
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return DisplayDialog(
                          title: "ログアウト",
                          content: "本当にログアウトしてもよろしいですか？",
                          onPressed: () {
                            Navigator.pop(context);
                            try {
                              ref
                                  .read(accountPageProvider.notifier)
                                  .isSignOut();
                              Navigator.pushReplacement(
                                  context, LoginPage.fadeInRoute());
                            } catch (e) {
                              print(e);
                            }
                          },
                        );
                      },
                    );
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                  ),
                ),
                const Divider(color: AppColors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileDisplay() {
    return Consumer(builder: (context, ref, _) {
      final album =
          ref.watch(albumListPageProvider.select((s) => s.albums)) ?? [];
      final profile = ref.watch(accountPageProvider.select((s) => s.profiles));
      if (profile == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  profile.firstWhere((imgUrl) => imgUrl == imgUrl).imgUrls != ''
                      ? NetworkImage(
                          profile
                              .firstWhere((imgUrl) => imgUrl == imgUrl)
                              .imgUrls,
                        )
                      : const NetworkImage(
                          //netのURLのため注意
                          'https://itojisan.xyz/wp-content/uploads/2016/09/acount-300x300.png',
                        ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    profile.firstWhere((name) => name == name).name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: OverlineText(
                    'アルバム数: ${album.length}',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
