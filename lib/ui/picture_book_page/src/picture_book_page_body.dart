import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/ui/creature_detail_page/creature_detail_page.dart';
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

              final num resizeFactor =
                  (1 - (((currentPage! - index).abs() * 0.2).clamp(0, 1.0)));
              final currentCreature = creatures[index];
              return PictureBookCard(
                creature: currentCreature,
                resizeFactor: resizeFactor as double,
                onTap: () => _goToDetail(context, currentCreature),
              );
            },
          );
        },
      ),
    );
  }

  _goToDetail(BuildContext context, Creature creature) {
    final page = CreatureDetailPage(creature: creature);
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: page,
              );
            },
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }
}
