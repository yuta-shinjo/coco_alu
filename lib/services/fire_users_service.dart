import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_collection/models/src/user.dart';

import 'src/field_name.dart';

class FireUsersService {
  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  final _auth = firebase.FirebaseAuth.instance;

  User? user;

  Future<bool> isExisted({required String id}) async {
    final docSnapshot = await _fireStore
        .collection('users')
        .doc('v1')
        .collection('private')
        .doc(id)
        .get();
    return docSnapshot.data() != null;
  }

  StreamSubscription listen(
      {required String id, required Function(User) onValueChanged}) {
    return _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .snapshots()
        .listen((snapshot) {
      final data = snapshot.data();
      if (data != null) {
        final user = User.fromJson(data);
        onValueChanged(user);
      }
    });
  }

  Future<void> emailLogin(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<firebase.UserCredential> googleLogin() async {
    final googleUser = await GoogleSignIn(scopes: [
      'email',
    ]).signIn();
    // リクエストから、認証情報を取得
    final googleAuth = await googleUser?.authentication;
    // クレデンシャルを新しく作成
    final credential = firebase.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // サインインしたら、UserCredentialを返す
    return _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> registerUser(String newEmail, String newPassword) async {
    await _auth
        .createUserWithEmailAndPassword(
      email: newEmail,
      password: newPassword,
    )
        .then((currentUser) {
      _fireStore.collection("users").doc(currentUser.user?.uid).set({});
    });
  }

// メールアドレスを連携
  Future<void> linkEmail(String email, String password) async {
    final credential =
        firebase.EmailAuthProvider.credential(email: email, password: password);
    await _auth.currentUser!.linkWithCredential(credential);
  }

  // 匿名でログイン
  Future<void> anonymouslyRegisterUser() async {
    await _auth.signInAnonymously();
  }

  Future<void> registerUserProfile(
    String name,
    String profileImageUrl,
  ) async {
    await _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .set({
      FieldName.name: name,
      FieldName.imgUrls: profileImageUrl,
    });
  }

  Future<void> registerGoogleUserProfile(
    String? name,
    String? imgUrl,
  ) async {
    await _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .set({
      FieldName.name: _auth.currentUser?.displayName,
      FieldName.imgUrls: _auth.currentUser?.photoURL,
    });
  }

  Future<User?> fetchUserProfile() async {
    final snapshot = await _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .get();
    final data = snapshot.data();
    final user = data != null ? User.fromJson(data) : null;
    return user;
  }

  Future<void> deleteStorage() {
    return _fireStorage.ref('users/${_auth.currentUser?.uid}').delete();
  }

  Future<void> updateProfile(
      File? imageFile, String imgUrls, String name) async {
    if (imageFile == null && imgUrls == '') {
      imgUrls == '';
    }
    if (imageFile == null && imgUrls != '') {
      imgUrls;
    }

    await _fireStore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .update({
      FieldName.name: name,
      FieldName.imgUrls: imgUrls,
    });
  }
}
