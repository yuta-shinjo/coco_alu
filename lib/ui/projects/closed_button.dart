import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/account_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';

class ClosedButton extends ConsumerWidget {
  const ClosedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      color: AppColors.black,
      icon: const Icon(Icons.close),
      onPressed: () {
        // TODO 削除できているかの確認
        ref.read(accountPageProvider.notifier).deleteImageFile();
        Navigator.pop(context);
      },
    );
  }
}
