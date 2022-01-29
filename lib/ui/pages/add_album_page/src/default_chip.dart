import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/add_album_page_controller.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';

class Tags {
  String label;
  bool isSelected;
  Tags(this.label, this.isSelected);
}

class DefaultChip extends ConsumerWidget {
  const DefaultChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final travel = ref.watch(addAlbumPageProvider.select((s) => s.isTravel));
    final food = ref.watch(addAlbumPageProvider.select((s) => s.isFood));
    final family = ref.watch(addAlbumPageProvider.select((s) => s.isFamily));

    return Wrap(
      children: tagChips(ref),
    );

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: FilterChip(
            label: Subtitle2Text(
              "旅行",
            ),
            selected: travel,
            onSelected: (value) {
              ref.read(addAlbumPageProvider.notifier).travelSelect(value);
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
            selected: food,
            onSelected: (value) {
              ref.read(addAlbumPageProvider.notifier).foodSelect(value);
            },
            selectedColor: AppColors.primary,
          ),
        ),
        FilterChip(
          label: Subtitle2Text(
            "家族",
          ),
          selected: family,
          onSelected: (value) {
            ref.read(addAlbumPageProvider.notifier).familySelect(value);
          },
          selectedColor: AppColors.primary,
        ),
      ],
    );
  }

  List<Widget> tagChips(WidgetRef ref) {
    final travel = ref.watch(addAlbumPageProvider.select((s) => s.isTravel));
    final food = ref.watch(addAlbumPageProvider.select((s) => s.isFood));
    final family = ref.watch(addAlbumPageProvider.select((s) => s.isFamily));
    final selected =
        ref.watch(addAlbumPageProvider.select((s) => s.isSelected));
    List<Tags> _chipsList = [
      Tags("旅行", selected),
      Tags("食べ物", selected),
      Tags("家族", selected),
    ];
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 16),
        child: FilterChip(
          label: Subtitle2Text(_chipsList[i].label),
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            _chipsList[i].isSelected = value;
         ref.read(addAlbumPageProvider.notifier).travelSelect(_chipsList[i].isSelected);
          },  
          selectedColor: AppColors.primary,
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

class DefaultChipTest extends StatefulWidget {
  const DefaultChipTest({Key? key}) : super(key: key);

  @override
  _DefaultChipState createState() => _DefaultChipState();
}

class TagsTest {
  String label;
  bool isSelected;
  TagsTest(this.label, this.isSelected);
}

class _DefaultChipState extends State<DefaultChip> {
  bool selected = false;
  List<Tags> _chipsList = [
    Tags("旅行", false),
    Tags("食べ物", false),
    Tags("家族", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Chip"),
        ),
        body: Wrap(
          spacing: 8,
          direction: Axis.horizontal,
          children: techChips(),
        ));
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
          selectedColor: AppColors.primary,
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
