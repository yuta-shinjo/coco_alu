import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/controllers/pages/map_page_controller.dart';
import 'package:my_collection/controllers/pages/my_list_page_controller.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/ui/pages/home_page/src/selectable_alert_dialog.dart';
import 'package:my_collection/utilities.dart';

class PublicDeleteDialog extends StatelessWidget {
  const PublicDeleteDialog({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return SelectableAlertDialogBody(
        title: '投稿を削除しますか？',
        action: '削除',
        onAction: () async {
          try {
            await ref.read(homePageProvider.notifier).deleteAlbum(album);
            await ref.read(homePageProvider.notifier).deleteStorage(album.id);
            deletePublicAlbumMassage();
            // finallyのところで記述するとエラーが出るためここに記述
            await ref.read(mapPageProvider.notifier).fetchAlbumList();
          } catch (e) {
            print(e);
          } finally {
            Navigator.pop(context);
            // albumを削除時にリストを更新するため
            await ref.read(albumListPageProvider.notifier).fetchAlbumList();
            await ref.read(myListPageProvider.notifier).fetchAlbumList();
          }
        },
      );
    });
  }
}
