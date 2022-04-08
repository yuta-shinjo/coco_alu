import 'dart:async';
import 'dart:io' as io;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:image_picker/image_picker.dart';

class FireStorageService {
  final ImagePicker picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  final _auth = firebase.FirebaseAuth.instance;

  //FirebaseStorageにアップロードして、
  //画像のURLを返すメソッド
  Future<String?> uploadProfileImage(
      {required io.File? croppedImageFile}) async {
    if (croppedImageFile == null) return null;
    final io.File imageFile = io.File(croppedImageFile.path);
    final data = io.File(croppedImageFile.path).readAsBytesSync();
    final Reference ref = storage.ref(
        "users/${_auth.currentUser?.uid}/profiles/${_auth.currentUser?.uid}");
    final metadata = SettableMetadata(contentType: 'image/jpg');
    try {
      EasyLoading.show();
      ref.putData(data, metadata);
      await ref.putFile(imageFile, metadata);
    } catch (e) {
      print(e);
    }
    //画像のURLを作成
    final String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<String?> uploadAlbumImage(
      {required io.File? croppedImageFile, required String id}) async {
    if (croppedImageFile == null) return null;
    final io.File imageFile = io.File(croppedImageFile.path);
    final data = io.File(croppedImageFile.path).readAsBytesSync();
    final Reference ref =
        storage.ref("users/${_auth.currentUser?.uid}/albums/$id");
    final metadata = SettableMetadata(contentType: 'image/jpg');
    try {
      EasyLoading.show();
      ref.putData(data, metadata);
      await ref.putFile(imageFile, metadata);
    } catch (e) {
      print(e);
    }
    //画像のURLを作成
    final String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> deleteStorage(String id) {
    return storage.ref('users/${_auth.currentUser?.uid}/albums/$id').delete();
  }
}
