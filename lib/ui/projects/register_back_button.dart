import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/login_page/login_page.dart';

class RegisterBackButton extends StatelessWidget {
  const RegisterBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColors.black,
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.pushReplacement(context, LoginPage.route());
      },
    );
  }
}
