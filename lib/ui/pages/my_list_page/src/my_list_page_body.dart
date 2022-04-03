import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/my_list_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/album_detail_page/album_detail_page.dart';

class MyListPgeBody extends ConsumerWidget {
  const MyListPgeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(myListPageProvider.select((s) => s.albums)) ?? [];
    if (albums.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UniversalImage('assets/images/home_page.jpg', fit: BoxFit.cover),
          Text('思い出を記録して\n思い出を振り返りましょう!'),
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
          child: album.public
              ? onPublicCard(album)
              : album.imgUrls.isEmpty
                  ? UniversalImage(
                      'assets/images/photo.jpg',
                      fit: BoxFit.cover,
                    )
                  : UniversalImage(
                      album.imgUrls,
                      fit: BoxFit.cover,
                    ),
        ),
      ),
    );
  }

  Widget onPublicCard(Album album) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: album.imgUrls.isEmpty
              ? UniversalImage(
                  'assets/images/photo.jpg',
                  fit: BoxFit.cover,
                )
              : UniversalImage(
                  album.imgUrls,
                  fit: BoxFit.cover,
                ),
        ),
        Align(
          alignment: Alignment(0.95, -0.95),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.lightGrey,
            child: Icon(Icons.public, color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  void _goToDetail(BuildContext context, Album album) {
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: AlbumDetailPage(album: album),
              );
            },
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }
}
