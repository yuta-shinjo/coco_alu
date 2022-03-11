import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/ui/pages/home_page/src/album_detail_page.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(homePageProvider.select((s) => s.albums)) ?? [];
    if (albums.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/home_page.jpg', fit: BoxFit.cover),
          Text('アルバムを作成して\n思い出を振り返りましょう!'),
        ],
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: _albumList(albums, context),
      ),
    );
  }

  Widget _albumList(List<Album> albums, BuildContext context) {
    return GridView.builder(
      // 変な感じでスクロールされるのを防ぐため
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) {
        final album = albums[index];
        return _albumImage(context, album);
      },
    );
  }

  Widget _albumImage(BuildContext context, Album album) {
    return GestureDetector(
      onTap: () => _goToDetail(context, album),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Ink.image(
            image: album.imgUrls != ''
                ? Image.network(album.imgUrls).image
                : Image.asset('assets/images/photo.jpg').image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _goToDetail(BuildContext context, Album album) {
    final page = AlbumDetailPage(album: album);
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
