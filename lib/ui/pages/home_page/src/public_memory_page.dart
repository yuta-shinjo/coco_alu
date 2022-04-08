import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/pages/home_page/src/public_memory_page_body.dart';

class PublicMemoryPage extends ConsumerWidget {
  const PublicMemoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: PublicMemoryPageBody(),
    );
  }
}
