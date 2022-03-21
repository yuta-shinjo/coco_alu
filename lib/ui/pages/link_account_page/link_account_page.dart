import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/pages/link_account_page/src/link_account_page_body.dart';

class LinkAccountPage extends StatelessWidget {
  const LinkAccountPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const LinkAccountPage(),
      settings: const RouteSettings(name: 'link_account_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          appBar: AppBar(
            backgroundColor: AppColors.barColor,
            title: const Text('メールアドレスをリンクする'),
          ),
          body: const LinkAccountPageBody(),
        ),
      ),
    );
  }
}
