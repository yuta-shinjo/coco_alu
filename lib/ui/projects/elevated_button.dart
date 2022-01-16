import 'package:flutter/material.dart';
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
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}
