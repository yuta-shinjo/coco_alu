import 'package:flutter/material.dart';

class SelectDialog extends StatelessWidget {
  const SelectDialog({
    Key? key,
    required this.selectPicture,
    required this.deletePicture,
  }) : super(key: key);

  final VoidCallback selectPicture;
  final VoidCallback deletePicture;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('確認'),
      
      children: [
        SimpleDialogOption(
          onPressed: selectPicture,
          child: const Text('カメラロールの写真を選択する'),
        ),
        SimpleDialogOption(
          onPressed: deletePicture,
          child: const Text('現在の写真を削除する'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
      ],
    );
  }
}
