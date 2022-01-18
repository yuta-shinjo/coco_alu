import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/controllers/pages/edit_list_page_controller.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/ui/edit_creature_page/edit_creature_page.dart';

import '../../../../widget/index.dart';

class EditListPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Consumer(
      builder: (context, ref, _) {
        final creatures =
            ref.watch(editListPageProvider.select((s) => s.creatures)) ?? [];
        return Center(
          child: ImplicitlyAnimatedReorderableList<Creature>(
            items: creatures,
            areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
            onReorderFinished: (creature, from, to, newItems) =>
                ref.read(editListPageProvider.notifier).endOnReOrder(),
            itemBuilder: (context, itemAnimation, creature, index) {
              return Reorderable(
                key: ValueKey(index),
                builder: (context, dragAnimation, inDrag) {
                  return Material(
                    type: MaterialType.transparency,
                    child: _slidable(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _slidable() {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: _handle(),
      secondaryActions: [
        _iconSlideAction(),
      ],
    );
  }

  Widget _handle() {
    return Consumer(
      builder: (context, ref, _) {
        final creatures =
            ref.watch(editListPageProvider.select((s) => s.creatures));
        return Handle(
          delay: Duration(milliseconds: 800),
          child: ListTile(
            leading: CreatureImage(
              backgroundImage: creatures!
                          .firstWhere((imageUrl) => imageUrl == imageUrl)
                          .imageUrl !=
                      ''
                  ? NetworkImage(
                      creatures
                          .firstWhere((imageUrl) => imageUrl == imageUrl)
                          .imageUrl,
                    )
                  : Image.asset(kDefaultImageURL).image,
              radius: 30,
            ),
            title: Text(creatures.firstWhere((name) => name == name).name),
            subtitle:
                Text(creatures.firstWhere((kinds) => kinds == kinds).kinds),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditCreaturePage(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _iconSlideAction() {
    return Consumer(
      builder: (context, ref, _) {
        final creatures =
            ref.watch(editListPageProvider.select((s) => s.creatures)) ?? [];
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
                  content:
                      "『${creatures.firstWhere((name) => name == name).name}』を削除してもよろしいですか？",
                  onPressed: () async {
                    await ref
                        .read(editListPageProvider.notifier)
                        .deleteCreature();
                    Navigator.pop(context);
                    await ref
                        .read(editListPageProvider.notifier)
                        .deleteStorage();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
