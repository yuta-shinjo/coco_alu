import 'package:flutter/material.dart';
import 'package:my_collection/add_creature/add_creature_screen.dart';
import 'package:my_collection/list_screen/list_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen_model.dart';

class HomePageScreen extends StatelessWidget {
  final List<Widget> _pageList = [
    ListScreen(),
    AddCreatureScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
      create: (_) => HomeScreenModel(),
      child: Consumer<HomeScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories),
                  label: '一覧',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.drive_file_rename_outline),
                  label: '登録',
                ),
              ],
              currentIndex: model.selectedIndex,
              onTap: model.onItemTaped,
            ),
            body: PageView(
              controller: model.pageController,
              onPageChanged: model.onPageChanged,
              children: _pageList,
            ),
          );
        },
      ),
    );
  }
}
