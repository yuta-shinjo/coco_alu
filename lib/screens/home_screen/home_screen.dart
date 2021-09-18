import 'package:flutter/material.dart';
import 'package:my_collection/screens/add_creature_screen/add_creature_screen.dart';
import 'package:my_collection/screens/list_screen/list_screen.dart';
import 'package:my_collection/widget/screens/home_screen/home_screen_bottom_navigation_bar.dart';
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
            bottomNavigationBar: HomeScreenBottomNavigationBar(model: model),
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
