import 'package:flutter/material.dart';
import 'package:my_collection/ui/pages/account_page/src/edit_profile_page_body.dart';
import 'package:my_collection/ui/projects/closed_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const EditProfilePage(),
      settings: const RouteSettings(name: 'edit_profile_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('プロフィールを編集'),
            leading: const ClosedButton(),
          ),
          body: EditProfilePageBody(),
        ),
      ),
    );
  }
}
