import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/root_page_controller.dart';
import 'package:my_collection/themes/test_app_colors.dart';
import 'package:my_collection/ui/pages/account_page/account_page.dart';
import 'package:my_collection/ui/pages/add_album_page/add_album_page.dart';
import 'package:my_collection/ui/pages/album_list_page/album_list_page.dart';

import 'package:my_collection/ui/pages/home_page/home_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends ConsumerWidget {
  RootPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => RootPage(),
      settings: const RouteSettings(name: 'root_page'),
    );
  }

  static Route<T> fadeInRoute<T>() {
    return PageTransition<T>(
      child: RootPage(),
      type: PageTransitionType.fade,
      settings: const RouteSettings(name: 'root_page'),
    );
  }

  final _tabs = [
    HomePage(),
    EditAlbumPage(),
    AddAlbumPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(rootPageProvider.select((s) => s.tabIndex));
    return Scaffold(
      body: _tabs[currentIndex],
      bottomNavigationBar: _bottomNavigation(context, currentIndex),
    );
  }

  Widget _bottomNavigation(BuildContext context, int currentIndex) {
    return Consumer(
      builder: (context, ref, _) {
        return BottomNavigationBar(
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.primary,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          onTap: ref.read(rootPageProvider.notifier).onTabTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories),
              label: '一覧',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: '編集',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.drive_file_rename_outline),
              label: '登録',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'アカウント',
            ),
          ],
        );
      },
    );
  }
}
