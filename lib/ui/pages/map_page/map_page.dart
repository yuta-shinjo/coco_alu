import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

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
          return GoogleMap(
            markers: _markers,
            initialCameraPosition: CameraPosition(
                target:
                    LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                zoom: 14),
            onMapCreated: (controller) => _controller.complete(controller),
            myLocationEnabled: true,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("marker1"),
      position: LatLng(35.4456381, 137.0195095),
      infoWindow: InfoWindow(title: "美濃太田駅"),
    )
  };

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
