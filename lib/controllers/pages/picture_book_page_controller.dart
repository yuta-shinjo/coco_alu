import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/services/fire_creature_service.dart';
import 'package:my_collection/services/fire_users_service.dart';

part 'picture_book_page_controller.freezed.dart';

@freezed
class PictureBookPageState with _$PictureBookPageState {
  const factory PictureBookPageState({
    @Default(Creature()) Creature creature,
    List<Creature>? creatures,
  }) = _PictureBookPageState;
}

final pictureBookPageProvider = StateNotifierProvider.autoDispose<
    PictureBookPageController, PictureBookPageState>(
  (ref) => PictureBookPageController(),
);

class PictureBookPageController extends StateNotifier<PictureBookPageState> {
  PictureBookPageController() : super(const PictureBookPageState()) {
    _init();
  }

  PageController? controller;
  final _fireCreatureService = FireCreatureService();
  final _fireUsersService = FireUsersService();

  void _init() {
    _fireCreatureService.fetchCreatureList(
      onValueChanged: (creatures) {
        state = state.copyWith(creatures: creatures);
      },
    );
  }

  void initialized() {
    controller = PageController(viewportFraction: 0.6);
  }

  Future<void> isSignOut() async {
    await _fireUsersService.signOut();
  }
}
