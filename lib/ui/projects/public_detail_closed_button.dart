import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';

class PublicDetailClosedButton extends ConsumerWidget {
  const PublicDetailClosedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      color: AppColors.black,
      icon: const Icon(Icons.close),
      onPressed: () async {
        await ref.read(homePageProvider.notifier).fetchPublicAlbumList();
        Navigator.pop(context);
      },
    );
  }
}
