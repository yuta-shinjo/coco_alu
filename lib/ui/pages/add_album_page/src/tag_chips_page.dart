import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/tag_chips_page_controller.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class TagChip extends ConsumerWidget {
  const TagChip({Key? key, required this.btnController}) : super(key: key);

  final RoundedLoadingButtonController btnController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildChips(),
          TextFormField(
            onTap: () => btnController.reset(),
            controller: ref.read(tagChipsPageProvider.notifier).tagController,
            decoration: InputDecoration(hintText: 'タグを追加する'),
            onFieldSubmitted:
                ref.read(tagChipsPageProvider.notifier).onSubmitted,
            onChanged: (text) =>
                ref.read(tagChipsPageProvider.notifier).inputTag(text),
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return Consumer(
      builder: (context, ref, _) {
        final chipList =
            ref.watch(tagChipsPageProvider.select((s) => s.chipList)) ?? [];
        final labelList =
            ref.watch(tagChipsPageProvider.select((s) => s.labelList)) ?? [];
        for (int i = 0; i < labelList.length; i++) {
          final chip = Chip(
            label: Subtitle2Text(labelList[i]),
            onDeleted: () async {
              if (labelList != []) {
                try {
                  await ref.read(tagChipsPageProvider.notifier).deleteChip(i);
                } catch (e) {
                  print(e);
                }
              }
            },
          );
          chipList.add(chip);
        }
        return tag(chipList);
      },
    );
  }

  Widget tag(List<Chip>? chipsList) {
    if (chipsList == null) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              direction: Axis.horizontal,
              children: chipsList,
            ),
          ),
        ],
      );
    }
  }
}
