import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
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
        .then(
          (currentUser) =>
              _fireStore.collection("users").doc(currentUser.user?.uid).set({}),
        );
  }

  Future<void> registerProfile(
    String name,
    String profileImageUrl,
    File? imageFile,
  ) async {
    if (imageFile != null) {
      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}/profiles/${_auth.currentUser?.uid}')
          .putFile(imageFile);
      profileImageUrl = await task.ref.getDownloadURL();
    }

    await _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .set({
      FieldName.name: name,
      FieldName.imageUrl: profileImageUrl,
    });
  }

  StreamSubscription fetchUserProfile(
      {required Function(User) onValueChanged}) {
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
    // return snapshot.map((e) => User.fromJson(e.docs)).toList();
  }

  Future<void> deleteStorage() {
    return _fireStorage.ref('users/${_auth.currentUser?.uid}').delete();
  }

  Future<void> update(
      File? imageFile, String profileImageUrl, String name) async {
    if (imageFile == null) {
      profileImageUrl == '';
    }

    //firestoreに追加前にstorageの写真をアップデートする
    if (imageFile != null) {
      if (profileImageUrl != '') {
        await deleteStorage();
      }

      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}')
          .putFile(imageFile);
      profileImageUrl = await task.ref.getDownloadURL();
    }

    await _fireStore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .update({
      FieldName.name: name,
      FieldName.imageUrl: profileImageUrl,
    });
  }
}
