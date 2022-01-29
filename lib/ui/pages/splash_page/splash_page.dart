import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';
import 'package:my_collection/ui/sign_up/login_page/login_page.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Center(
        child: Text('ログイン中'),
      ),
    );
  }
}
