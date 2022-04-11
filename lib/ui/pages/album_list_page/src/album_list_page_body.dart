import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/controllers/pages/map_page_controller.dart';
import 'package:my_collection/controllers/pages/my_list_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/album_list_page/src/alert_dialog.dart';
import 'package:my_collection/utiles.dart';

class AlbumListPageBody extends ConsumerWidget {
  const AlbumListPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums =
        ref.watch(albumListPageProvider.select((s) => s.albums)) ?? [];
    if (albums.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          UniversalImage('assets/images/edit_album.jpg'),
          SizedBox(height: 15),
          Subtitle1Text('編集する思い出がありません。'),
          Subtitle1Text('作成画面から思い出を作成しましょう!'),
        ],
      );
    }
    return ListView.separated(
      itemCount: albums.length,
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2.7),
        child: const Divider(
          color: AppColors.grey,
        ),
      ),
      itemBuilder: (context, index) {
        final album = albums[index];
        return Slidable(
          actionPane: const SlidableBehindActionPane(),
          secondaryActions: [
            _removeAlbum(context, ref, album, index),
          ],
          actionExtentRatio: 1 / 5,
          child: _detailAlbum(album, context),
        );
      },
    );
  }

  Widget _removeAlbum(
      BuildContext context, WidgetRef ref, Album album, int index) {
    return IconSlideAction(
      caption: '削除',
      color: AppColors.red,
      icon: Icons.delete,
      onTap: () async => await _showDialog(context, ref, album, index),
    );
  }

  Widget _detailAlbum(Album album, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          _albumImage(album, context),
          SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                album.public
                    ? Stack(
                        children: [
                          _albumText(album),
                          const Align(
                            alignment: Alignment(1.5, 0),
                            child: Icon(Icons.public, color: AppColors.primary),
                          ),
                        ],
                      )
                    : _albumText(album),
                _tagArea(album),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showDialog(
      BuildContext context, WidgetRef ref, Album album, int i) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DisplayDialog(
          title: "削除の確認",
          content: "削除してもよろしいですか？",
          onPressed: () async {
            try {
              await ref
                  .read(albumListPageProvider.notifier)
                  .deleteAlbum(album, i);
              await ref
                  .read(albumListPageProvider.notifier)
                  .deleteStorage(album.id);
              Navigator.pop(context);
              deleteAlbumMassage();
            } catch (e) {
              print(e);
            } finally {
              // albumを削除時にhomePageのリストを更新するため
              await ref.read(myListPageProvider.notifier).fetchAlbumList();
              await ref.read(homePageProvider.notifier).fetchPublicAlbumList();
              await ref.read(mapPageProvider.notifier).fetchAlbumList();
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
        child: album.imgUrls.isNotEmpty
            ? UniversalImage(
                album.imgUrls,
                fit: BoxFit.cover,
              )
            : const UniversalImage(
                'assets/images/photo.jpg',
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _albumText(Album album) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Subtitle2Text(
        album.content,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _tagArea(Album album) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            for (int i = 0; i < album.tags.length; i++) _tagChip(album, i),
          ],
        ),
      ),
    );
  }

  Widget _tagChip(Album album, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          album.tags[i],
          style: const TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
