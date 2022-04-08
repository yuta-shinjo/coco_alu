import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/profile_page/src/profile_map_page.dart';
import 'package:my_collection/ui/pages/profile_page/src/profile_page_body.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  final User profile;

  static Route<T> route<T>({required User profile}) {
    return MaterialPageRoute<T>(
      builder: (_) => ProfilePage(profile: profile),
      settings: const RouteSettings(name: 'profile_page'),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(homePageProvider.select((s) => s.userAlbumList));
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        leading: const CloseButton(),
        backgroundColor: AppColors.barColor,
        title: const AppBarText('プロフィール'),
      ),
      body: ProfilePageBody(profile: profile, albums: albums),
      floatingActionButton: FloatingActionButton(
        heroTag: 'profile_page',
        tooltip: 'マップ',
        backgroundColor: AppColors.accentColor,
        onPressed: () =>
            Navigator.push(context, ProfileMapPage.route(albums: albums)),
        child: const Icon(Icons.map),
      ),
    );
  }
}
