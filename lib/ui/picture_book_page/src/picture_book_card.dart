import 'package:flutter/material.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/creature_detail_page/creature_detail_page.dart';

class PictureBookCard extends StatelessWidget {
  PictureBookCard({
    required this.creature,
    required this.resizeFactor,
  });

  final Creature creature;
  final double resizeFactor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: width * resizeFactor,
          height: height * resizeFactor,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: height / 4,
                bottom: 0,
                child: Hero(
                  tag: "background_${creature.name}",
                  child: _card(context,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetail(context, creature),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            _inkImage(context),
            _divider(),
            _text(),
          ],
        ),
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

  Widget _divider() {
    if (creature.imgURL == '') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Divider(color: Colors.black),
            SizedBox(height: 10),
          ],
        ),
      );
    }
    return SizedBox(height: 25);
  }

  Widget _inkImage(BuildContext context) {
    return Ink.image(
      image: creature.imgURL != ''
          ? NetworkImage(creature.imgURL!)
          : Image.asset(kDefaultImageURL).image,
      height: (MediaQuery.of(context).size.height / 5) * resizeFactor,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _text() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CardText(creature.name),
    );
  }
}
