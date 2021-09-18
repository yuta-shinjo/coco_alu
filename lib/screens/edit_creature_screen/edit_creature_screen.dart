import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/widget/screens/edit_creature_screen/edit_creature_screen_body.dart';
import 'package:provider/provider.dart';

import 'edit_creature_model.dart';

class EditCreatureScreen extends StatelessWidget {
  EditCreatureScreen(this.creature);

  final Creature creature;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditCreatureModel>(
      create: (_) => EditCreatureModel(creature),
      child: Consumer<EditCreatureModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('図鑑を編集する'),
              centerTitle: true,
              actions: [
                _iconButton(context, model),
              ],
            ),
            body: EditCreatureScreenBody(model: model),
          );
        },
      ),
    );
  }

  Widget _iconButton(BuildContext context, EditCreatureModel model) {
    return IconButton(
      onPressed: () async {
        try {
          model.startLoading();
          await model.update();
          Fluttertoast.showToast(
            msg: '${model.name}を更新しました',
            toastLength: Toast.LENGTH_LONG,
          );
          Navigator.pop(context);
        } catch (e) {
          print('エラー：$e');
          Fluttertoast.showToast(
            msg: '$e',
            toastLength: Toast.LENGTH_LONG,
          );
        } finally {
          model.endLoading();
        }
      },
      icon: Icon(Icons.check),
      tooltip: '更新',
    );
  }
}
