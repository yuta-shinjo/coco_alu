import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';

class ClosedButton extends StatelessWidget {
  const ClosedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColors.black,
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
