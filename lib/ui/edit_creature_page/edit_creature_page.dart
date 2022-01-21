import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/edit_creature_page_controller.dart';
import 'package:my_collection/models/src/creature.dart';
import 'package:my_collection/ui/edit_creature_page/src/edit_creature_page_body.dart';

class EditCreaturePage extends StatelessWidget {
  const EditCreaturePage({
    Key? key,
    required this.creature,
  }) : super(key: key);

  final Creature creature;

  Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => EditCreaturePage(
        creature: creature,
      ),
      settings: const RouteSettings(name: 'edit_creature_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: AppBar(
            title: Text('図鑑を編集する'),
            centerTitle: true,
            actions: [
              _iconButton(context),
            ],
          ),
          body: EditCreaturePageBody(creature: creature),
        ),
      ),
    );
  }

  Widget _iconButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final name = ref.watch(editCreaturePageProvider.select((s) => s.name));
        final kinds =
            ref.watch(editCreaturePageProvider.select((s) => s.kinds));
        final location =
            ref.watch(editCreaturePageProvider.select((s) => s.location));
        final size = ref.watch(editCreaturePageProvider.select((s) => s.size));
        final memo = ref.watch(editCreaturePageProvider.select((s) => s.memo));
        final imgUrl = ref
            .watch(editCreaturePageProvider.select((s) => s.creatureImageUrl));
        var imageFile =
            ref.watch(editCreaturePageProvider.select((s) => s.imageFile));
        return IconButton(
          onPressed: () async {
            try {
              ref.read(editCreaturePageProvider.notifier).startLoading();
              await ref.read(editCreaturePageProvider.notifier).updateCreature(
                    name,
                    kinds,
                    location,
                    size,
                    memo,
                    imgUrl,
                    imageFile,
                    creature,
                  );
              Fluttertoast.showToast(
                msg: '$nameを更新しました',
                toastLength: Toast.LENGTH_LONG,
              );
              Navigator.pop(context);
            } catch (e) {
              print('エラー：$e');
              Fluttertoast.showToast(
                msg: '$e',
                toastLength: Toast.LENGTH_LONG,
              );
            } finally {
              ref.read(editCreaturePageProvider.notifier).endLoading();
            }
          },
          icon: Icon(Icons.check),
          tooltip: '更新',
        );
      },
    );
  }
}
