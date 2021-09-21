import 'package:flutter/material.dart';
import 'package:my_collection/widget/screens/list_detail_screen/list_detail_screen_body.dart';

class ListDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("図鑑一覧"),
        centerTitle: true,
      ),
      body: ListDetailScreenBody(),
    );
  }
}
