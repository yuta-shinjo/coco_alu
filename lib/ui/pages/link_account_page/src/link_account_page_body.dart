import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/link_account_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';

import 'package:my_collection/utilities.dart';

class LinkAccountPageBody extends StatelessWidget {
  const LinkAccountPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'メールアドレスのリンク',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 100),
          _email(),
          _password(),
          const SizedBox(height: 30),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _email() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.watch(linkAccountPageProvider.notifier).btnController;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            onTap: () => controller.reset(),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: "メールアドレス"),
            onChanged: (String value) {
              ref.read(linkAccountPageProvider.notifier).inputEmail(value);
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
            ref.watch(linkAccountPageProvider.notifier).btnController;
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
              ref.read(linkAccountPageProvider.notifier).inputPassword(value);
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
            ref.watch(linkAccountPageProvider.select((s) => s.newEmail));
        final newPassword =
            ref.watch(linkAccountPageProvider.select((s) => s.newPassword));
        final controller =
            ref.watch(linkAccountPageProvider.notifier).btnController;
        return ButtonTheme(
          child: LoadingButton(
            primaryColor: AppColors.primary,
            text: const ButtonText('リンクさせる'),
            controller: controller,
            onPressed: () async {
              if (newEmail != '' &&
                  ref
                      .read(linkAccountPageProvider.notifier)
                      .ablePassword(newPassword)) {
                loadingSuccess(controller);
                try {
                  await ref
                      .read(linkAccountPageProvider.notifier)
                      .linkEmail(newEmail, newPassword);
                  // これがないとAccount Pageに戻った時に左上に戻るボタンが残る
                  Navigator.pop(context);
                  linkSuccessMassage();
                } catch (e) {
                  errorMassage(controller, e);
                } finally {
                  Navigator.pushReplacement(context, RootPage.route());
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
