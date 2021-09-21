import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/widget/index.dart';
import 'package:my_collection/widget/screens/list_screen/list_screen_body.dart';
import 'package:provider/provider.dart';

import 'list_screen_model.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListScreenModel>.value(
      value: ListScreenModel()..fetchCreatureList(),
      child: Consumer<ListScreenModel>(builder: (context, model, child) {
        final List<Creature>? creatures = model.creatures;

        if (creatures == null) {
          return CircleIndicator();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('図鑑に変更を加える'),
            centerTitle: true,
          ),
          body: ListScreenBody(creatures: creatures, model: model),
        );
      }),
    );
  }
}
