import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/themes/test_app_colors.dart';
import 'package:my_collection/ui/components/components.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountPageProvider.notifier).fetchAccount;
    final albumNum =
        ref.watch(albumListPageProvider.select((s) => s.albums)) ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('アカウント'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          account.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        child: OverlineText(
                          'アルバム数: ${albumNum.length}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.grey),
            const SizedBox(height: 60),
            Column(
              children: [
                ListTile(
                  title: const Subtitle2Text('プロフィールを編集する'),
                  onTap: () {},
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                  ),
                ),
                const Divider(color: AppColors.grey),
                ListTile(
                  title: const Subtitle2Text('メールアドレス'),
                  onTap: () {},
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                  ),
                ),
                const Divider(color: AppColors.grey),
                ListTile(
                  title: const Subtitle2Text('パスワード'),
                  onTap: () {},
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                  ),
                ),
                const Divider(color: AppColors.grey),
                ListTile(
                  title: const Subtitle2Text('ログアウト'),
                  onTap: () {},
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
}
