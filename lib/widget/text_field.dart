import 'package:flutter/material.dart';

class TextFieldArea extends StatelessWidget {
  TextFieldArea({
    required this.decoration,
    required this.onChanged,
    required this.controller,
    required this.textAlign,
    this.keyboardType,
    this.maxLines,
  });

  final InputDecoration decoration;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: decoration,
        onChanged: onChanged,
        controller: controller,
        textAlign: textAlign,
        maxLines: maxLines,
        keyboardType: keyboardType,
      ),
    );
  }
}
