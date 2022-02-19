import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/register_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/ui/sign_up/register_profile_page/register_profile_page.dart';
import 'package:my_collection/utiles.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '新規アカウントの作成',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 100),
          _email(),
          _password(),
          SizedBox(height: 30),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _email() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(registerPageProvider.notifier).btnController;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            onTap: () => controller.reset(),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: "メールアドレス"),
            onChanged: (String value) {
              ref.read(registerPageProvider.notifier).inputEmail(value);
              controller.reset();
            },
          ),
        );
      },
    );
  }

  Widget _password() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(registerPageProvider.notifier).btnController;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            onTap: () => controller.reset(),
            maxLengthEnforcement: MaxLengthEnforcement.none,
            decoration: const InputDecoration(labelText: "パスワード（8～20文字）"),
            obscureText: true,
            maxLength: 20,
            onChanged: (value) {
              ref.read(registerPageProvider.notifier).inputPassword(value);
              controller.reset();
            },
          ),
        );
      },
    );
  }

  Widget _registerButton() {
    return Consumer(
      builder: (context, ref, _) {
        final newEmail =
            ref.watch(registerPageProvider.select((s) => s.newEmail));
        final newPassword =
            ref.watch(registerPageProvider.select((s) => s.newPassword));
        final controller =
            ref.watch(registerPageProvider.notifier).btnController;
        return ButtonTheme(
          child: LoadingButton(
            primaryColor: AppColors.primary,
            text: const ButtonText('登録'),
            controller: controller,
            onPressed: () async {
              if (newEmail != '' &&
                  ref
                      .read(registerPageProvider.notifier)
                      .ablePassword(newPassword)) {
                loadingSuccess(controller);
                try {
                  await ref
                      .read(registerPageProvider.notifier)
                      .isRegister(newEmail, newPassword);
                  Navigator.pushReplacement(
                      context, RegisterProfilePage.route());
                  registerSuccessMassage();
                } catch (e) {
                  errorMassage(controller, e);
                }
              } else if (newEmail == '') {
                emailErrorMassage(controller);
              } else {
                passwordErrorMassage(controller);
              }
            },
          ),
        );
      },
    );
  }
}
