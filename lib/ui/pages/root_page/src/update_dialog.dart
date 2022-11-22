import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: const Subtitle1Text('アプリのアップデートが必要です'),
      ),
      titlePadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actions: <Widget>[
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(bottom: 15, right: 15),
            child: RichText(
              text: const TextSpan(
                text: 'アップデート',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onTap: () {
            if (Platform.isIOS) {
              launchUrlString(
                  'https://apps.apple.com/jp/app/%E3%82%B3%E3%82%B3%E3%82%A2%E3%83%AB/id1611178182');
            } else {
              launchUrlString('storeAndroidUrl');
            }
          },
        ),
      ],
    );
  }
}
