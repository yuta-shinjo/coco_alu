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

  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: CloseButton(),
      ),
      body: _albumDetailPageBody(context),
    );
  }

  Widget _albumDetailPageBody(BuildContext context) {
    final Completer<GoogleMapController> _mapController = Completer();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Headline6Text('撮影スポット'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                child: FutureBuilder(
                  future: _getAlbumPosition(album),
                  builder: (context, AsyncSnapshot<LatLng> snapshot) {
                    if (snapshot.hasData) {
                      return Consumer(
                        builder: (context, ref, _) {
                          return _mapPart(snapshot, _mapController);
                        },
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: UniversalImage('assets/images/lost.jpg'),
                              ),
                              Subtitle2Text('この写真には位置情報が登録されていないようです'),
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
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _profileDisplay(User profile) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
      child: Row(
        children: [
          imgUser(profile.imgUrls),
          infoUser(context, profile.name),
        ],
      ),
    );
  }

  Widget imgUser(String imgUrls) {
    return Container(
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
        child: ClipOval(
          child: imgUrls.isNotEmpty
              ? UniversalImage(
                  imgUrls,
                  fit: BoxFit.cover,
                )
              : const UniversalImage(
                  'assets/images/avatar.jpg',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget infoUser(BuildContext context, String? name) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width / 2.5,
      child: Subtitle2Text(
        name!,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _albumContent(WidgetRef ref) {
    final viewContent = ref.watch(homePageProvider).viewContent;
    if (album.content.length > 0 && album.content.length < 4) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Subtitle2Text(album.content),
      );
    } else if (album.content.length == 0) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: viewContent == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Subtitle2Text(album.content.substring(0, 4) + '...'),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () =>
                      ref.read(homePageProvider.notifier).viewContent(),
                  child: Text(
                    '続きを読む',
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
                  child: Text(
                    '閉じる',
                    style: TextStyle(color: AppColors.textDisable),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _displayImage(
    BuildContext context,
  ) {
    return Hero(
      tag: "image_${album.content}",
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        child: UniversalImage(album.imgUrls, fit: BoxFit.cover),
      ),
    );
  }

  // 写真の位置情報を取得する
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

  Widget _mapPart(
    AsyncSnapshot<LatLng> snapshot,
    Completer<GoogleMapController> _mapController,
  ) {
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
    // 写真に位置情報が入っていない時があるため
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
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
