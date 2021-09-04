import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:provider/provider.dart';

import 'list_screen_model.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final items = List<String>.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListScreenModel>(
      create: (_) => ListScreenModel()..fetchCreatureList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('図鑑一覧'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
              tooltip: '並び替え',
            ),
          ],
        ),
        body: Center(
          child: Consumer<ListScreenModel>(builder: (context, model, child) {
            final List<Creature>? creatures = model.creatures;

            if (creatures == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = creatures
                .map(
                  (creature) => ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/picture.jpg'),
                    ),
                    title: Text(creature.name),
                    subtitle: Text(creature.kinds),
                    onTap: () {},
                  ),
                )
                .toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
      ),
    );
  }
}
