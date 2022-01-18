import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';

class PictureBookModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _creatureStream =
      FirebaseFirestore.instance.collection('creatures').snapshots();

  PageController? controller;

  List<Creature>? creatures;

  _pageListener() {
    notifyListeners();
  }

  initialized() {
    controller = PageController(viewportFraction: 0.6);
    controller!.addListener(_pageListener);
  }

  void fetchCreatureList() {
    _creatureStream.listen((QuerySnapshot snapshot) {
      final List<Creature> creatures =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        final String name = data['name'];
        final String kinds = data['kinds'];
        final String? location = data['location'];
        final String? size = data['size'];
        final String? memo = data['memo'];
        final String id = document.id;
        final String? imgURL = data['imgURL'];
        return Creature(
          name,
          kinds,
          location,
          size,
          memo,
          id,
          imgURL,
        );
      }).toList();
      this.creatures = creatures;
      notifyListeners();
    });
  }
}
