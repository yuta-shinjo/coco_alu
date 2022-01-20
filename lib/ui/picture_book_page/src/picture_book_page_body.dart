import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/ui/picture_book_page/src/picture_book_card.dart';
import 'package:my_collection/ui/picture_book_page/picture_book_model.dart';
import 'package:provider/provider.dart';

import '../../../../widget/index.dart';

class PictureBookPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PictureBookModel>.value(
      value: PictureBookModel()..fetchCreatureList(),
      child: Consumer<PictureBookModel>(
        builder: (context, model, child) {
          model.initialized();
          final List<Creature>? creatures = model.creatures;

          if (creatures == null) {
            return CircleIndicator();
          }
          return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: model.controller,
            itemCount: creatures.length,
            itemBuilder: (context, index) {
              double? currentPage = 0;
              try {
                currentPage = model.controller!.page;
              } catch (_) {}

              final double resizeFactor =
                  (1 - (((currentPage! - index).abs() * 0.12).clamp(0, 1.0)));
              final currentCreature = creatures[index];
              return PictureBookCard(
                creature: currentCreature,
                resizeFactor: resizeFactor,
              );
            },
          );
        },
      ),
    );
  }
}
