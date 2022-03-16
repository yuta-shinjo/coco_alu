import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/home_page/src/public_album_detail_page.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(homePageProvider.select((s) => s.albums)) ?? [];
    if (albums.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UniversalImage('assets/images/display.jpg', fit: BoxFit.cover),
          Text('アルバムを共有して\nみんなに思い出を紹介しましょう!'),
        ],
      );
    }
    return _albumList(albums, context);
  }

  Widget _albumList(List<Album> albums, BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () async {
          await ref.read(homePageProvider.notifier).fetchCreatedUserProfile(album.createdUser);
          final profile = ref.watch(homePageProvider.select((s) => s.profile));
          _goToDetail(context, album, profile);
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: album.imgUrls.isNotEmpty
                ? UniversalImage(
                    album.imgUrls,
                    fit: BoxFit.cover,
                  )
                : UniversalImage(
                    'assets/images/photo.jpg',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      );
    });
  }

  void _goToDetail(BuildContext context, Album album, User profile) {
    final page = PublicAlbumDetailPage(album: album, profile: profile);
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: page,
              );
            },
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }
}
