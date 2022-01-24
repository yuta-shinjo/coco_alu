import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/edit_list_page_controller.dart';
import 'package:my_collection/ui/pages/album_list_page/src/edit_list_page_body.dart';

class EditListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final creatures =
            ref.watch(editListPageProvider.select((s) => s.creatures)) ?? [];

        if (creatures == []) {
          return Center(child: CircularProgressIndicator());

          //TODO 数秒後にメッセージに変換できるようにしたい
          // return Center(
          //   child: Subtitle1Text('登録画面から図鑑を登録しよう！'),
          // );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('図鑑に変更を加える'),
            centerTitle: true,
          ),
          body: EditListPageBody(),
        );
      },
    );
  }
}
