import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditCreatureModel extends ChangeNotifier {
  String? name;
  String? kinds;
  String? location;
  String? size;
  String? memo;
  bool isLoading = false;
  File? imageFile;

  final picker = ImagePicker();

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> addCreature() async {
    if (name == null || name == '') {
      throw '名称の部分が入力されていません';
    }
    if (kinds == '') {
      throw '種類の部分が入力されていません';
    }

    final doc = FirebaseFirestore.instance.collection('creatures').doc();
    String? imgURL;

    //firestoreに追加前にstorageに写真を追加する
    if (imageFile != null) {
      final task = await FirebaseStorage.instance
          .ref('creatures/${doc.id}')
          .putFile(imageFile!);

      imgURL = await task.ref.getDownloadURL();
    }

    //  上のif文をくぐり抜けたらfirestoreに追加
    await doc.set({
      'name': name,
      'kinds': kinds,
      'location': location,
      'size': size,
      'memo': memo,
      'imgURL': imgURL,
    });
  }

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }
}
