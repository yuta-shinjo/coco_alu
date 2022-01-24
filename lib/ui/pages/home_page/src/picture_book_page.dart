import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/picture_book_page_controller.dart';
import 'package:my_collection/ui/pages/home_page/src/picture_book_page_body.dart';

import 'package:my_collection/ui/sign_up/login_page/login_page.dart';

class PictureBookPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("図鑑一覧"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
          ),
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
