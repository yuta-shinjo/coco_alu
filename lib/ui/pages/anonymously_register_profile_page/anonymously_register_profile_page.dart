import 'package:flutter/material.dart';
import 'package:my_collection/ui/pages/anonymously_register_profile_page/src/anonymously_register_profile_page_body.dart';
import 'package:my_collection/ui/pages/sign_up/login_page/login_page.dart';

class AnonymouslyRegisterProfilePage extends StatelessWidget {
  const AnonymouslyRegisterProfilePage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const AnonymouslyRegisterProfilePage(),
      settings: const RouteSettings(name: 'anonymously_register_profile_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィールを作成する'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pushReplacement(context, LoginPage.route());
          },
        ),
      ),
      body: const AnonymouslyRegisterProfilePageBody(),
    );
  }
}
