import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_collection/models/model.dart';

class FireConfigsService {
  final _firestore = FirebaseFirestore.instance;

  Future<AppConfig> fetchAppConfig() async {
    final docSnapshot = await _firestore.collection('configs').doc('v1').get();
    final data = docSnapshot.data();
    if(data == null) {
      return const AppConfig();
    }
    return AppConfig.fromJson(data);
  }
}