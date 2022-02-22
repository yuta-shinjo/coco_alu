import 'package:flutter/material.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/album_list_page/src/album_list_page_body.dart';


class EditAlbumPage extends StatelessWidget {
  const EditAlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('アルバム編集'),
      ),
      body: AlbumListPageBody(),
    );
  }
}
