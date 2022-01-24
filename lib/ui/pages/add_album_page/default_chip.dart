import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/add_album_page_controller.dart';
import 'package:my_collection/themes/test_app_colors.dart';
import 'package:my_collection/ui/components/components.dart';

class Category {
  String label;
  bool isSelected;
  Category(this.label, this.isSelected);
}

class DefaultChip extends ConsumerWidget {
  const DefaultChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected =
        ref.watch(addAlbumPageProvider.select((s) => s.isSelected));

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: FilterChip(
            label: Subtitle2Text(
              "旅行",
            ),
            selected: selected,
            onSelected: (value) {
              ref.read(addAlbumPageProvider.notifier).toggleSelected(value);
            },
            selectedColor: AppColors.primary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: FilterChip(
            label: Subtitle2Text(
              "食べ物",
            ),
            selected: selected,
            onSelected: (value) {
              ref.read(addAlbumPageProvider.notifier).toggleSelected(value);
            },
            selectedColor: AppColors.primary,
          ),
        ),
        FilterChip(
          label: Subtitle2Text(
            "家族",
          ),
          selected: selected,
          onSelected: (value) {
            ref.read(addAlbumPageProvider.notifier).toggleSelected(value);
          },
          selectedColor: AppColors.primary,
        ),
      ],
    );
  }
}
