import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCreatureModel extends ChangeNotifier {
  String? name;
  String? kinds;
  String? location;
  String? size;
  String? memo;

  Future<void> addCreature() async {
    if (name == null || name == '') {
      throw '名称の部分が入力されていません';
    }
    if (kinds == '') {
      throw '種類の部分が入力されていません';
    }

    //  上のif文をくぐり抜けたらfirestoreに追加
    await FirebaseFirestore.instance.collection('creatures').add({
      'name': name,
      'kinds': kinds,
      'location': location,
      'size': size,
      'memo': memo,
    });
  }
}
