import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';

class ListScreenModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _creatureStream =
      FirebaseFirestore.instance.collection('creatures').snapshots();

  List<Creature>? creatures;

  void fetchCreatureList() {
    _creatureStream.listen((QuerySnapshot snapshot) {
      final List<Creature> creatures =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        final String name = data['name'];
        final String kinds = data['kinds'];
        return Creature(name, kinds);
      }).toList();
      this.creatures = creatures;
      notifyListeners();
    });
  }
}