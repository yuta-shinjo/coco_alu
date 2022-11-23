import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/services/fire_public_service.dart';
import 'package:my_collection/services/fire_report_service.dart';
import 'package:my_collection/services/fire_storage_service.dart';
import 'package:my_collection/services/fire_users_service.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default('') String id,
    @Default('') String content,
    @Default('') String imgUrls,
    @Default(0) int currentPage,
    @Default(0) int activeAlbumIndex,
    @Default(false) bool viewContent,
    @Default(false) bool isViewAlbums,
    @Default(User()) User createdUserProfile,
    @Default(<Album>[]) List<Album> userAlbumList,
    @Default(<String>[]) List<String> blockList,
    @Default(<String>[]) List<String> hideAlbumList,
    List<Album>? albums,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
  (ref) => HomePageController(),
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController() : super(const HomePageState()) {
    _init();
  }

  final _fireUsersService = FireUsersService();
  final auth = firebase.FirebaseAuth.instance;
  final _firePublicService = FirePublicService();
  final PageController controller = PageController();

  void _init() async {
    fetchPublicAlbumList();

    // ページコントローラのページ遷移を監視しページ数を丸める
    controller.addListener(() {
      int next = controller.page!.round();
      if (state.currentPage != next) {
        state = state.copyWith(currentPage: next);
      }
    });
  }

  // 作成ページで作成ボタンを押したときにhomePageのリストを更新するため
  Future<void> fetchPublicAlbumList() async {
    final user = await _fireUsersService.fetchPrivateList();
    final blockUsers = user?.blockUsers;
    final hideAlbums = user?.hideAlbums;

    await _firePublicService.fetchPublicAlbumList(
      onValueChanged: (albums) {
        state = state.copyWith(albums: albums);
      },
      blockUsers: blockUsers,
      hideAlbums: hideAlbums,
    );
  }

  Future<void> fetchCreatedUserProfile(String createdUserId) async {
    final createdUserProfile =
        await _fireUsersService.fetchCreatedUserProfile(createdUserId);
    if (createdUserProfile != null) {
      state = state.copyWith(createdUserProfile: createdUserProfile);
    }
  }

  void viewContent() {
    state = state.copyWith(viewContent: !state.viewContent);
  }

  void fetchUserAlbumList(String userId) async {
    final userAlbumList =
        await _firePublicService.fetchUserAlbumList(userId: userId);
    state = state.copyWith(userAlbumList: userAlbumList);
  }

  void toggleViewAlbums() {
    state = state.copyWith(isViewAlbums: !state.isViewAlbums);
  }

  void initializedPage() {
    state = state.copyWith(currentPage: 0);
  }

  void selectedAlbum(int activeAlbumIndex) {
    state = state.copyWith(activeAlbumIndex: activeAlbumIndex);
  }

  Future<void> deleteAlbum(Album album) async {
    final albums = [...?state.albums];
    albums.remove(album);
    await _fireUsersService.deleteMyAlbum(album);
    if (album.public) await _firePublicService.deletePublicAlbum(album);

    state = state.copyWith(albums: albums);
  }

  final _fireStorageService = FireStorageService();

  Future<void> deleteStorage(String id) async =>
      await _fireStorageService.deleteStorage(id);

  final _fireReportService = FireReportsService();

  Future<void> report({
    required String message,
    required String targetAlbumId,
    required String targetAlbumContent,
    required String targetUserId,
  }) async {
    await _fireReportService.createReport(
      message: message,
      sendUserId: auth.currentUser!.uid,
      targetPostId: targetAlbumId,
      targetPostContent: targetAlbumContent,
      targetUserId: targetUserId,
    );
  }

  Future<void> block({required String blockUserId}) async {
    _fireUsersService.updateBlockUser(
      userId: auth.currentUser!.uid,
      blockUser: blockUserId,
    );
  }

  Future<void> hideAlbum({required String hideAlbumId}) async {
    _fireUsersService.updateHideAlbums(
      userId: auth.currentUser!.uid,
      hideAlbum: hideAlbumId,
    );
  }
}
