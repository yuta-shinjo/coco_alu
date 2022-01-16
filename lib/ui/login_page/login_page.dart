import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/login_page/src/login_page_body.dart';
import 'package:my_collection/ui/projects/elevated_button.dart';
import 'package:my_collection/ui/register_page/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const LoginPage(),
      settings: const RouteSettings(name: 'login_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: const LoginPageBody(),
          bottomNavigationBar: _createAccount(context),
        ),
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(80),
          child: ButtonTheme(
            child: PressedButton(
              primaryColor: AppColors.subPrimary,
              text: const ButtonText('アカウントを作成する'),
              onPressed: () {
                Navigator.pushReplacement(context, RegisterPage.route());
              },
            ),
          ),
        ),
      ],
    );
  }
}
