import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:my_collection/controllers/pages/profile_map_page_controller.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/album_detail_page/album_detail_page.dart';

class ProfileMapPageBody extends StatelessWidget {
  ProfileMapPageBody({
    Key? key,
    required this.mapController,
    required this.albums,
  }) : super(key: key);

  final Completer<GoogleMapController> mapController;
  final Location _location = Location();
  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    final exitAlbums = albums.where((album) => album.latitude != '').toList();
    return exitAlbums.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              UniversalImage('assets/images/lost.jpg'),
              SizedBox(height: 20),
              Subtitle2Text('位置情報が公開されている思い出が無いようです'),
              SizedBox(height: 40),
            ],
          )
        : FutureBuilder(
            future: _getCurrentPosition(),
            builder: (context, AsyncSnapshot<LatLng> snapshot) {
              if (snapshot.hasData) {
                return Consumer(
                  builder: (context, ref, _) {
                    final isViewAlbums = ref.watch(
                        profileMapPageProvider.select((s) => s.isViewAlbums));

                    final activeAlbumIndex = ref.watch(profileMapPageProvider
                        .select((s) => s.activeAlbumIndex));
                    // 画像を移動することでマーカーの照準を変更する
                    if (isViewAlbums == true) {
                      mapController.future
                          .then((GoogleMapController googleMap) {
                        final latitude = exitAlbums[activeAlbumIndex].latitude;
                        final longitude =
                            exitAlbums[activeAlbumIndex].longitude;
                        googleMap.animateCamera(
                          CameraUpdate.newLatLng(
                            LatLng(
                              double.parse(latitude.toString()),
                              double.parse(longitude.toString()),
                            ),
                          ),
                        );
                      });
                    }
                    final viewAlbums = ref.watch(
                        profileMapPageProvider.select((s) => s.isViewAlbums));

                    return Stack(
                      children: [
                        _mapPart(snapshot),
                        viewAlbums == true
                            ? _viewImageParts(exitAlbums)
                            : Container(),
                        exitAlbums.isNotEmpty
                            ? _toggleViewParts(viewAlbums)
                            : Container(),
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }

  // 位置情報を取得する
  Future<LatLng> _getCurrentPosition() async {
    // サービスと位置情報アクセスが有効かどうかを確認する
    if (!await _allowedLocating) {
      // 初期位置（東京駅）
      return Future.value(const LatLng(35.6812362, 139.7649361));
    }
    // 位置情報を取得する
    LocationData locationData = await _location.getLocation();
    return LatLng(locationData.latitude!, locationData.longitude!);
  }

  // 位置情報の取得が可能かどうか
  get _allowedLocating async {
    // デバイスの位置情報サービスが有効かどうか
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    // 位置情報アクセスを許可しているかどうか
    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Widget _mapPart(AsyncSnapshot<LatLng> snapshot) {
    return Consumer(builder: (context, ref, _) {
      return GoogleMap(
        markers: _markers(context, ref),
        initialCameraPosition: CameraPosition(
          target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
          zoom: 14,
        ),
        onMapCreated: (controller) => mapController.complete(controller),
        myLocationEnabled: true,
      );
    });
  }

  Set<Marker> _markers(BuildContext context, WidgetRef ref) {
    final markers = <Marker>{};

    for (var i = 0; i < albums.length; i++) {
      final album = albums[i];
      final lat = album.latitude;
      final lng = album.longitude;
      // 写真に位置情報が入っていない時があるため
      if (lat != '' && lng != '') {
        markers.add(_markerFromCheckIn(context, ref, i, album, lat!, lng!));
      }
    }
    return markers;
  }

  Marker _markerFromCheckIn(
    BuildContext context,
    WidgetRef ref,
    int index,
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

  Widget _viewImageParts(List<Album>? albums) {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(profileMapPageProvider.notifier).controller;
      final currentPage =
          ref.watch(profileMapPageProvider.select((s) => s.currentPage));
      final album = albums![currentPage];
      return Align(
        alignment: const Alignment(0, 0.92),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.8,
          width: MediaQuery.of(context).size.width / 1.5,
          child: PageView.builder(
            controller: controller,
            itemCount: _displayImg(context, ref).length,
            itemBuilder: (context, int currentIndex) {
              bool active = currentIndex == currentPage;
              return _createCardAnimate(
                context,
                _displayImg(context, ref)[currentIndex],
                active,
                album,
              );
            },
            onPageChanged: (page) {
              ref.read(profileMapPageProvider.notifier).selectedAlbum(page);
            },
          ),
        ),
      );
    });
  }

  // 地図にあるピンの画像を表示
  List<String> _displayImg(BuildContext context, WidgetRef ref) {
    final imgCard = <String>[];

    for (var i = 0; i < albums.length; i++) {
      final album = albums[i];
      final lat = album.latitude;
      final lng = album.longitude;
      // マップにマーカーがある写真のみを表示するため
      if (lat != '' && lng != '') {
        imgCard.add(album.imgUrls);
      }
    }
    return imgCard;
  }

  Widget _createCardAnimate(
      BuildContext context, String imagePath, bool active, Album album) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.8,
        width: MediaQuery.of(context).size.width / 1.5,
        child: GestureDetector(
          onTap: () => _goToDetail(context, album),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: UniversalImage(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _goToDetail(BuildContext context, Album album) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
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
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  Widget _toggleViewParts(bool viewAlbums) {
    return Consumer(builder: (context, ref, _) {
      return Positioned(
        right: MediaQuery.of(context).size.width / 40,
        bottom: MediaQuery.of(context).size.height / 7.5,
        child: viewAlbums == true
            ? FloatingActionButton(
                heroTag: 'profile_map1',
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.collections,
                  size: 30,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  ref.read(profileMapPageProvider.notifier).toggleViewAlbums();
                },
              )
            : FloatingActionButton(
                heroTag: 'profile_map2',
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.collections,
                  size: 30,
                  color: AppColors.mapButton,
                ),
                onPressed: () {
                  ref.read(profileMapPageProvider.notifier).toggleViewAlbums();
                  ref.read(profileMapPageProvider.notifier).initializedPage();
                },
              ),
      );
    });
  }
}
