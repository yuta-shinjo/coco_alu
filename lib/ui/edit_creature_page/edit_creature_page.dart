import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/ui/edit_creature_page/src/edit_creature_page_body.dart';
import 'package:provider/provider.dart';

import 'edit_creature_model.dart';

class EditCreaturePage extends StatelessWidget {
  EditCreaturePage(this.creature);

  final Creature creature;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditCreatureModel>(
      create: (_) => EditCreatureModel(creature),
      child: Consumer<EditCreatureModel>(
        builder: (context, model, child) {
          return Focus(
            focusNode: FocusNode(),
            child: GestureDetector(
              onTap: FocusScope.of(context).unfocus,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('図鑑を編集する'),
                  centerTitle: true,
                  actions: [
                    _iconButton(context, model),
                  ],
                ),
                body: EditCreaturePageBody(model: model),
              ),
            ),
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