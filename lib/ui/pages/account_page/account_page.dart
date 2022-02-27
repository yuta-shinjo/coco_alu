import 'package:flutter/material.dart';
import 'package:my_collection/ui/components/components.dart';
import 'src/account_page_body.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const AccountPage(),
      settings: const RouteSettings(name: 'account_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('アカウント'),
      ),
      body: AccountPageBody(),
    );
  }
}
