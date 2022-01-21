import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/controllers/pages/edit_creature_page_controller.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/edit_creature_page/src/simple_dialog.dart';
import 'package:my_collection/widget/circleIndicator.dart';

class EditCreaturePageBody extends StatelessWidget {
  const EditCreaturePageBody({
    Key? key,
    required this.creature,
  }) : super(key: key);

  final Creature creature;

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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        _nameTextField(context),
                        SizedBox(height: 30),
                        _creaturePicture(creature),
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

  Widget _creaturePicture(Creature creature) {
    return Consumer(
      builder: (context, ref, _) {
        final imageFile =
            ref.watch(editCreaturePageProvider.select((s) => s.imageFile));
        final imageUrl = ref
            .watch(editCreaturePageProvider.select((s) => s.creatureImageUrl));
        return Stack(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.circleBorder,
              child: CircleAvatar(
                radius: 98,
                backgroundImage: imageFile != null
                    ? Image.file(imageFile).image
                    : Image.asset(kDefaultImageURL).image,
              ),
            ),
            RawMaterialButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return _dialog();
                  },
                );
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

  Widget _dialog() {
    return Consumer(builder: (context, ref, _) {
      final profileImageUrl =
          ref.watch(editCreaturePageProvider.select((s) => s.creatureImageUrl));
      final imageFile =
          ref.watch(editCreaturePageProvider.select((s) => s.imageFile));
      return SelectDialog(
        selectPicture: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          await ref
              .read(editCreaturePageProvider.notifier)
              .pickImage(image, profileImageUrl);
          Navigator.pop(context);
        },
        deletePicture: () {
          ref
              .read(editCreaturePageProvider.notifier)
              .deleteImage(creature.imageUrl, imageFile);
          Navigator.pop(context);
        },
      );
    });
  }

  Widget _nameTextField(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          initialValue: creature.name,
          textAlign: TextAlign.center,
          decoration: kTitleDecoration,
          onChanged: (text) {
            ref.read(editCreaturePageProvider.notifier).inputName(text);
          },
        ),
      );
    });
  }

  Widget _kindsTextField() {
    return Consumer(builder: (context, ref, _) {
      return TextFormField(
        initialValue: creature.kinds,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        decoration: kKindsDecoration,
        onChanged: (text) {
          ref.read(editCreaturePageProvider.notifier).inputKinds(text);
        },
      );
    });
  }

  Widget _locationTextField() {
    return Consumer(builder: (context, ref, _) {
      return TextFormField(
        initialValue: creature.location,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        decoration: kLocationDecoration,
        onChanged: (text) {
          ref.read(editCreaturePageProvider.notifier).inputLocation(text);
        },
      );
    });
  }

  Widget _sizeTextField() {
    return Consumer(builder: (context, ref, _) {
      return TextFormField(
        initialValue: creature.size,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        decoration: kSizeDecoration,
        onChanged: (text) {
          ref.read(editCreaturePageProvider.notifier).inputSize(text);
        },
      );
    });
  }

  Widget _memoTextField() {
    return Consumer(
      builder: (context, ref, _) {
        return TextFormField(
          initialValue: creature.memo,
          textAlign: TextAlign.start,
          decoration: kMemoDecoration,
          onChanged: (text) {
            ref.read(editCreaturePageProvider.notifier).inputMemo(text);
          },
          keyboardType: TextInputType.multiline,
          maxLines: 4,
        );
      },
    );
  }
}
