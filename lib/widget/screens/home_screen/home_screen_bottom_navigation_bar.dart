import 'package:flutter/material.dart';
import 'package:my_collection/screens/home_screen/home_screen_model.dart';

class HomeScreenBottomNavigationBar extends StatelessWidget {
  HomeScreenBottomNavigationBar({required this.model});

  final HomeScreenModel model;

  @override
  Widget build(BuildContext context) {
    return _bottomNavigationBar(model);
  }

  Widget _bottomNavigationBar(HomeScreenModel model) {
    return BottomNavigationBar(
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
    );
  }
}
