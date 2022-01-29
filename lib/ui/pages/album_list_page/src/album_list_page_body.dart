import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/album_list_page/src/alert_dialog.dart';

class AlbumListPageBody extends ConsumerWidget {
  const AlbumListPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums =
        ref.watch(albumListPageProvider.select((s) => s.albums)) ?? [];

    return ListView.separated(
      itemCount: albums.length,
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.grey,
      ),
      itemBuilder: (context, index) {
        final album = albums[index];
        return Slidable(
          actionPane: SlidableBehindActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: '削除',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () async => await _showDialog(context, ref, album),
            ),
          ],
          actionExtentRatio: 1 / 5,
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  _albumImage(album, context),
                  _albumText(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showDialog(
      BuildContext context, WidgetRef ref, Album album) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DisplayDialog(
          title: "削除の確認",
          content: "削除してもよろしいですか？",
          onPressed: () async {
            try {
              ref.read(albumListPageProvider.notifier).deleteAlbum(album);
              ref.read(albumListPageProvider.notifier).deleteStorage(album.id);
              Navigator.pop(context);
            } catch (e) {
              print(e);
            }
          },
        );
      },
    );
  }

  Widget _albumImage(Album album, BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Ink.image(
          image: album.imgUrls != ''
              ? NetworkImage(album.imgUrls)
              : Image.network(
                  'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
                ).image,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 5,
        ),
      ),
    );
  }

  Widget _albumText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TODO 表示するものを決めたらそれを表示させる
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: const Subtitle1Text(
            '四国旅行',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: const Subtitle1Text(
            '楽しかった',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: const [
              OverlineText('楽しかった'),
              SizedBox(width: 10),
              OverlineText(
                '2022/01/31',
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
