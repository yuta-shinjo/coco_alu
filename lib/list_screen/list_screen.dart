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
    return ChangeNotifierProvider<ListScreenModel>.value(
      value: ListScreenModel()..fetchCreatureList(),
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
                            backgroundImage: creature.imgURL != ''
                                ? NetworkImage(creature.imgURL!)
                                : Image.asset(kDefaultImageURL).image,
                            radius: 30,
                          ),
                          title: Text(creature.name),
                          subtitle: Text(creature.kinds),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditCreatureScreen(creature),
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
                             await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) {
                                  return DisplayDialog(
                                    title: "削除の確認",
                                    content: "『${creature.name}』を削除してもよろしいですか？",
                                    onPressed: () async {
                                      await model.delete(creature);
                                      Navigator.pop(context);
                                      await model.deleteStorage(creature);
                                    },
                                  );
                                },
                              );
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
