import 'package:flutter/material.dart';
import 'package:my_collection/ui/home_page/home_page_model.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  HomePageBottomNavigationBar({required this.model});

  final HomePageModel model;

  @override
  Widget build(BuildContext context) {
    return _bottomNavigationBar(model);
  }

  Widget _bottomNavigationBar(HomePageModel model) {
    return BottomNavigationBar(
      items: [
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
      ],
      currentIndex: model.selectedIndex,
      onTap: model.onItemTaped,
    );
  }
}
