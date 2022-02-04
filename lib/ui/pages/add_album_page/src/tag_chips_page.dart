import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/tag_chips_page_controller.dart';

class TagChip extends ConsumerWidget {
  const TagChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chipsList = ref.watch(tagChipsPageProvider.select((s) => s.chipList));
    final tagTitle = ref.watch(tagChipsPageProvider.select((s) => s.tagTitle));
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: ref.read(tagChipsPageProvider.notifier).tagController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'タグを追加する',
            ),
            onFieldSubmitted:
                ref.read(tagChipsPageProvider.notifier).onSubmitted,
            onChanged: (text) {
              ref.read(tagChipsPageProvider.notifier).inputTag(text);
            },
          ),
          tag(chipsList),
        ],
      ),
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
              runSpacing: 0.0,
              direction: Axis.horizontal,
              children: chipsList,
            ),
          ),
        ],
      );
    }
  }
}
