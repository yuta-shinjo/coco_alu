import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/services/src/field_name.dart';
import 'package:my_collection/widget/circleIndicator.dart';

class FireAlbumService {
  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  final _auth = firebase.FirebaseAuth.instance;

  Future fetchAlbumList({required Function(List<Album>) onValueChanged}) async {
    final usersPublicStadiumsCollectionRef = _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('albums');
    final snapShot = await usersPublicStadiumsCollectionRef.get();
    final List<Album>? albums =
        snapShot.docs.map((e) => Album.fromJson(e.data())).toList();
    if (albums == null) {
      return CircleIndicator();
    }
    return onValueChanged(albums);
  }

  Future<void> addAlbum(
    String content,
    String imgUrl,
    File? imgFile,
  ) async {
    final collectionRef = _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('albums');
    final id = collectionRef.doc().id;
    if (imgFile != null) {
      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}/albums/$id')
          .putFile(imgFile);
      imgUrl = await task.ref.getDownloadURL();
    }
    await collectionRef.doc(id).set({
      FieldName.content: content,
      FieldName.imgUrl: imgUrl,
      FieldName.id: id,
    });
  }

  Future<void> deleteAlbum(Album album) {
    return _fireStore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('albums')
        .doc(album.id)
        .delete();
  }

  Future<void> deleteStorage(String id) {
    return _fireStorage
        .ref('users/${_auth.currentUser?.uid}/albums/$id')
        .delete();
  }

  Future<void> updateCreature(
    String? name,
    String? kinds,
    String? location,
    String? size,
    String? memo,
    String? imageUrl,
    File? imageFile,
    Creature creature,
  ) async {
    if (imageFile == null) {
      imageUrl == '';
      deleteStorage(creature.id);
    }

    if (imageFile != null) {
      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}/creatures/${creature.id}')
          .putFile(imageFile);
      imageUrl = await task.ref.getDownloadURL();
    }

    await _fireStore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection('creatures')
        .doc(creature.id)
        .update(
      {
        FieldName.name: name != '' ? name : creature.name,
        FieldName.imageUrl: imageUrl != '' ? imageUrl : creature.imageUrl,
        FieldName.kinds: kinds != '' ? kinds : creature.kinds,
        FieldName.location: location != '' ? location : creature.location,
        FieldName.size: size != '' ? size : creature.size,
        FieldName.memo: memo != '' ? memo : creature.memo,
      },
    );
  }
}
