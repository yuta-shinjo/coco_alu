import 'package:flutter/material.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';

class PictureBookCard extends StatelessWidget {
  PictureBookCard({
    required this.creature,
    required this.resizeFactor,
    required this.onTap,
  });

  final Creature creature;
  final double resizeFactor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
      onTap: onTap,
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
                  child: _card(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _inkImage(context),
          SizedBox(height: 10),
          _text(),
        ],
      ),
    );
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
    return Text(
      creature.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18 * resizeFactor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
