import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/add_creature_page_controller.dart';
import 'package:my_collection/ui/add_creature_page/src/add_creature_page_body.dart';
import 'package:my_collection/widget/circleIndicator.dart';

class AddCreaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: AppBar(
            title: Text('図鑑を登録する'),
            centerTitle: true,
            actions: [
              _iconButton(),
            ],
          ),
          body: AddCreaturePageBody(),
        ),
      ),
    );
  }

  Widget _iconButton() {
    return Consumer(
      builder: (context, ref, _) {
        final name = ref.watch(addCreaturePageProvider.select((s) => s.name));
        final kinds = ref.watch(addCreaturePageProvider.select((s) => s.kinds));
        final location =
            ref.watch(addCreaturePageProvider.select((s) => s.location));
        final size = ref.watch(addCreaturePageProvider.select((s) => s.size));
        final memo = ref.watch(addCreaturePageProvider.select((s) => s.memo));
        final imgUrl = ref
            .watch(addCreaturePageProvider.select((s) => s.creatureImageUrl));
        var imageFile =
            ref.watch(addCreaturePageProvider.select((s) => s.imageFile));
        return IconButton(
          onPressed: () async {
            if (name != '' && kinds != '') {
              try {
                ref.read(addCreaturePageProvider.notifier).startLoading();
                await ref.read(addCreaturePageProvider.notifier).addCreature(
                      name,
                      kinds,
                      location,
                      size,
                      memo,
                      imgUrl,
                      imageFile,
                    );
                Fluttertoast.showToast(
                  msg: '$nameを登録しました',
                  toastLength: Toast.LENGTH_LONG,
                );
                ref
                    .read(addCreaturePageProvider.notifier)
                    .nameController
                    .clear();
                ref
                    .read(addCreaturePageProvider.notifier)
                    .kindsController
                    .clear();
                ref
                    .read(addCreaturePageProvider.notifier)
                    .locationController
                    .clear();
                ref
                    .read(addCreaturePageProvider.notifier)
                    .sizeController
                    .clear();
                ref
                    .read(addCreaturePageProvider.notifier)
                    .memoController
                    .clear();
                ref
                    .read(addCreaturePageProvider.notifier)
                    .deleteImage(imgUrl, imageFile);
              } catch (e) {
                print('エラー：$e');
                Fluttertoast.showToast(
                  msg: '$e',
                  toastLength: Toast.LENGTH_LONG,
                );
              } finally {
                ref.read(addCreaturePageProvider.notifier).endLoading();
              }
            } else {
              CircleIndicator();
            }
          },
          icon: Icon(Icons.check),
          tooltip: '登録',
        );
      },
    );
  }
}
