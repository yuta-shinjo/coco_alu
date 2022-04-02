import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/services/src/field_name.dart';

class FirePublicService {
  final _fireStore = FirebaseFirestore.instance;
  final auth = firebase.FirebaseAuth.instance;

  Future fetchPublicAlbumList(
      {required Function(List<Album>) onValueChanged}) async {
    final usersPublicStadiumsCollectionRef =
        _fireStore.collection('public').doc('v1').collection('albums');
    final snapShot = await usersPublicStadiumsCollectionRef.get();
    final List<Album>? albums =
        snapShot.docs.map((e) => Album.fromJson(e.data())).toList();
    if (albums == null) {
      return;
    }
    return onValueChanged(albums);
  }

  // 渡したuserIdのユーザーが投稿した思い出を取得
  Future<List<Album>> fetchUserAlbumList({required String userId}) async {
    final usersPublicStadiumsCollectionRef = _fireStore
        .collection('public')
        .doc('v1')
        .collection('albums')
        .where('createdUser', isEqualTo: userId);
    final snapShot = await usersPublicStadiumsCollectionRef.get();
    final List<Album> albums =
        snapShot.docs.map((e) => Album.fromJson(e.data())).toList();
    return albums;
  }

  Future<void> releaseAlbum(List<String> tags, {required Album album}) async {
    final collectionRef =
        _fireStore.collection('public').doc('v1').collection('albums');
    await collectionRef.doc(album.id).set(<String, dynamic>{
      ...album.toJson(),
      FieldName.tags: tags.map((e) => e).toList(),
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
