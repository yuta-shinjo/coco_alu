import 'package:flutter/material.dart';
import 'package:my_collection/ui/add_creature_page/add_creature_page.dart';
import 'package:my_collection/ui/home_page/src/home_page_bottom_navigation_bar.dart';
import 'package:my_collection/ui/list_detail_page/list_detail_page.dart';
import 'package:my_collection/ui/list_page/list_page.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _pageList = [
    ListDetailPage(),
    ListPage(),
    AddCreaturePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
      create: (_) => HomePageModel(),
      child: Consumer<HomePageModel>(
        builder: (context, model, child) {
          return Scaffold(
            bottomNavigationBar: HomePageBottomNavigationBar(model: model),
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
