import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/src/field_name.dart';

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
      return Center(child: CircularProgressIndicator());
    }
    return onValueChanged(albums);
  }

  Future<void> addAlbum(
    String content,
    String imgUrls,
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
      imgUrls = await task.ref.getDownloadURL();
    }
    await collectionRef.doc(id).set({
      FieldName.content: content,
      FieldName.imgUrls: imgUrls,
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
    String? content,
    String? imgUrls,
    File? imageFile,
    Album album,
  ) async {
    if (imageFile == null) {
      imgUrls == '';
      deleteStorage(album.id);
    }

    if (imageFile != null) {
      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}/albums/${album.id}')
          .putFile(imageFile);
      imgUrls = await task.ref.getDownloadURL();
    }

    await _fireStore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection('albums')
        .doc(album.id)
        .update(
      {
        FieldName.content: content != '' ? content : album.content,
      },
    );
  }
}
