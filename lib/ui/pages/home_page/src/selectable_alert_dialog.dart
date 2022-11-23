import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';

class SelectableAlertDialogBody extends StatelessWidget {
  const SelectableAlertDialogBody({
    Key? key,
    required this.title,
    required this.action,
    required this.onAction,
  }) : super(key: key);
  final String title;
  final String action;
  final Function onAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        margin: const EdgeInsets.only(left: 24, top: 23, bottom: 36, right: 24),
        child: Subtitle1Text(title),
      ),
      titlePadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actions: [
        Builder(
          builder: (context) {
            return GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                margin: const EdgeInsets.only(right: 4, bottom: 8),
                child: TextButton(
                  onPressed: () => onAction(),
                  child: Text(
                    action,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          margin: const EdgeInsets.only(bottom: 8),
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'キャンセル',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
