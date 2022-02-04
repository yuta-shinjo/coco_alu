import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/controllers/pages/add_album_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/add_album_page/src/tag_chips_page.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';

class AddAlbumPgeBody extends ConsumerWidget {
  const AddAlbumPgeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgFile = ref.watch(addAlbumPageProvider.select((s) => s.imgFile));
    final imgUrls = ref.watch(addAlbumPageProvider.select((s) => s.imgUrl));
    final content = ref.watch(addAlbumPageProvider.select((s) => s.content));
    final btnController = ref.read(addAlbumPageProvider.notifier).btnController;
    final controller =
        ref.read(addAlbumPageProvider.notifier).contentController;
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  await ref
                      .read(addAlbumPageProvider.notifier)
                      .pickImage(image, imgUrls);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  child: _imgArea(imgFile),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 18),
                child: Subtitle2Text(
                  '投稿',
                  color: AppColors.grey,
                ),
              ),
              const Divider(color: AppColors.grey),
              _contentArea(controller),
              const Divider(color: AppColors.grey),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Subtitle2Text(
                  'タグ',
                  color: AppColors.grey,
                ),
              ),
              const Divider(color: AppColors.grey),
              TagChip(),
              const SizedBox(height: 40),
              ButtonTheme(
                child: LoadingButton(
                  primaryColor: AppColors.primary,
                  text: ButtonText('投稿'),
                  controller: btnController,
                  onPressed: () async {
                    if (imgFile != null) {
                      try {
                        ref.read(addAlbumPageProvider.notifier).startLoading();
                        ref
                            .read(addAlbumPageProvider.notifier)
                            .loadingSuccess(btnController);

                        await ref
                            .read(addAlbumPageProvider.notifier)
                            .addAlbum(content, imgUrls, imgFile);
                        Fluttertoast.showToast(
                          msg: '投稿しました',
                          toastLength: Toast.LENGTH_LONG,
                        );
                        ref
                            .read(addAlbumPageProvider.notifier)
                            .contentController
                            .clear();
                        ref
                            .read(addAlbumPageProvider.notifier)
                            .deleteImage(imgUrls, imgFile);
                      } catch (e) {
                        ref
                            .read(addAlbumPageProvider.notifier)
                            .loadingError(btnController);
                        print(e);
                      } finally {
                        ref.read(addAlbumPageProvider.notifier).endLoading();
                      }
                    } else {
                      ref
                          .read(addAlbumPageProvider.notifier)
                          .btnController
                          .error();
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imgArea(File? imgFile) {
    return Image(
      image: imgFile != null
          ? Image.file(imgFile, fit: BoxFit.cover).image
          : NetworkImage(
              'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
            ),
      fit: BoxFit.cover,
    );
  }

  Widget _contentArea(TextEditingController controller) {
    return Consumer(builder: (context, ref, _) {
      return TextFormField(
        maxLines: 6,
        minLines: 6,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(15),
          hintText: '投稿を書こう',
          border: InputBorder.none,
        ),
        onChanged: (text) {
          ref.read(addAlbumPageProvider.notifier).inputContent(text);
        },
        controller: controller,
      );
    });
  }
}
