import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/services/src/field_name.dart';
import 'package:my_collection/widget/circleIndicator.dart';

class FireCreatureService {
  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  final _auth = firebase.FirebaseAuth.instance;

  Future fetchCreatureList(
      {required Function(List<Creature>) onValueChanged}) async {
    final usersPublicStadiumsCollectionRef = _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('creatures');
    final snapShot = await usersPublicStadiumsCollectionRef.get();
    final List<Creature>? creatures =
        snapShot.docs.map((e) => Creature.fromJson(e.data())).toList();
    if (creatures == null) {
      return CircleIndicator();
    }
    return onValueChanged(creatures);
  }

  Future<void> addCreature(
    String name,
    String kinds,
    String? location,
    String? size,
    String? memo,
    String? imageUrl,
    File? imageFile, {
    required Creature creature,
  }) async {
    final collectionRef = _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('creatures');
    final id = collectionRef.doc().id;
    if (imageFile != null) {
      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}/creatures/$id')
          .putFile(imageFile);
      imageUrl = await task.ref.getDownloadURL();
    }
    await collectionRef.doc(id).set({
      FieldName.name: name,
      FieldName.kinds: kinds,
      FieldName.location: location ?? '',
      FieldName.size: size ?? '',
      FieldName.memo: memo ?? '',
      FieldName.imageUrl: imageUrl ?? '',
      FieldName.id: id,
    });
  }

  Future<void> deleteCreature(Creature creature) {
    return _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('creatures')
        .doc(creature.id)
        .delete();
  }

  Future<void> deleteStorage(String id) {
    return _fireStorage
        .ref('users/${_auth.currentUser?.uid}/creatures/$id')
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
    Creature creature,
  ) async {
    if (imageFile == null) {
      imgUrl == '';
    }
    if (imageFile != null) {
      if (imgUrl != '') {
        await deleteStorage(creature.id);
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
        .doc(creature.id)
        .update(
      {
        FieldName.name: name,
        FieldName.imageUrl: imgUrl,
      },
    );
  }
}
