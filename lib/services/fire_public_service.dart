import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/src/field_name.dart';

class FirePublicService {
  final _fireStore = FirebaseFirestore.instance;
  final auth = firebase.FirebaseAuth.instance;

  Future fetchAlbumList({required Function(List<Album>) onValueChanged}) async {
    final usersPublicStadiumsCollectionRef = _fireStore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection('albums');
    final snapShot = await usersPublicStadiumsCollectionRef.get();
    final List<Album>? albums =
        snapShot.docs.map((e) => Album.fromJson(e.data())).toList();
    if (albums == null) {
      return Center(child: CircularProgressIndicator());
    }
    return onValueChanged(albums);
  }

  Future<void> releaseAlbum(
    String content,
    String imgUrls,
    String id,
    String userId,
    String? tookDay,
    String? latitudeRef,
    String? latitude,
    String? longitudeRef,
    String? longitude,
    List<String> tags,
    bool public,
  ) async {
    final collectionRef =
        _fireStore.collection('public').doc('v1').collection('albums');
    await collectionRef.doc(id).set({
      FieldName.content: content,
      FieldName.imgUrls: imgUrls,
      FieldName.id: id,
      FieldName.tags: tags.map((e) => e).toList(),
      FieldName.public: public,
      FieldName.created: FieldValue.serverTimestamp(),
      FieldName.latitudeRef: latitudeRef ?? '',
      FieldName.latitude: latitude ?? '',
      FieldName.longitudeRef: longitudeRef ?? '',
      FieldName.longitude: longitude ?? '',
      FieldName.tookDay: tookDay ?? '',
    });
  }

  Future<void> deleteAlbum(Album album) {
    return _fireStore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection('albums')
        .doc(album.id)
        .delete();
  }
}
