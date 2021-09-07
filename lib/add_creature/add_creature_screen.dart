import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_collection/add_creature/add_creature_model.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:provider/provider.dart';

enum AddStatus { ADD, EDIT }

class AddCreatureScreen extends StatelessWidget {
  AddCreatureScreen({required this.status, this.word});

  final AddStatus status;
  //TODO wordのクラスが分からない
  final Creature? word;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController kindsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCreatureModel>(
      create: (_) => AddCreatureModel(),
      child: Consumer<AddCreatureModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('図鑑に登録'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    try {
                      await model.addCreature();
                      nameController.clear();
                      kindsController.clear();
                      locationController.clear();
                      sizeController.clear();
                      memoController.clear();
                      Fluttertoast.showToast(
                        msg: '${model.name}を保存しました',
                        toastLength: Toast.LENGTH_LONG,
                      );
                    } catch (e) {
                      Fluttertoast.showToast(
                        msg: '$e',
                        toastLength: Toast.LENGTH_LONG,
                      );
                    }
                  },
                  icon: Icon(Icons.check),
                  tooltip: '登録',
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '名称：セキセイインコ',
                      ),
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
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage:
                              AssetImage('assets/images/picture.jpg'),
                          radius: 80,
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          shape: const CircleBorder(),
                          elevation: 0,
                          child: const SizedBox(
                            width: 160,
                            height: 160,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 80,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SingleChildScrollView(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '種類：鳥類',
                            ),
                            onChanged: (text) {
                              model.kinds = text;
                            },
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            controller: kindsController,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SingleChildScrollView(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '発見場所：家の近くの公園',
                            ),
                            onChanged: (text) {
                              model.location = text;
                            },
                            textAlign: TextAlign.center,
                            controller: locationController,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SingleChildScrollView(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'サイズ：10センチ',
                            ),
                            onChanged: (text) {
                              model.size = text;
                            },
                            textAlign: TextAlign.center,
                            controller: sizeController,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            controller: memoController,
                            onChanged: (text) {
                              model.memo = text;
                            },
                            decoration: InputDecoration(
                              hintText: 'メモ：家族になりたそうにこちらを見ていて可愛かった',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
