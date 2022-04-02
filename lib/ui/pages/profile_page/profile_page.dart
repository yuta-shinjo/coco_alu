import 'package:flutter/material.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/profile_page/src/profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key, required this.profile}) : super(key: key);

  User profile;

  static Route<T> route<T>({required User profile}) {
    return MaterialPageRoute<T>(
      builder: (_) => ProfilePage(profile: profile),
      settings: const RouteSettings(name: 'profile_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.barColor,
        title: const AppBarText('プロフィール'),
      ),
      body: ProfilePageBody(profile: profile),
    );
  }
}
