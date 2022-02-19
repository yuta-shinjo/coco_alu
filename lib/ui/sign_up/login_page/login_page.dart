import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/login_page_controller.dart';
import 'package:my_collection/controllers/pages/register_profile_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';
import 'package:my_collection/ui/projects/elevated_button.dart';
import 'package:my_collection/ui/sign_up/login_page/src/login_page_body.dart';
import 'package:my_collection/ui/sign_up/register_page/register_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const LoginPage(),
      settings: const RouteSettings(name: 'login_page'),
    );
  }

  static Route<T> fadeInRoute<T>() {
    return PageTransition<T>(
      child: LoginPage(),
      type: PageTransitionType.fade,
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
          bottomNavigationBar: _otherLosingMethod(),
        ),
      ),
    );
  }

  Widget _otherLosingMethod() {
    return Consumer(builder: (context, ref, _) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SignInButton(
            //   Buttons.Google,
            //   onPressed: () async {
            //     try {
            //       ref
            //           .read(loginPageProvider.notifier)
            //           .googleLogin()
            //           .then((value) {
            //         Navigator.pushReplacement(context, RootPage.route());
            //         // 初回ログインのみfirebaseにprofileを作成する
            //         if (value.additionalUserInfo?.isNewUser == true) {
            //           ref
            //               .read(registerProfilePageProvider.notifier)
            //               .createGoogleUserProfile(
            //                   value.user?.displayName, value.user?.photoURL);
            //         }
            //       });
            //     } on FirebaseAuthException catch (e) {
            //       print('${e.code}');
            //     } on Exception catch (e) {
            //       print('${e.toString()}');
            //     }
            //   },
            // ),
            // SizedBox(height: 8),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 60),
            //   child: SignInWithAppleButton(
            //     onPressed: () async {
            //       final credential = await SignInWithApple.getAppleIDCredential(
            //         scopes: [
            //           AppleIDAuthorizationScopes.email,
            //           AppleIDAuthorizationScopes.fullName,
            //         ],
            //       );
            //       print(credential);
            //     },
            //   ),
            // ),
            SizedBox(height: 8),
            ButtonTheme(
              child: PressedButton(
                primaryColor: AppColors.primary,
                text: const ButtonText('アカウントを作成する'),
                onPressed: () {
                  Navigator.pushReplacement(context, RegisterPage.route());
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
