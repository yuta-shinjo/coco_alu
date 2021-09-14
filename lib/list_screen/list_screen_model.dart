import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';

class ListScreenModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _creatureStream =
      FirebaseFirestore.instance.collection('creatures').snapshots();

  List<Creature>? creatures;

  Future displayDialog(
    BuildContext context,
    Creature creature,
    ListScreenModel model,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("削除の確認"),
          content: Text("『${creature.name}』を削除してもよろしいですか？"),
          actions: [
            TextButton(
              child: Text("はい"),
              onPressed: () async {
                await model.delete(creature);
                Navigator.pop(context);
                await model.deleteStorage(creature);
              },
            ),
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
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

  Future<void> delete(Creature creature) {
    return FirebaseFirestore.instance
        .collection('creatures')
        .doc(creature.id)
        .delete();
  }

  Future<void> deleteStorage(Creature creature) {
    return FirebaseStorage.instance.ref('creatures/${creature.id}').delete();
  }
}
