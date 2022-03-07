import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:my_collection/controllers/pages/map_page_controller.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';

class MapPage extends ConsumerStatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool dragFlg = false;

  final Completer<GoogleMapController> _mapController = Completer();
  final Location _location = Location();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _getCurrentPosition(),
      builder: (context, AsyncSnapshot<LatLng> snapshot) {
        if (snapshot.hasData) {
          return Consumer(
            builder: (context, ref, _) {
              final isViewAlbums =
                  ref.watch(mapPageProvider.select((s) => s.isViewAlbums));
              final albums = ref.watch(mapPageProvider.select((s) => s.albums));
              // ピンが打たれているAlbumをListで抽出
              final exitAlbum =
                  albums?.where((album) => album.latitude != '').toList();
              final activeAlbumIndex =
                  ref.watch(mapPageProvider.select((s) => s.activeAlbumIndex));
              // 画像を移動することでマーカーの照準を変更する
              if (isViewAlbums == true) {
                _mapController.future.then((GoogleMapController googleMap) {
                  final latitude = exitAlbum?[activeAlbumIndex].latitude;
                  final longitude = exitAlbum?[activeAlbumIndex].longitude;
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
              final viewAlbums =
                  ref.watch(mapPageProvider.select((s) => s.isViewAlbums));
              return Stack(
                children: [
                  _mapPart(snapshot),
                  viewAlbums == true ? _viewImageParts() : Container(),
                  _toggleViewParts(viewAlbums),
                ],
              );
            },
          );
        } else {
          return Center(
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
      return Future.value(LatLng(35.6812362, 139.7649361));
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
        onMapCreated: (controller) => _mapController.complete(controller),
        myLocationEnabled: true,
      );
    });
  }

  Set<Marker> _markers(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(mapPageProvider.select((s) => s.albums)) ?? [];

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

  Widget _viewImageParts() {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(mapPageProvider.notifier).controller;
      final currentPage =
          ref.watch(mapPageProvider.select((s) => s.currentPage));
      final controllerInt = controller;
      print(controllerInt);
      return Align(
        alignment: Alignment(0, 0.92),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.8,
          width: MediaQuery.of(context).size.width / 1.5,
          child: PageView.builder(
            controller: controller,
            itemCount: _displayImg(context, ref).length,
            itemBuilder: (context, int currentIndex) {
              bool active = currentIndex == currentPage;
              return _createCardAnimate(
                _displayImg(context, ref)[currentIndex],
                active,
              );
            },
            onPageChanged: (page) {
              ref.read(mapPageProvider.notifier).selectedAlbum(page);
            },
          ),
        ),
      );
    });
  }

  // 地図にあるピンの画像を表示
  List<String> _displayImg(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(mapPageProvider.select((s) => s.albums)) ?? [];

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

  Widget _createCardAnimate(String imagePath, bool active) {
    final double side = active ? 0 : 40;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: side),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.8,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Ink.image(
              image: Image.network(imagePath).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _toggleViewParts(bool viewAlbums) {
    return Consumer(builder: (context, ref, _) {
      return Align(
        alignment: const Alignment(0.94, 0.8),
        child: viewAlbums == true
            ? FloatingActionButton(
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.collections,
                  size: 30,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  ref.read(mapPageProvider.notifier).toggleViewAlbums();
                },
              )
            : FloatingActionButton(
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.collections,
                  size: 30,
                  color: AppColors.mapButton,
                ),
                onPressed: () {
                  ref.read(mapPageProvider.notifier).toggleViewAlbums();
                  ref.read(mapPageProvider.notifier).initializedPage();
                },
              ),
      );
    });
  }
}
