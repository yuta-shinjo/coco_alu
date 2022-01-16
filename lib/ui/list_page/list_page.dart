import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/ui/list_page/src/list_page_body.dart';
import 'package:my_collection/widget/index.dart';
import 'package:provider/provider.dart';

import 'list_page_model.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListPageModel>.value(
      value: ListPageModel()..fetchCreatureList(),
      child: Consumer<ListPageModel>(builder: (context, model, child) {
        final List<Creature>? creatures = model.creatures;

        if (creatures == null) {
          return CircleIndicator();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('図鑑に変更を加える'),
            centerTitle: true,
          ),
          body: ListPageBody(creatures: creatures, model: model),
        );
      }),
    );
  }
}
