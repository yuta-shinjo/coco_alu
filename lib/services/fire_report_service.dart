import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_collection/services/src/field_name.dart';

class FireReportsService {
  final _fireStore = FirebaseFirestore.instance;

  // FireStoreにレポートを保存するメソッド
  Future<void> createReport({
    required String message,
    required String sendUserId,
    required String targetPostId,
    required String targetPostContent,
    required String targetUserId,
  }) async {
    final collectionRef =
        _fireStore.collection('reports').doc('v1').collection('reports');

    final id = collectionRef.doc().id;

    await collectionRef.doc(id).set(<String, dynamic>{
      FieldName.id: id,
      FieldName.message: message,
      FieldName.sendUserId: sendUserId,
      FieldName.targetAlbumId: targetPostId,
      FieldName.targetAlbumContent: targetPostContent,
      FieldName.targetUserId: targetUserId,
    });
  }
}
