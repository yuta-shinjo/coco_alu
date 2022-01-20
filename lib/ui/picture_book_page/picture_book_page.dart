import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/picture_book_page_controller.dart';
import 'package:my_collection/ui/login_page/login_page.dart';
import 'package:my_collection/ui/picture_book_page/src/picture_book_page_body.dart';

class PictureBookPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("図鑑一覧"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              ref.read(pictureBookPageProvider.notifier).isSignOut();
              Navigator.of(context)
                  .pushReplacement<void, void>(LoginPage.fadeInRoute());
            },
          ),
        ],
      ),
      body: PictureBookPageBody(),
    );
  }
}
