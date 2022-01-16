import 'package:flutter/material.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/screens/edit_creature_screen/edit_creature_model.dart';

import '../../index.dart';

class EditCreatureScreenBody extends StatelessWidget {
  EditCreatureScreenBody({required this.model});

  final EditCreatureModel model;

  @override
  Widget build(BuildContext context) {
    return _body(context, model);
  }

  Widget _body(BuildContext context, EditCreatureModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    _nameTextField(context),
                    SizedBox(height: 30),
                    _imageArea(context),
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

  Widget _imageArea(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CreatureImage(
            backgroundImage: model.displayImage(),
            radius: 80,
          ),
          _imageButton(context),
        ],
      ),
    );
  }

  Widget _imageButton(BuildContext context) {
    return PressedButton(
      onPressed: () async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return _dialog(context);
          },
        );
      },
    );
  }

  Widget _dialog(BuildContext context) {
    return SelectDialog(
      onPressedOption1: () {
        model.editImage();
        Navigator.pop(context);
      },
      onPressedOption2: () {
        model.deleteImage();
        Navigator.pop(context);
      },
    );
  }

  Widget _nameTextField(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: kTitleDecoration,
        onChanged: (text) {
          model.changedFlag = true;
          model.setName(text);
        },
        controller: model.nameController,
      ),
    );
  }

  Widget _kindsTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: kKindsDecoration,
      onChanged: (text) {
        model.changedFlag = true;
        model.setKinds(text);
      },
      controller: model.kindsController,
    );
  }

  Widget _locationTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: kLocationDecoration,
      onChanged: (text) {
        model.changedFlag = true;
        model.location = text;
      },
      controller: model.locationController,
    );
  }

  Widget _sizeTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: kSizeDecoration,
      onChanged: (text) {
        model.changedFlag = true;
        model.size = text;
      },
      controller: model.sizeController,
    );
  }

  Widget _memoTextField() {
    return TextFormField(
      textAlign: TextAlign.start,
      decoration: kMemoDecoration,
      onChanged: (text) {
        model.changedFlag = true;
        model.memo = text;
      },
      controller: model.memoController,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
    );
  }
}
