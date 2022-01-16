import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/root_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/add_creature_page/add_creature_page.dart';
import 'package:my_collection/ui/list_detail_page/list_detail_page.dart';
import 'package:my_collection/ui/list_page/list_page.dart';
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
    ListDetailPage(),
    ListPage(),
    AddCreaturePage(),
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
    return Consumer(builder: (context, ref, _) {
      return BottomNavigationBar(
        unselectedItemColor: AppColors.noActive,
        selectedItemColor: AppColors.white,
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        onTap: ref.read(rootPageProvider.notifier).onTabTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'MAP',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'データ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'プロフィール',
          ),
        ],
      );
    });
  }
}
