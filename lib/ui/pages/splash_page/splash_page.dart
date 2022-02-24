import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';
import 'package:my_collection/ui/pages/sign_up/login_page/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context)
            .pushReplacement<void, void>(RootPage.fadeInRoute());
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.of(context)
            .pushReplacement<void, void>(LoginPage.fadeInRoute());
      });
    }
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          width: 257,
          height: 257,
          child: UniversalImage(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
