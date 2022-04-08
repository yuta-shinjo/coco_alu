import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/pages/home_page/src/public_map_page_body.dart';

class PublicMapPage extends ConsumerStatefulWidget {
  const PublicMapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<PublicMapPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool dragFlg = false;

  final Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: PublicMapPageBody(mapController: mapController),
    );
  }
}
