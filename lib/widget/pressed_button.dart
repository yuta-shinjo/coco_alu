import 'package:flutter/material.dart';

class PressedButton extends StatelessWidget {
  PressedButton({required this.onPressed,});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      elevation: 0,
      child: const SizedBox(
        width: 160,
        height: 160,
      ),
    );
  }
}
