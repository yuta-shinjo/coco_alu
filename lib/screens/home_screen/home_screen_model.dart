import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
      selectedIndex = index;
      notifyListeners();
  }

  void onItemTaped(int index) {
      selectedIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 1),
        curve: Curves.easeIn,
      );
    notifyListeners();
  }

}