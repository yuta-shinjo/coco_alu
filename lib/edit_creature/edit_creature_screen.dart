import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/widget/index.dart';
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
                IconButton(
                  onPressed: model.changedFlag
                      ? () async {
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
                  }
                      : null,
                  icon: Icon(Icons.check),
                  tooltip: '更新',
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFieldArea(
                                textAlign: TextAlign.center,
                                decoration: kTitleDecoration,
                                onChanged: (text) {
                                  model.changedFlag = true;
                                  model.setName(text);
                                },
                                controller: model.nameController,
                              ),
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: Stack(
                                children: [
                                  CreatureImage(
                                    backgroundImage: model.displayImage(),
                                    radius: 80,
                                  ),
                                  PressedButton(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) {
                                          return SelectDialog(
                                              onPressedOption1:() {
                                                model.editImage();
                                                Navigator.pop(context);
                                              },
                                              onPressedOption2:() {
                                                model.deleteImage();
                                                Navigator.pop(context);
                                              },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            kDivider,
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kKindsDecoration,
                              onChanged: (text) {
                                model.changedFlag = true;
                                model.setKinds(text);
                              },
                              controller: model.kindsController,
                            ),
                            SizedBox(height: 15),
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kLocationDecoration,
                              onChanged: (text) {
                                model.changedFlag = true;
                                model.location = text;
                              },
                              controller: model.locationController,
                            ),
                            SizedBox(height: 15),
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kSizeDecoration,
                              onChanged: (text) {
                                model.changedFlag = true;
                                model.size = text;
                              },
                              controller: model.sizeController,
                            ),
                            SizedBox(height: 25),
                            TextFieldArea(
                              textAlign: TextAlign.start,
                              decoration: kMemoDecoration,
                              onChanged: (text) {
                                model.changedFlag = true;
                                model.memo = text;
                              },
                              controller: model.memoController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                      if (model.isLoading) CircleIndicator(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
