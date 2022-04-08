import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/app_config.dart';
import 'package:my_collection/services/fire_configs_service.dart';
import 'package:my_collection/ui/pages/root_page/src/update_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'root_page_controller.freezed.dart';

@freezed
class RootPageState with _$RootPageState {
  const factory RootPageState({
    @Default(0) int tabIndex,
    @Default(false) bool needUpdate,
    @Default(AppConfig()) AppConfig appConfig,
  }) = _RootPageState;
}

final rootPageProvider =
    StateNotifierProvider.autoDispose<RootPageController, RootPageState>(
        (ref) => RootPageController());

class RootPageController extends StateNotifier<RootPageState> {
  RootPageController() : super(const RootPageState());

  final _fireConfigsService = FireConfigsService();

  Future<void> checkNeedUpdate(BuildContext context) async {
    final appConfig = await _fireConfigsService.fetchAppConfig();
    state = state.copyWith(appConfig: appConfig);
    final needUpdate = await isNeedUpdate();
    if (needUpdate) {
      showDialog(
          context: context,
          builder: (_) {
            return WillPopScope(
              child: const UpdateDialog(),
              onWillPop: () async => false,
            );
          });
    }
  }

  Future<bool> isNeedUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = packageInfo.buildNumber;
    bool isNeedUpdate = false;
    try {
      if (Platform.isIOS) {
        if (int.parse(buildNumber) < state.appConfig.minBuildNumberIos) {
          isNeedUpdate = true;
        }
      } else {
        if (int.parse(buildNumber) < state.appConfig.minBuildNumberAndroid) {
          isNeedUpdate = true;
        }
      }
    } catch (e) {
      print(e);
    }
    return isNeedUpdate;
  }

  void onTabTap(int index) => state = state.copyWith(tabIndex: index);
}
