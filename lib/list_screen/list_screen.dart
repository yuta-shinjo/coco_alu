import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/edit_creature/edit_creature_screen.dart';
import 'package:my_collection/widget/index.dart';
import 'package:provider/provider.dart';

import 'list_screen_model.dart';

class ListScreen extends StatelessWidget {
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
          child: Consumer<ListScreenModel>(
            builder: (context, model, child) {
              final List<Creature>? creatures = model.creatures;

              if (creatures == null) {
                return CircularProgressIndicator();
              }

              final List<Widget> widgets = creatures
                  .map((creature) => Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        child: ListTile(
                          leading: CreatureImage(
                            backgroundImage: creature.imgURL != null
                                ? Image.network(creature.imgURL!).image
                                : Image.asset(kDefaultImageURL).image,
                            radius: 30,
                          ),

                          title: Text(creature.name),
                          subtitle: Text(creature.kinds),
                          //TODO 図鑑編集のコード修正
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditCreatureScreen(),
                              ),
                            );
                          },
                        ),
                        secondaryActions: [
                          IconSlideAction(
                            caption: '削除',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () async {
                              await model.displayDialog(
                                  context, creature, model);
                            },
                          ),
                        ],
                      ))
                  .toList();
              return ListView(
                children: widgets,
              );
            },
          ),
        ),
      ),
    );
  }
}
