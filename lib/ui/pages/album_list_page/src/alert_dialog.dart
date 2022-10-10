import 'package:flutter/material.dart';

class DisplayDialog extends StatelessWidget {
  const DisplayDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: const Text("はい"),
          onPressed: onPressed,
        ),
        TextButton(
          child: const Text("いいえ"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
