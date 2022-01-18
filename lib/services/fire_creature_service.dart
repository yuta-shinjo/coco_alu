import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/services/src/field_name.dart';

class FireCreatureService {
  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  final _auth = firebase.FirebaseAuth.instance;

  // //TODO jsのstudium_page_controllerのfetchUserStadiumsを参考にしてみる
  // StreamSubscription fetchCreatureList(
  //     {required Function(Creature) onValueChanged}) {
  //   return _fireStore
  //       .collection('users')
  //       .doc(_auth.currentUser?.uid)
  //       .collection('creatures')
  //       //TODO ランダムのidを取得できるようにしたい
  //       .doc(_auth.currentUser?.uid)
  //       .snapshots()
  //       .listen((snapshot) {
  //     final data = snapshot.data();
  //     if (data != null) {
  //       final creature = Creature.fromJson(data);
  //       onValueChanged(creature);
  //     }
  //   });
  // }

  Future<List<Creature>> fetchCreatureList({required Function(List<Creature>) onValueChanged}) async {
    final usersPublicStadiumsCollectionRef = _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('creatures');
    final snapShot = await usersPublicStadiumsCollectionRef.get();
    final List<Creature> creatures =
        snapShot.docs.map((e) => Creature.fromJson(e.data())).toList();
    return onValueChanged(creatures);
  }

  Future<void> addCreature(
    String name,
    String kinds,
    String? location,
    String? size,
    String? memo,
    String? imgUrl,
    File? imageFile,
  ) async {
    if (imageFile != null) {
      final task = await _fireStorage
          .ref('users/creatures/${_auth.currentUser?.uid}')
          .putFile(imageFile);
      imgUrl = await task.ref.getDownloadURL();
    }

    await _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('creatures')
        .doc(_auth.currentUser?.uid)
        .set({
      FieldName.name: name,
      FieldName.kinds: kinds,
      FieldName.location: location ?? '',
      FieldName.size: size ?? '',
      FieldName.memo: memo ?? '',
      FieldName.imageUrl: imgUrl ?? '',
    });
  }

  Future<void> deleteCreature(Creature creature) {
    return _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('creatures')
        //TODO ランダムに生成したidを指定したい
        .doc(_auth.currentUser?.uid)
        .delete();
  }

  Future<void> deleteStorage() {
    return _fireStorage
        .ref('users/creatures/${_auth.currentUser?.uid}')
        .delete();
  }

  Future<void> updateCreature(
    String? name,
    String? kinds,
    String? location,
    String? size,
    String? memo,
    String? imgUrl,
    File? imageFile,
  ) async {
    if (imageFile == null) {
      imgUrl == '';
    }
    if (imageFile != null) {
      if (imgUrl != '') {
        await deleteStorage();
      }

      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}')
          .putFile(imageFile);
      imgUrl = await task.ref.getDownloadURL();
    }

    await _fireStore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .doc(_auth.currentUser?.uid)
        .update(
      {
        FieldName.name: name,
        FieldName.imageUrl: imgUrl,
      },
    );
  }
}
