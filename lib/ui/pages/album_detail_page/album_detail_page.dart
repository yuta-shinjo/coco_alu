import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/pages/album_detail_page/src/album_detail_page_body.dart';
import 'package:my_collection/ui/projects/closed_button.dart';

class AlbumDetailPage extends ConsumerStatefulWidget {
  const AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  _TestAlbumDetailPageState createState() =>
      _TestAlbumDetailPageState(album: album);
}

class _TestAlbumDetailPageState extends ConsumerState<AlbumDetailPage>
    with AutomaticKeepAliveClientMixin {
  _TestAlbumDetailPageState({required this.album}) : super();

  @override
  bool get wantKeepAlive => true;
  bool dragFlg = false;
  final Album album;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.barColor,
        leading: const ClosedButton(),
      ),
      body: AlbumDetailPageBody(album: album),
    );
  }
}
