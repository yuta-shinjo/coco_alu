import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/home_page/src/public_album_delete_dialog.dart';
import 'package:my_collection/ui/pages/home_page/src/public_album_hide_dialog.dart';
import 'package:my_collection/ui/pages/home_page/src/public_album_report_dialog.dart';
import 'package:my_collection/ui/pages/home_page/src/user_block_dialog.dart';
import 'package:my_collection/ui/pages/profile_page/profile_page.dart';
import 'package:my_collection/ui/projects/public_detail_closed_button.dart';

class PublicAlbumDetailPage extends ConsumerStatefulWidget {
  const PublicAlbumDetailPage({
    Key? key,
    required this.album,
    required this.profile,
  }) : super(key: key);

  final Album album;
  final User profile;

  @override
  _TestAlbumDetailPageState createState() =>
      _TestAlbumDetailPageState(album: album, profile: profile);
}

class _TestAlbumDetailPageState extends ConsumerState<PublicAlbumDetailPage>
    with AutomaticKeepAliveClientMixin {
  _TestAlbumDetailPageState({required this.album, required this.profile})
      : super();

  @override
  bool get wantKeepAlive => true;
  bool dragFlg = false;
  final Album album;
  final User profile;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.barColor,
        leading: const PublicDetailClosedButton(),
      ),
      body: _albumDetailPageBody(context),
    );
  }

  Widget _albumDetailPageBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: _profileDisplay(profile),
          ),
          _displayImage(context),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  for (int i = 0; i < album.tags.length; i++)
                    _tagChip(album, i),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          _albumContent(ref),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Headline6Text('??????????????????'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                child: FutureBuilder(
                  future: _getAlbumPosition(album),
                  builder: (context, AsyncSnapshot<LatLng> snapshot) {
                    if (snapshot.hasData) {
                      return Consumer(
                        builder: (context, ref, _) {
                          return _mapPart(snapshot);
                        },
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: UniversalImage('assets/images/lost.jpg'),
                              ),
                              Subtitle2Text('?????????????????????????????????????????????????????????????????????'),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _profileDisplay(User profile) {
    return Consumer(builder: (context, ref, _) {
      final userId = ref.watch(homePageProvider.notifier).auth.currentUser!.uid;
      return Padding(
        padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
        child: Row(
          children: [
            imgUser(profile.imgUrls, album.createdUser),
            infoUser(context, profile.name),
            const Spacer(),
            PopupMenuButton(
              color: AppColors.scaffoldColor,
              icon: const Icon(Icons.more_horiz, color: AppColors.iconBlack),
              itemBuilder: album.createdUser == userId
                  ? (context) => [
                        PopupMenuItem(
                          value: '??????',
                          child: Row(
                            children: const [
                              Subtitle2Text('???????????????'),
                              Spacer(),
                              Icon(Icons.delete, color: AppColors.red),
                            ],
                          ),
                        ),
                      ]
                  : (context) => [
                        PopupMenuItem(
                          value: '??????',
                          child: Row(
                            children: const [
                              Subtitle2Text('???????????????????????????'),
                              Spacer(),
                              Icon(Icons.announcement, color: AppColors.red),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: '?????????',
                          child: Row(
                            children: const [
                              Subtitle2Text('?????????????????????????????????'),
                              Spacer(),
                              Icon(Icons.visibility_off,
                                  color: AppColors.iconBlack),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: '????????????',
                          child: Row(
                            children: const [
                              Subtitle2Text('??????????????????'),
                              Spacer(),
                              Icon(Icons.person_off,
                                  color: AppColors.iconBlack),
                            ],
                          ),
                        ),
                      ],
              onSelected: (value) async {
                await showDialog<String>(
                    context: context,
                    builder: (_) {
                      if (value.toString() == '??????') {
                        return PublicDeleteDialog(album: album);
                      } else if (value.toString() == '??????') {
                        return PublicAlbumReportDialog(album: album);
                      } else if (value.toString() == '?????????') {
                        return PublicAlbumHideDialog(album: album);
                      } else {
                        return UserBlockDialog(album: album);
                      }
                    });
              },
            ),
          ],
        ),
      );
    });
  }

  Widget imgUser(String imgUrls, String createdUserId) {
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, ProfilePage.route(profile: profile));
          ref.read(homePageProvider.notifier).fetchUserAlbumList(createdUserId);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grey,
              width: 1,
            ),
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.lightGrey,
            backgroundImage: imgUrls.isEmpty
                ? Image.asset(
                    'assets/images/avatar.jpg',
                  ).image
                : Image.network(imgUrls).image,
          ),
        ),
      );
    });
  }

  Widget infoUser(BuildContext context, String? name) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width / 2.5,
      child: Subtitle2Text(name!, overflow: TextOverflow.ellipsis),
    );
  }

  Widget _displayImage(
    BuildContext context,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      child: UniversalImage(album.imgUrls, fit: BoxFit.cover),
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

  Widget _albumContent(WidgetRef ref) {
    final viewContent =
        ref.watch(homePageProvider.select((s) => s.viewContent));
    if (album.content.isNotEmpty && album.content.length < 4) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Subtitle2Text(album.content),
      );
    } else if (album.content.isEmpty) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: viewContent == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Subtitle2Text(album.content.substring(0, 4) + '...'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () =>
                      ref.read(homePageProvider.notifier).viewContent(),
                  child: const Text(
                    '???????????????',
                    style: TextStyle(color: AppColors.textDisable),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Subtitle2Text(album.content),
                GestureDetector(
                  onTap: () =>
                      ref.read(homePageProvider.notifier).viewContent(),
                  child: const Text(
                    '?????????',
                    style: TextStyle(color: AppColors.textDisable),
                  ),
                ),
              ],
            ),
    );
  }

  // ????????????????????????????????????
  Future<LatLng> _getAlbumPosition(Album album) async {
    final lat = album.latitude;
    final lng = album.longitude;
    return Future.value(
      LatLng(
        double.parse(lat.toString()),
        double.parse(lng.toString()),
      ),
    );
  }

  Widget _mapPart(AsyncSnapshot<LatLng> snapshot) {
    return GoogleMap(
      markers: _markers(album),
      initialCameraPosition: CameraPosition(
        target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
        zoom: 14.5,
      ),
      myLocationEnabled: true,
    );
  }

  Set<Marker> _markers(Album album) {
    final marker = <Marker>{};
    final lat = album.latitude;
    final lng = album.longitude;
    // ????????????????????????????????????????????????????????????
    if (lat != '' && lng != '') {
      marker.add(_markerFromCheckIn(album, lat!, lng!));
    }
    return marker;
  }

  Marker _markerFromCheckIn(
    Album album,
    String lat,
    String lng,
  ) {
    final id = MarkerId(album.id);
    return Marker(
      infoWindow: InfoWindow(title: album.content),
      markerId: id,
      position: LatLng(double.parse(lat), double.parse(lng)),
    );
  }
}
