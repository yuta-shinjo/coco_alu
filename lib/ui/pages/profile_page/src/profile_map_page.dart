import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/profile_page/src/profile_map_body_page.dart';

class ProfileMapPage extends ConsumerStatefulWidget {
  ProfileMapPage({Key? key, required this.albums}) : super(key: key);

  final List<Album> albums;

  static Route<T> route<T>({required List<Album> albums}) {
    return MaterialPageRoute<T>(
      builder: (_) => ProfileMapPage(albums: albums),
      settings: const RouteSettings(name: 'profile_map_page'),
    );
  }

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<ProfileMapPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool dragFlg = false;

  final Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: AppBarText('思い出'), leading: CloseButton()),
      body: ProfileMapPageBody(
          mapController: mapController, albums: widget.albums),
    );
  }
}
