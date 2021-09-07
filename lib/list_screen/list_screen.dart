import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_collection/domain/creature.dart';
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
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/picture.jpg'),
                          ),
                          title: Text(creature.name),
                          subtitle: Text(creature.kinds),
                          onTap: () {},
                          //TODO 図鑑編集のコード修正
                          // onPressed: (Creature selectedWord) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => AddCreatureScreen(
                          //         status: AddStatus.EDIT,
                          //         word: selectedWord,
                          //       ),
                          //     ),
                          //   );
                          // },,
                        ),
                        secondaryActions: [
                          IconSlideAction(
                            caption: '削除',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () async {
                              await displayDialog(context, creature, model);
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
}
