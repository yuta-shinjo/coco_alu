import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/root_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/pages/account_page/account_page.dart';
import 'package:my_collection/ui/pages/album_list_page/album_list_page.dart';
import 'package:my_collection/ui/pages/home_page/home_page.dart';

import 'package:my_collection/ui/pages/map_page/map_page.dart';
import 'package:my_collection/ui/pages/my_list_page/my_list_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends ConsumerStatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const RootPage(),
      settings: const RouteSettings(name: 'root_page'),
    );
  }

  static Route<T> fadeInRoute<T>() {
    return PageTransition<T>(
      child: const RootPage(),
      type: PageTransitionType.fade,
      settings: const RouteSettings(name: 'root_page'),
    );
  }

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    ref.read(rootPageProvider.notifier).checkNeedUpdate(context);
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (!Navigator.canPop(context)) {
        ref.read(rootPageProvider.notifier).checkNeedUpdate(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(rootPageProvider.select((s) => s.tabIndex));

    final _tabs = [
      const HomePage(),
      const MyListPage(),
      const EditAlbumPage(),
      const MapPage(),
      const AccountPage(),
    ];

    return Scaffold(
      body: IndexedStack(children: _tabs, index: currentIndex),
      bottomNavigationBar: _bottomNavigation(context, currentIndex),
    );
  }

  Widget _bottomNavigation(BuildContext context, int currentIndex) {
    return Consumer(
      builder: (context, ref, _) {
        return BottomNavigationBar(
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.primary,
          backgroundColor: AppColors.barColor,
          type: BottomNavigationBarType.fixed,
          onTap: ref.read(rootPageProvider.notifier).onTabTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories),
              label: '一覧',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: '追加&編集',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: 'マップ',
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
