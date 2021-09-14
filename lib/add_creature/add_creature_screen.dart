import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/add_creature/add_creature_model.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/widget/index.dart';
import 'package:provider/provider.dart';

class AddCreatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCreatureModel>(
      create: (_) => AddCreatureModel(),
      child: Consumer<AddCreatureModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('図鑑を登録する'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: model.isAdd()
                      ? () async {
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
                        }
                      : null,
                  icon: Icon(Icons.check),
                  tooltip: '登録',
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
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
                                    backgroundImage: model.imageFile != null
                                        ? Image.file(model.imageFile!).image
                                        : Image.asset(kDefaultImageURL).image,
                                    radius: 80,
                                  ),
                                  PressedButton(
                                    onPressed: () async {
                                      await model.pickImage();
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
                                model.setKinds(text);
                              },
                              controller: model.kindsController,
                            ),
                            SizedBox(height: 15),
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kLocationDecoration,
                              onChanged: (text) {
                                model.location = text;
                              },
                              controller: model.locationController,
                            ),
                            SizedBox(height: 15),
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kSizeDecoration,
                              onChanged: (text) {
                                model.size = text;
                              },
                              controller: model.sizeController,
                            ),
                            SizedBox(height: 25),
                            TextFieldArea(
                              textAlign: TextAlign.start,
                              decoration: kMemoDecoration,
                              onChanged: (text) {
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
