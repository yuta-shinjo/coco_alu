import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:my_collection/controllers/pages/map_page_controller.dart';
import 'package:my_collection/models/src/album.dart';

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
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _getCurrentPosition(),
      builder: (context, AsyncSnapshot<LatLng> snapshot) {
        if (snapshot.hasData) {
          return Consumer(builder: (context, ref, _) {
            return GoogleMap(
              markers: _markers(context, ref),
              initialCameraPosition: CameraPosition(
                  target:
                      LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                  zoom: 14),
              onMapCreated: (controller) => _controller.complete(controller),
              myLocationEnabled: true,
            );
          });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
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

  final Location _location = Location();

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
}
