import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_collection/models/src/user.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:riverpod/riverpod.dart';

part 'user_controller.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(User()) User user,
  }) = _UserState;
}

final userProvider =
    StateNotifierProvider<UserController, UserState>((ref) => UserController());

class UserController extends StateNotifier<UserState> {
  UserController() : super(const UserState()) {
    login();
  }

  final _auth = firebase.FirebaseAuth.instance;
  final user = firebase.FirebaseAuth.instance.currentUser;

  final _fireUsersService = FireUsersService();

  StreamSubscription? _subs;

  String get name => state.user.name;

  String? get imageUrl => state.user.imgUrls;

  Future<void> login() async {
    final userCredential = await _auth.signInAnonymously();
    final user = userCredential.user;
    final uid = user?.uid;

    if (uid == null) return;


    _listen(uid);
  }

  void _listen(String uid) {
    _subs = _fireUsersService.listen(
      id: uid,
      onValueChanged: (user) {
        state = state.copyWith(user: user);
      },
    );
  }

  @override
  void dispose() {
    _subs?.cancel();
    super.dispose();
  }
}
