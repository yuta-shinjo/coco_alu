import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'creature_detail_page_controller.freezed.dart';

@freezed
class CreatureDetailPageState with _$CreatureDetailPageState {
  const factory CreatureDetailPageState({
    @Default('') String name,
    @Default('') String kinds,
    @Default('') String location,
    @Default('') String size,
    @Default('') String memo,
    @Default(false) bool isLoading,
    @Default('') String creatureImageUrl,
    File? imageFile,
  }) = _CreatureDetailPageState;
}

final creatureDetailPageProvider = StateNotifierProvider.autoDispose<
    CreatureDetailPageController, CreatureDetailPageState>(
      (ref) => CreatureDetailPageController(),
);

class CreatureDetailPageController extends StateNotifier<CreatureDetailPageState> {
  CreatureDetailPageController() : super(const CreatureDetailPageState());
}