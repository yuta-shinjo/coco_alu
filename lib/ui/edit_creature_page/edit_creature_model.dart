import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';

class EditCreatureModel extends ChangeNotifier {
  EditCreatureModel(this.creature) {
    nameController.text = creature.name;
    kindsController.text = creature.kinds;
    locationController.text = creature.location!;
    sizeController.text = creature.size!;
    memoController.text = creature.memo!;
  }

  final Creature creature;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kindsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  final doc = FirebaseFirestore.instance.collection('creatures').doc();

  String? name;
  String? kinds;
  String? location;
  String? size;
  String? memo;
  String? imgURL;
  bool isLoading = false;
  bool changedFlag = false;
  File? imageFile;

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setKinds(String kinds) {
    this.kinds = kinds;
    notifyListeners();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  ImageProvider displayImage() {
    if (imageFile != null) {
      return Image.file(imageFile!).image;
    }
    if (creature.imgURL != '') {
      return NetworkImage(creature.imgURL!);
    }
    return Image.asset(kDefaultImageURL).image;
  }

  deleteImage() {
    if (creature.imgURL != '') {
      creature.imgURL = '';
    }
    if (imageFile != null) {
      imageFile = null;
    }
    notifyListeners();
  }

  Future<void> deleteStorage() {
    return FirebaseStorage.instance.ref('creatures/${creature.id}').delete();
  }

  Future<void> update() async {
    this.name = nameController.text;
    this.kinds = kindsController.text;
    this.location = locationController.text;
    this.size = sizeController.text;
    this.memo = memoController.text;
    this.imgURL = creature.imgURL;

    if (imageFile == null) {
      await deleteStorage();
    }

    //firestoreに追加前にstorageの写真をアップデートする
    if (imageFile != null) {
      if (imgURL != '') {
        await deleteStorage();
      }

      final task = await FirebaseStorage.instance
          .ref('creatures/${creature.id}') //creature.idはfirestoreに追加した時のid
          .putFile(imageFile!);
      imgURL = await task.ref.getDownloadURL();
    }

    await FirebaseFirestore.instance
        .collection("creatures")
        .doc(creature.id)
        .update({
      'name': name,
      'kinds': kinds,
      'location': location,
      'size': size,
      'memo': memo,
      'imgURL': imgURL,
    });
  }

  final picker = ImagePicker();

  Future editImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }
}
