import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/screens/edit_creature_screen/edit_creature_screen.dart';
import 'package:my_collection/screens/list_screen/list_screen_model.dart';

import '../../index.dart';

class ListScreenBody extends StatelessWidget {
  const ListScreenBody({required this.creatures, required this.model});

  final List<Creature> creatures;
  final ListScreenModel model;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Center(
      child: ImplicitlyAnimatedReorderableList<Creature>(
        items: creatures,
        areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
        onReorderFinished: (creature, from, to, newItems) => model.endOnReOrder,
        itemBuilder: (context, itemAnimation, creature, index) {
          return Reorderable(
            key: ValueKey(index),
            builder: (context, dragAnimation, inDrag) {
              return Material(
                type: MaterialType.transparency,
                child: _slidable(context, creature),
              );
            },
          );
        },
      ),
    );
  }

  Widget _slidable(BuildContext context, Creature creature) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: _handle(context, creature),
      secondaryActions: [
        _iconSlideAction(context, creature),
      ],
    );
  }

  Widget _handle(BuildContext context, Creature creature) {
    return Handle(
      delay: Duration(milliseconds: 800),
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
              builder: (context) => EditCreatureScreen(creature),
            ),
          );
        },
      ),
    );
  }

  Widget _iconSlideAction(BuildContext context, Creature creature) {
    return IconSlideAction(
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
    );
  }
}
