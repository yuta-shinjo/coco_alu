import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/login_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utiles.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _email(),
          _password(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _email() {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(loginPageProvider.notifier).btnController;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          onTap: () => controller.reset(),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: "メールアドレス"),
          onChanged: (String value) {
            ref.read(loginPageProvider.notifier).inputEmail(value);
            controller.reset();
          },
        ),
      );
    });
  }

  Widget _password() {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(loginPageProvider.notifier).btnController;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          onTap: () => controller.reset(),
          maxLengthEnforcement: MaxLengthEnforcement.none,
          decoration: const InputDecoration(labelText: "パスワード（8～20文字）"),
          obscureText: true,
          maxLength: 20,
          onChanged: (String value) {
            ref.read(loginPageProvider.notifier).inputPassword(value);
            controller.reset();
          },
        ),
      );
    });
  }

  Widget _loginButton() {
    return Consumer(builder: (context, ref, _) {
      final loginEmail =
          ref.watch(loginPageProvider.select((s) => s.loginEmail));
      final loginPassword =
          ref.watch(loginPageProvider.select((s) => s.loginPassword));
      final controller = ref.watch(loginPageProvider.notifier).btnController;
      return ButtonTheme(
        child: LoadingButton(
          primaryColor: AppColors.active,
          text: const ButtonText(
            'ログイン',
            color: AppColors.active,
          ),
          controller: controller,
          onPressed: () async {
            if (loginEmail != '' &&
                ref
                    .read(loginPageProvider.notifier)
                    .ablePassword(loginPassword)) {
              loadingSuccess(controller);
              try {
                await ref
                    .read(loginPageProvider.notifier)
                    .isLogin(loginEmail, loginPassword);
                Navigator.pushReplacement(context, RootPage.route());
                loginSuccessMassage();
              } catch (e) {
                errorMassage(controller, e);
              }
            } else if (loginEmail == '') {
              emailErrorMassage(controller);
            } else {
              passwordErrorMassage(controller);
            }
          },
        ),
      );
    });
  }
}
