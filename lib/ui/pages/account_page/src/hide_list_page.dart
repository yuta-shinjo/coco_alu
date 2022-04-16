import 'package:flutter/material.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/projects/closed_button.dart';

class HideListPage extends StatelessWidget {
  const HideListPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const HideListPage(),
      settings: const RouteSettings(name: 'hide_list_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('非表示リスト'),
        leading: const ClosedButton(),
      ),
    );
  }
}
