import 'package:flutter/material.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
    required this.primaryColor,
    required this.text,
    required this.controller,
    this.onPressed,
  }) : super(key: key);

  final Color primaryColor;
  final ButtonText text;
  final RoundedLoadingButtonController controller;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      color: primaryColor,
      successIcon: Icons.check,
      failedIcon: Icons.close,
      child: text,
      controller: controller,
      onPressed: onPressed,
    );
  }
}
