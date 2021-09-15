import 'package:flutter/material.dart';

class SelectDialog extends StatelessWidget {
  SelectDialog({
    required this.onPressedOption1,
    required this.onPressedOption2,
  });

  final VoidCallback onPressedOption1;
  final VoidCallback onPressedOption2;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('確認'),
      children: [
        SimpleDialogOption(
          onPressed: onPressedOption1,
          child: Text('カメラロールの写真を選択する'),
        ),
        SimpleDialogOption(
          onPressed: onPressedOption2,
          child: Text('現在の写真を削除する'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context),
          child: Text('キャンセル'),
        ),
      ],
    );
  }
}
