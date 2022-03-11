import 'dart:async';
import 'dart:io' as io;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class FireStorageService {
  final ImagePicker picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;

  //FirebaseStorageにアップロードして、
  //画像のURLを返すメソッド
  Future<String?> uploadImage({required io.File? croppedImageFile}) async {
    //firebaseStorageにアップロード
    if (croppedImageFile == null) return null;
    final io.File imageFile = io.File(croppedImageFile.path);
    final data = io.File(croppedImageFile.path).readAsBytesSync();
    final Reference ref = storage.ref("uploads/users/uid/nft_post_test.jpg");
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

  // Future<String?> uploadUserImage(
  //     {required String uid, required File? imageFile}) async {
  //   //firebaseStorageの画像を削除
  //   final imageUrl = _user.state.user.imageUrl;
  //   if (imageUrl.isNotEmpty) {
  //     final Reference deleteRef = storage.refFromURL(imageUrl);
  //     try {
  //       await deleteRef.delete();
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  //   //firebaseStorageにアップロード
  //   if (imageFile == null) return null;
  //   final iconImageFile = File(imageFile.path);
  //   final Reference ref = storage.ref("uploads/users/$uid/${uuid.v4()}.png");
  //   try {
  //     await ref.putFile(iconImageFile);
  //   } catch (e) {
  //     print(e);
  //   }
  //   //画像のURLを作成
  //   final String downloadURL = await ref.getDownloadURL();
  //   return downloadURL;
  // }
}
