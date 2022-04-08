import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/home_page/src/public_album_detail_page.dart';

class PublicMemoryPageBody extends ConsumerWidget {
  const PublicMemoryPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(homePageProvider.select((s) => s.albums)) ?? [];
    if (albums.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          UniversalImage('assets/images/display.jpg', fit: BoxFit.cover),
          Text('思い出を共有して\nみんなに思い出を紹介しましょう!'),
        ],
      );
    }
    return _albumList(albums, context);
  }

  Widget _albumList(List<Album> albums, BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) {
        final album = albums[index];
        return _albumImage(album);
      },
    );
  }

  Widget _albumImage(Album album) {
    return Consumer(
      builder: (context, ref, _) {
        return GestureDetector(
          onTap: () async {
            await ref
                .read(homePageProvider.notifier)
                .fetchCreatedUserProfile(album.createdUser);
            final createdUserProfile =
                ref.watch(homePageProvider.select((s) => s.createdUserProfile));
            _goToDetail(context, album, createdUserProfile);
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: album.latitude!.isEmpty
                  ? SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: album.imgUrls.isEmpty
                          ? const UniversalImage(
                              'assets/images/photo.jpg',
                              fit: BoxFit.cover,
                            )
                          : UniversalImage(
                              album.imgUrls,
                              fit: BoxFit.cover,
                            ),
                    )
                  : onLocationCard(album),
            ),
          ),
        );
      },
    );
  }

  Widget onLocationCard(Album album) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: album.imgUrls.isEmpty
              ? const UniversalImage(
                  'assets/images/photo.jpg',
                  fit: BoxFit.cover,
                )
              : UniversalImage(
                  album.imgUrls,
                  fit: BoxFit.cover,
                ),
        ),
        const Align(
          alignment: Alignment(0.95, -0.95),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.lightGrey,
            child: Icon(
              Icons.location_on,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  void _goToDetail(BuildContext context, Album album, User profile) {
    Navigator.push(
      context,
      PageRouteBuilder<void>(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: PublicAlbumDetailPage(
                  album: album,
                  profile: profile,
                ),
              );
            },
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
