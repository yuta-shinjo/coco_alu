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
    List<String> tags,
    String imgTag,
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
      FieldName.tags: tags.map((e) => e).toList(),
      FieldName.public: false,
      FieldName.created: FieldValue.serverTimestamp(),
      FieldName.imgTag: imgTag,
    });
  }

  Future<void> addTags(
    List<String> tags,
  ) async {
    final collectionRef = _fireStore
        .collection('tags')
        .doc(_auth.currentUser?.uid)
        .collection('tags')
        .doc(_auth.currentUser?.uid);
    await collectionRef.set({
      FieldName.tags: tags.map((e) => e).toList(),
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

  Future<void> updateAlbum(
    String? content,
    String? imgUrls,
    File? imgFile,
    Album album,
  ) async {
    if (imgFile == null) {
      imgUrls == '';
      deleteStorage(album.id);
    }

    if (imgFile != null) {
      final task = await _fireStorage
          .ref('users/${_auth.currentUser?.uid}/albums/${album.id}')
          .putFile(imgFile);
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
