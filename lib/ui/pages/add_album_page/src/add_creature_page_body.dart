import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/controllers/pages/add_creature_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        _nameTextField(),
                        SizedBox(height: 30),
                        _creaturePicture(),
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

  Widget _creaturePicture() {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(addCreaturePageProvider.select((s) => s.imageFile));
        final creatureImageUrl = ref
            .watch(addCreaturePageProvider.select((s) => s.creatureImageUrl));
        return Stack(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.circleBorder,
              child: CircleAvatar(
                radius: 98,
                backgroundImage: imageFile != null
                    ? Image.file(imageFile, fit: BoxFit.cover).image
                    : Image.asset(kDefaultImageURL).image,
              ),
            ),
            RawMaterialButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                await ref
                    .read(addCreaturePageProvider.notifier)
                    .pickImage(image, creatureImageUrl);
              },
              child: const SizedBox(
                width: 200,
                height: 200,
              ),
              shape: const CircleBorder(),
              elevation: 0,
            ),
          ],
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
    return Consumer(
      builder: (context, ref, _) {
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
      },
    );
  }
}
