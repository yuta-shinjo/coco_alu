import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/widget/index.dart';
import 'package:provider/provider.dart';

import 'edit_creature_model.dart';

class EditCreatureScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kindsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditCreatureModel>(
      create: (_) => EditCreatureModel(),
      child: Consumer<EditCreatureModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('図鑑を編集する'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    try {
                      model.startLoading();
                      await model.addCreature();

                      Fluttertoast.showToast(
                        msg: '${model.name}を編集しました',
                        toastLength: Toast.LENGTH_LONG,
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      Fluttertoast.showToast(
                        msg: '$e',
                        toastLength: Toast.LENGTH_LONG,
                      );
                    } finally {
                      model.endLoading();
                    }
                  },
                  icon: Icon(Icons.check),
                  tooltip: '編集',
                ),
              ],
            ),
            body: Center(
              child: Stack(
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
                              model.name = text;
                            },
                            controller: nameController,
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
                        Column(
                          children: [
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kKindsDecoration,
                              onChanged: (text) {
                                model.kinds = text;
                              },
                              controller: kindsController,
                            ),
                            SizedBox(height: 15),
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kLocationDecoration,
                              onChanged: (text) {
                                model.location = text;
                              },
                              controller: locationController,
                            ),
                            SizedBox(height: 15),
                            TextFieldArea(
                              textAlign: TextAlign.center,
                              decoration: kSizeDecoration,
                              onChanged: (text) {
                                model.size = text;
                              },
                              controller: sizeController,
                            ),
                            SizedBox(height: 25),
                            TextFieldArea(
                              textAlign: TextAlign.start,
                              decoration: kMemoDecoration,
                              onChanged: (text) {
                                model.memo = text;
                              },
                              controller: memoController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  if (model.isLoading) CircleIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
