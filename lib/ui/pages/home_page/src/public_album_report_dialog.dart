import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/ui/pages/home_page/src/selectable_alert_dialog.dart';
import 'package:my_collection/utiles.dart';

class PublicAlbumReportDialog extends StatelessWidget {
  const PublicAlbumReportDialog({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return SelectableAlertDialogBody(
          title: 'この投稿を報告しますか？',
          action: '報告',
          onAction: () async {
            try {
              await ref.read(homePageProvider.notifier).report(
                    message: '',
                    targetAlbumId: album.id,
                    targetAlbumContent: album.content,
                    targetUserId: album.createdUser,
                  );
              Navigator.pop(context);
              reportMassage();
            } catch (e) {
              print(e);
            }
          },
        );
      },
    );
  }
}
