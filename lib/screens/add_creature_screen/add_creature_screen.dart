import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/screens/add_creature_screen/add_creature_model.dart';
import 'package:my_collection/widget/circleIndicator.dart';
import 'package:my_collection/widget/screens/add_creature_screen/add_creature_screen_body.dart';
import 'package:provider/provider.dart';

class AddCreatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCreatureModel>(
      create: (_) => AddCreatureModel(),
      child: Consumer<AddCreatureModel>(
        builder: (context, model, child) {
          return Focus(
            focusNode: FocusNode(),
            child: GestureDetector(
              onTap: FocusScope.of(context).unfocus,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('図鑑を登録する'),
                  centerTitle: true,
                  actions: [
                    _iconButton(model),
                  ],
                ),
                body: AddCreatureScreenBody(model: model),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _iconButton(AddCreatureModel model) {
    return IconButton(
      onPressed: () async {
        if (model.name != null &&
            model.name != '' &&
            model.kinds != null &&
            model.kinds != '') {
          try {
            model.startLoading();
            await model.addCreature();
            Fluttertoast.showToast(
              msg: '${model.name}を登録しました',
              toastLength: Toast.LENGTH_LONG,
            );
            model.nameController.clear();
            model.kindsController.clear();
            model.locationController.clear();
            model.sizeController.clear();
            model.memoController.clear();
            model.imageFile = null;
          } catch (e) {
            print('エラー：$e');
            Fluttertoast.showToast(
              msg: '$e',
              toastLength: Toast.LENGTH_LONG,
            );
          } finally {
            model.endLoading();
          }
        } else {
          CircleIndicator();
        }
      },
      icon: Icon(Icons.check),
      tooltip: '登録',
    );
  }
}
