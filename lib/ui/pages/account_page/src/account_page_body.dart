import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/account_page/src/edit_profile_page.dart';
import 'package:my_collection/ui/pages/album_list_page/src/alert_dialog.dart';
import 'package:my_collection/ui/pages/link_account_page/link_account_page.dart';
import 'package:my_collection/ui/pages/sign_up/login_page/login_page.dart';

class AccountPageBody extends ConsumerWidget {
  const AccountPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    final email = currentUser.email;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            _profileDisplay(),
            const Divider(color: AppColors.grey),
            const SizedBox(height: 60),
            _settingAccount(context, email),
          ],
        ),
      ),
    );
  }

  Widget _profileDisplay() {
    return Consumer(
      builder: (context, ref, _) {
        final album =
            ref.watch(albumListPageProvider.select((s) => s.albums)) ?? [];
        final profile = ref.watch(accountPageProvider.select((s) => s.profile));
        final imgUrls = profile.imgUrls;
        final name = profile.name;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              imgUser(imgUrls),
              const SizedBox(width: 20),
              infoUser(context, name, album),
            ],
          ),
        );
      },
    );
  }

  Widget imgUser(String imgUrls) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        child: ClipOval(
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
      ),
    );
  }

  Widget infoUser(BuildContext context, String? name, List<Album> album) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          width: MediaQuery.of(context).size.width / 2.5,
          child: Text(
            name!,
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
    );
  }

  Widget editProfile(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return ListTile(
        title: const Subtitle2Text('プロフィールを編集'),
        onTap: () {
          ref.read(accountPageProvider.notifier).resetProfile();
          Navigator.push(context, EditProfilePage.route());
        },
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
      );
    });
  }

  Widget _settingAccount(BuildContext context, String? email) {
    return Column(
      children: [
        editProfile(context),
        const Divider(color: AppColors.grey),
        emailAdless(email, context),
        const Divider(color: AppColors.grey),
        ListTile(
          title: const Subtitle2Text('ログアウト'),
          onTap: () async {
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return displayDialog();
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
    );
  }

  ListTile emailAdless(String? email, BuildContext context) {
    return ListTile(
      title: const Subtitle2Text('メールアドレス'),
      trailing: email != null
          ? Subtitle1Text(email, color: AppColors.textDisable)
          : const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primary,
            ),
      onTap: email == null
          ? () async {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return linkDialog();
                },
              );
            }
          : null,
    );
  }

  Widget displayDialog() {
    return Consumer(
      builder: (context, ref, _) {
        return DisplayDialog(
          title: "ログアウト",
          content: "メールアドレスを登録していない場合、二度とアカウントを復帰できません。\n\n本当にログアウトしてもよろしいですか？",
          onPressed: () {
            Navigator.pop(context);
            try {
              ref.read(accountPageProvider.notifier).isSignOut();
              Navigator.pushReplacement(context, LoginPage.fadeInRoute());
            } catch (e) {
              print(e);
            }
          },
        );
      },
    );
  }

  Widget linkDialog() {
    return Consumer(
      builder: (context, ref, _) {
        return DisplayDialog(
          title: "アカウントリンク",
          content:
              "現在のアカウントにメールアドレスをリンクさせることで、機種変更時やログアウトした場合でも現在のアカウントを復帰させることができるようになります。\n\nメールアドレスをリンクさせますか？",
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, LinkAccountPage.route());
          },
        );
      },
    );
  }
}
