import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';

class PressedButton extends StatelessWidget {
  const PressedButton(
      {Key? key,
      this.onPressed,
      required this.text,
      required this.primaryColor})
      : super(key: key);

  final VoidCallback? onPressed;
  final ButtonText text;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}

class DisablePressedButton extends StatelessWidget {
  const DisablePressedButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  final VoidCallback? onPressed;
  final ButtonText text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonDisable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}
