import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/home_page/src/album_detail_page.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(homePageProvider.select((s) => s.albums)) ?? [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            _tagsList(),
            const Divider(color: AppColors.grey),
            _albumList(albums, context),
          ],
        ),
      ),
    );
  }

  Widget _tagsList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/travel.png'),
            ),
            Subtitle2Text('旅行'),
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/food.png'),
            ),
            Subtitle2Text('食べ物'),
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/family.png'),
            ),
            Subtitle2Text('家族'),
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
              ),
            ),
            Text(
              'More',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }

  Widget _albumList(List<Album> albums, BuildContext context) {
    if (albums.length == 0) {
      return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
          child: Text('登録画面からアルバムを作成しましょう！'),
        ),
      );
    }
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) {
        final album = albums[index];
        return GestureDetector(
          onTap: () => _goToDetail(context, album),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Ink.image(
              image: album.imgUrls != ''
                  ? NetworkImage(album.imgUrls)
                  : Image.network(
                      'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
                    ).image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  _goToDetail(BuildContext context, Album album) {
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
