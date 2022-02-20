// import 'dart:async';
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:my_collection/controllers/global/user_controller.dart';

// class FireStorageService {
//   final ImagePicker picker = ImagePicker();
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final _user = UserController();
//   final Uuid uuid = const Uuid();

//   //画像を取得、軽量化、トリミングして、
//   //FirebaseStorageにアップロードして、
//   //画像のURLを返すメソッド
//   Future<String?> uploadImage() async {
//     //画像取得&軽量化
//     final pickedImageFile = await picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 1, //画質。とりあえず1いる。
//     );
//     //トリミング
//     if (pickedImageFile == null) return null;
//     final croppedImageFile = await ImageCropper.cropImage(
//       sourcePath: pickedImageFile.path,
//     );
//     //firebaseStorageにアップロード
//     if (croppedImageFile == null) return null;
//     final File imageFile = File(croppedImageFile.path);
//     final Reference ref = storage.ref("users/$uid/${uuid.v4()}.jpg");
//     try {
//       EasyLoading.show();
//       await ref.putFile(imageFile);
//     } catch (e) {
//       print(e);
//     }
//     //画像のURLを作成
//     final String downloadURL = await ref.getDownloadURL();
//     return downloadURL;
//   }

//   Future<String?> uploadUserImage(
//       {required String uid, required File? imageFile}) async {
//     //firebaseStorageの画像を削除
//     final imageUrl = _user.state.user.imageUrl;
//     if (imageUrl.isNotEmpty) {
//       final Reference deleteRef = storage.refFromURL(imageUrl);
//       try {
//         await deleteRef.delete();
//       } catch (e) {
//         print(e);
//       }
//     }
//     //firebaseStorageにアップロード
//     if (imageFile == null) return null;
//     final iconImageFile = File(imageFile.path);
//     final Reference ref = storage.ref("uploads/users/$uid/${uuid.v4()}.png");
//     try {
//       await ref.putFile(iconImageFile);
//     } catch (e) {
//       print(e);
//     }
//     //画像のURLを作成
//     final String downloadURL = await ref.getDownloadURL();
//     return downloadURL;
//   }
// }
