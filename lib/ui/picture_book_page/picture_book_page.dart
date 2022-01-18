import 'package:flutter/material.dart';
import 'package:my_collection/ui/picture_book_page/src/picture_book_page_body.dart';

class PictureBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("図鑑一覧"),
        centerTitle: true,
      ),
      body: PictureBookPageBody(),
    );
  }
}
