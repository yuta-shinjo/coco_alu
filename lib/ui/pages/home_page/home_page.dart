import 'package:flutter/material.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/home_page/src/album_detail_page.dart';
import 'package:my_collection/ui/pages/home_page/src/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('アルバム一覧'),
      ),
      body: HomePageBody(),
    );
  }
}
