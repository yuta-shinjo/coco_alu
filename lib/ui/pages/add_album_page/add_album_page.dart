import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_collection/controllers/pages/add_album_page_controller.dart';
import 'package:my_collection/themes/test_app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/add_album_page/default_chip.dart';
import 'package:my_collection/ui/projects/rounded_loading_button.dart';

class AddAlbumPage extends ConsumerWidget {
  const AddAlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgFile = ref.watch(addAlbumPageProvider.select((s) => s.imgFile));
    final imgUrl = ref.watch(addAlbumPageProvider.select((s) => s.imgUrl));
    final content = ref.watch(addAlbumPageProvider.select((s) => s.content));
    final controller = ref.watch(addAlbumPageProvider.notifier).btnController;
    
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('新規作成'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                await ref
                    .read(addAlbumPageProvider.notifier)
                    .pickImage(image, imgUrl);
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Image(
                  image: imgFile != null
                      ? Image.file(imgFile, fit: BoxFit.cover).image
                      : NetworkImage(
                          'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
                        ),
                  fit: BoxFit.cover,
                ),
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
            TextFormField(
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
            ),
            const Divider(color: AppColors.grey),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Subtitle2Text(
                'タグ',
                color: AppColors.grey,
              ),
            ),
            const Divider(color: AppColors.grey),
            DefaultChip(),
            SizedBox(height: 40),
            ButtonTheme(
              child: LoadingButton(
                primaryColor: AppColors.primary,
                text: ButtonText('投稿'),
                controller: controller,
                onPressed: () {
                  if (imgFile != null) {
                    try {
                      ref.read(addAlbumPageProvider.notifier).startLoading();
                      ref
                          .read(addAlbumPageProvider.notifier)
                          .addAlbum(content, imgUrl, imgFile);
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
                          .deleteImage(imgUrl, imgFile);
                    } catch (e) {
                      print(e);
                    } finally {
                      ref.read(addAlbumPageProvider.notifier).endLoading();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
