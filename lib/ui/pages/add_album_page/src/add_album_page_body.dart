import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/controllers/pages/add_album_page_controller.dart';
import 'package:my_collection/controllers/pages/album_list_page_controller.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/controllers/pages/map_page_controller.dart';
import 'package:my_collection/controllers/pages/tag_chips_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/add_album_page/src/tag_chips_page.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';
import 'package:my_collection/utiles.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddAlbumPgeBody extends ConsumerWidget {
  const AddAlbumPgeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgFile = ref.watch(addAlbumPageProvider.select((s) => s.imgFile));
    final imgUrls = ref.watch(addAlbumPageProvider.select((s) => s.imgUrls));
    final content = ref.watch(addAlbumPageProvider.select((s) => s.content));
    final btnController = ref.read(addAlbumPageProvider.notifier).btnController;
    final contentController =
        ref.read(addAlbumPageProvider.notifier).contentController;
    final tags =
        ref.watch(tagChipsPageProvider.select((s) => s.labelList)) ?? [];
    final latitudeRef =
        ref.watch(addAlbumPageProvider.select((s) => s.latitudeRef));
    final latitude = ref.watch(addAlbumPageProvider.select((s) => s.latitude));
    final longitudeRef =
        ref.watch(addAlbumPageProvider.select((s) => s.longitudeRef));
    final longitude =
        ref.watch(addAlbumPageProvider.select((s) => s.longitude));
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _selectImage(imgUrls, btnController, imgFile),
              const Divider(color: AppColors.grey),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Subtitle2Text('コメント', color: AppColors.textDisable),
              ),
              const Divider(color: AppColors.grey),
              _contentArea(contentController, btnController),
              const Divider(color: AppColors.grey),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Subtitle2Text('タグ', color: AppColors.textDisable),
              ),
              const Divider(color: AppColors.grey),
              TagChip(btnController: btnController),
              const SizedBox(height: 40),
              _createdButton(
                btnController,
                content,
                imgUrls,
                imgFile,
                tags,
                latitudeRef,
                latitude,
                longitudeRef,
                longitude,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectImage(
    String imgUrls,
    RoundedLoadingButtonController btnController,
    File? imgFile,
  ) {
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          await ref
              .read(addAlbumPageProvider.notifier)
              .pickImage(image, imgUrls);
          btnController.reset();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          child: _imgArea(imgFile),
        ),
      );
    });
  }

  Widget _imgArea(File? imgFile) {
    return Image(
      image: imgFile != null
          ? Image.file(imgFile, fit: BoxFit.cover).image
          : AssetImage('assets/images/photo.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _contentArea(
    TextEditingController contentController,
    RoundedLoadingButtonController btnController,
  ) {
    return Consumer(
      builder: (context, ref, _) {
        return TextFormField(
          onTap: () => btnController.reset(),
          maxLines: 6,
          minLines: 6,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'コメントを書こう',
            border: InputBorder.none,
          ),
          onChanged: (text) {
            ref.read(addAlbumPageProvider.notifier).inputContent(text);
          },
          controller: contentController,
        );
      },
    );
  }

  Widget _createdButton(
    RoundedLoadingButtonController btnController,
    String content,
    String imgUrls,
    File? imgFile,
    List<String> tags,
    String? latitudeRef,
    String? latitude,
    String? longitudeRef,
    String? longitude,
  ) {
    return Consumer(builder: (context, ref, _) {
      return ButtonTheme(
        child: LoadingButton(
          primaryColor: AppColors.primary,
          text: ButtonText('作成'),
          controller: btnController,
          onPressed: () async {
            if (imgFile != null) {
              try {
                ref.read(addAlbumPageProvider.notifier).startLoading();
                ref
                    .read(addAlbumPageProvider.notifier)
                    .loadingSuccess(btnController);
                await ref.read(addAlbumPageProvider.notifier).addAlbum(
                      content,
                      imgUrls,
                      imgFile,
                      tags,
                      latitudeRef,
                      latitude,
                      longitudeRef,
                      longitude,
                    );
                createAlbumSuccessMassage();
                ref
                    .read(addAlbumPageProvider.notifier)
                    .contentController
                    .clear();
                ref
                    .read(addAlbumPageProvider.notifier)
                    .deleteImage(imgUrls, imgFile);
                ref.read(addAlbumPageProvider.notifier).clearContent();
                ref.read(tagChipsPageProvider.notifier).clearChips();
              } catch (e) {
                ref
                    .read(addAlbumPageProvider.notifier)
                    .loadingError(btnController);
                print(e);
              } finally {
                ref.read(addAlbumPageProvider.notifier).endLoading();
                btnController.reset();
                ref.read(homePageProvider.notifier).fetchAlbumList();
                ref.read(albumListPageProvider.notifier).fetchAlbumList();
                ref.read(mapPageProvider.notifier).fetchAlbumList();
              }
            } else {
              ref.read(addAlbumPageProvider.notifier).btnController.error();
              pictureErrorMassage(btnController);
            }
          },
        ),
      );
    });
  }
}
