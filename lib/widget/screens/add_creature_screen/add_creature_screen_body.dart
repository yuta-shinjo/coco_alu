import 'package:flutter/material.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/screens/add_creature_screen/add_creature_model.dart';

import '../../index.dart';

class AddCreatureScreenBody extends StatelessWidget {
  AddCreatureScreenBody({required this.model});

  final AddCreatureModel model;

  @override
  Widget build(BuildContext context) {
    return _body(context, model);
  }

  Widget _body(BuildContext context, AddCreatureModel model) {
    return SingleChildScrollView(
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
                    _nameTextField(),
                    SizedBox(height: 30),
                    Center(
                      child: Stack(
                        children: [
                          _imageArea(),
                          _imageButton(),
                        ],
                      ),
                    ),
                    kDivider,
                    _kindsTextField(),
                    SizedBox(height: 15),
                    _locationTextField(),
                    SizedBox(height: 15),
                    _sizeTextField(),
                    SizedBox(height: 25),
                    _memoTextField(),
                  ],
                ),
              ),
              if (model.isLoading) CircleIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageArea() {
    return CreatureImage(
      backgroundImage: model.imageFile != null
          ? Image.file(model.imageFile!).image
          : Image.asset(kDefaultImageURL).image,
      radius: 80,
    );
  }

  Widget _imageButton() {
    return PressedButton(
      onPressed: () async {
        await model.pickImage();
      },
    );
  }

  Widget _nameTextField() {
    return Container(
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
    );
  }

  Widget _kindsTextField() {
    return TextFieldArea(
      textAlign: TextAlign.center,
      decoration: kKindsDecoration,
      onChanged: (text) {
        model.setKinds(text);
      },
      controller: model.kindsController,
    );
  }

  Widget _locationTextField() {
    return TextFieldArea(
      textAlign: TextAlign.center,
      decoration: kLocationDecoration,
      onChanged: (text) {
        model.location = text;
      },
      controller: model.locationController,
    );
  }

  Widget _sizeTextField() {
    return TextFieldArea(
      textAlign: TextAlign.center,
      decoration: kSizeDecoration,
      onChanged: (text) {
        model.size = text;
      },
      controller: model.sizeController,
    );
  }

  Widget _memoTextField() {
    return TextFieldArea(
      textAlign: TextAlign.start,
      decoration: kMemoDecoration,
      onChanged: (text) {
        model.memo = text;
      },
      controller: model.memoController,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
    );
  }
}
