import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/controllers/pages/add_creature_page_controller.dart';
import 'package:my_collection/widget/index.dart';

class AddCreaturePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading =
            ref.watch(addCreaturePageProvider.select((s) => s.isLoading));
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
                  if (isLoading) CircleIndicator(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  //TODO imageAreaをregisterProfileのpicker部分に変更する
  Widget _imageArea() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(addCreaturePageProvider.select((s) => s.imageFile));
        return CreatureImage(
          backgroundImage: imageFile != null
              ? Image.file(imageFile).image
              : Image.asset(kDefaultImageURL).image,
          radius: 80,
        );
      },
    );
  }

  Widget _imageButton() {
    return Consumer(
      builder: (context, ref, _) {
        final imageUrl = ref
            .watch(addCreaturePageProvider.select((s) => s.creatureImageUrl));
        return PressedButton(
          onPressed: () async {
            final image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            await ref
                .read(addCreaturePageProvider.notifier)
                .pickImage(image, imageUrl);
          },
        );
      },
    );
  }

  Widget _nameTextField() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.read(addCreaturePageProvider.notifier).nameController;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.center,
            decoration: kTitleDecoration,
            onChanged: (text) {
              ref.read(addCreaturePageProvider.notifier).inputName(text);
            },
            controller: controller,
          ),
        );
      },
    );
  }

  Widget _kindsTextField() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.read(addCreaturePageProvider.notifier).kindsController;
        return TextFormField(
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          decoration: kKindsDecoration,
          onChanged: (text) {
            ref.read(addCreaturePageProvider.notifier).inputKinds(text);
          },
          controller: controller,
        );
      },
    );
  }

  Widget _locationTextField() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.read(addCreaturePageProvider.notifier).locationController;
        return TextFormField(
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          decoration: kLocationDecoration,
          onChanged: (text) {
            ref.read(addCreaturePageProvider.notifier).inputLocation(text);
          },
          controller: controller,
        );
      },
    );
  }

  Widget _sizeTextField() {
    return Consumer(
      builder: (context, ref, _) {
        final controller =
            ref.read(addCreaturePageProvider.notifier).sizeController;
        return TextFormField(
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          decoration: kSizeDecoration,
          onChanged: (text) {
            ref.read(addCreaturePageProvider.notifier).inputSize(text);
          },
          controller: controller,
        );
      },
    );
  }

  Widget _memoTextField() {
    return Consumer(builder: (context, ref, _) {
      final controller =
          ref.read(addCreaturePageProvider.notifier).memoController;
      return TextFormField(
        textAlign: TextAlign.start,
        decoration: kMemoDecoration,
        onChanged: (text) {
          ref.read(addCreaturePageProvider.notifier).inputMemo(text);
        },
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: 4,
      );
    });
  }
}
