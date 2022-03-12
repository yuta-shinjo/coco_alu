import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/my_list_page/src/my_list_page_body.dart';

class MyListPage extends ConsumerWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('Myアルバム一覧'),
      ),
      body: MyListPgeBody(),
    );
  }
}
