import 'package:flutter/material.dart';
import 'package:my_collection/ui/list_detail_page/src/list_detail_page_body.dart';

class ListDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("図鑑一覧"),
        centerTitle: true,
      ),
      body: ListDetailPageBody(),
    );
  }
}
