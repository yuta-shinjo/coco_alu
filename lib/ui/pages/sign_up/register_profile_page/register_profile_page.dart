import 'package:flutter/material.dart';
import 'package:my_collection/ui/pages/sign_up/register_profile_page/src/register_profile_page_body.dart';

class RegisterProfilePage extends StatelessWidget {
  const RegisterProfilePage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const RegisterProfilePage(),
      settings: const RouteSettings(name: 'register_profile_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('プロフィールを作成する'),
      ),
      body: const RegisterProfilePageBody(),
    );
  }
}
