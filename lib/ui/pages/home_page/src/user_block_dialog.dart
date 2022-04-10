import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/ui/pages/home_page/src/selectable_alert_dialog.dart';
import 'package:my_collection/utiles.dart';

class UserBlockDialog extends StatelessWidget {
  const UserBlockDialog({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return SelectableAlertDialogBody(
        title: 'このユーザーをブロックしますか？',
        action: 'ブロック',
        onAction: () async {
          try {
            await ref
                .read(homePageProvider.notifier)
                .block(blockUserId: album.createdUser);
            Navigator.pop(context);
            blockUserMassage();
          } catch (e) {
            print(e);
          }
        },
      );
    });
  }
}
