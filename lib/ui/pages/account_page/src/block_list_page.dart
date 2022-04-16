import 'package:flutter/material.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/projects/closed_button.dart';

class BlockListPage extends StatelessWidget {
  const BlockListPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const BlockListPage(),
      settings: const RouteSettings(name: 'block_list_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('ブロックリスト'),
        leading: const ClosedButton(),
      ),
    );
  }
}
