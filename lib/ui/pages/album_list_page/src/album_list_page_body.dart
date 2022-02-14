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
    if (albums.length == 0) {
      return Center(
        child: Text('登録画面からアルバムを作成しましょう!'),
      );
    }
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
              color: AppColors.red,
              icon: Icons.delete,
              onTap: () async => await _showDialog(context, ref, album),
            ),
          ],
          actionExtentRatio: 1 / 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _albumImage(album, context),
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _albumText(album),
                      _tags(album),
                    ],
                  ),
                ),
              ],
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
      height: 120,
      width: 120,
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

  Widget _albumText(Album album) {
    print(album.tags);
    return Container(
      padding: const EdgeInsets.only(left: 12),
      child: Subtitle2Text(
        album.content,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _tags(Album album) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < album.tags.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: OverlineText(album.tags[i], color: AppColors.white),
              ),
            ),
        ],
      ),
    );
  }
}
