import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/controllers/pages/edit_creature_page_controller.dart';
import 'package:my_collection/ui/edit_creature_page/src/simple_dialog.dart';
import 'package:my_collection/widget/circleIndicator.dart';
import 'package:my_collection/widget/circle_avatar.dart';
import 'package:my_collection/widget/pressed_button.dart';

class EditCreaturePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading =
            ref.watch(editCreaturePageProvider.select((s) => s.isLoading));
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
                  if (isLoading) CircleIndicator(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  //TODO imageAreaを変更する
  Widget _imageArea(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Center(
          child: Stack(
            children: [
              CreatureImage(
                backgroundImage:
                    ref.read(editCreaturePageProvider.notifier).displayImage(),
                radius: 80,
              ),
              _imageButton(context),
            ],
          ),
        );
      },
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
    return Consumer(builder: (context, ref, _) {
      final imageFile =
          ref.watch(editCreaturePageProvider.select((s) => s.imageFile));
      final imageUrl =
          ref.watch(editCreaturePageProvider.select((s) => s.creatureImageUrl));
      return SelectDialog(
        selectPicture: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          await ref
              .read(editCreaturePageProvider.notifier)
              .pickImage(image, imageUrl);
          Navigator.pop(context);
        },
        deletePicture: () {
          ref.read(editCreaturePageProvider.notifier).deleteImage(
                imageUrl,
                imageFile,
              );
          Navigator.pop(context);
        },
      );
    });
  }

  Widget _nameTextField(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final controller =
          ref.read(editCreaturePageProvider.notifier).nameController;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          textAlign: TextAlign.center,
          decoration: kTitleDecoration,
          onChanged: (text) {
            ref.read(editCreaturePageProvider.notifier).ableButton();
            ref.read(editCreaturePageProvider.notifier).inputName(text);
          },
          controller: controller,
        ),
      );
    });
  }

  Widget _kindsTextField() {
    return Consumer(builder: (context, ref, _) {
      final controller =
          ref.read(editCreaturePageProvider.notifier).kindsController;
      return TextFormField(
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        decoration: kKindsDecoration,
        onChanged: (text) {
          ref.read(editCreaturePageProvider.notifier).ableButton();
          ref.read(editCreaturePageProvider.notifier).inputKinds(text);
        },
        controller: controller,
      );
    });
  }

  Widget _locationTextField() {
    return Consumer(builder: (context, ref, _) {
      final controller =
          ref.read(editCreaturePageProvider.notifier).locationController;
      return TextFormField(
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        decoration: kLocationDecoration,
        onChanged: (text) {
          ref.read(editCreaturePageProvider.notifier).ableButton();
          ref.read(editCreaturePageProvider.notifier).inputLocation(text);
        },
        controller: controller,
      );
    });
  }

  Widget _sizeTextField() {
    return Consumer(builder: (context, ref, _) {
      final controller =
          ref.read(editCreaturePageProvider.notifier).sizeController;
      return TextFormField(
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        decoration: kSizeDecoration,
        onChanged: (text) {
          ref.read(editCreaturePageProvider.notifier).ableButton();
          ref.read(editCreaturePageProvider.notifier).inputSize(text);
        },
        controller: controller,
      );
    });
  }

  Widget _memoTextField() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.read(editCreaturePageProvider.notifier).memoController;
        return TextFormField(
          textAlign: TextAlign.start,
          decoration: kMemoDecoration,
          onChanged: (text) {
            ref.read(editCreaturePageProvider.notifier).ableButton();
            ref.read(editCreaturePageProvider.notifier).inputMemo(text);
          },
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 4,
        );
      },
    );
  }
}
