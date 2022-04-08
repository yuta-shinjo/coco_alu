import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/album_detail_page_controller.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/components/src/universal.dart';

class AlbumDetailPageBody extends ConsumerWidget {
  const AlbumDetailPageBody({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _displayImage(context),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _tagPart(),
          ),
          const SizedBox(height: 15),
          _albumContent(ref),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Headline6Text('撮影スポット'),
              ),
              _tookPictureSpot(context),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _displayImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      child: UniversalImage(album.imgUrls, fit: BoxFit.cover),
    );
  }

  Widget _tagPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int i = 0; i < album.tags.length; i++) _tagChip(album, i),
        ],
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

  Widget _albumContent(WidgetRef ref) {
    final viewContent =
        ref.watch(albumDetailPageProvider.select((s) => s.viewContent));
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
                      ref.read(albumDetailPageProvider.notifier).viewContent(),
                  child: const Text(
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
                      ref.read(albumDetailPageProvider.notifier).viewContent(),
                  child: const Text('閉じる',
                      style: TextStyle(color: AppColors.textDisable)),
                ),
              ],
            ),
    );
  }

  Widget _tookPictureSpot(BuildContext context) {
    return SizedBox(
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
                    Subtitle2Text('この写真には位置情報が登録されていないようです'),
                  ],
                ),
              ),
            );
          }
        },
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
}
