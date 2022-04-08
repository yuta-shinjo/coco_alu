import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/add_album_page/add_album_page.dart';
import 'package:my_collection/ui/pages/album_list_page/src/album_list_page_body.dart';

class EditAlbumPage extends StatelessWidget {
  const EditAlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.barColor,
        title: const AppBarText('思い出一覧を編集'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'edit_album',
        onPressed: () => Navigator.push(context, AddAlbumPage.route()),
        backgroundColor: AppColors.accentColor,
        child: const Icon(Icons.add_photo_alternate, size: 30),
      ),
      body: const AlbumListPageBody(),
    );
  }
}
