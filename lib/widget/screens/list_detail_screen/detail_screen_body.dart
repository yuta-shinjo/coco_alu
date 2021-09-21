import 'package:flutter/material.dart';
import 'package:my_collection/common/constants.dart';
import 'package:my_collection/domain/creature.dart';

class DetailScreenBody extends StatelessWidget {
  DetailScreenBody({required this.creature, required this.controller});

  final Creature creature;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: "image_${creature.name}",
            child: _image(context),
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, widget) => Transform.translate(
              transformHitTests: false,
              offset: Offset.lerp(
                  Offset(0.0, 200.0), Offset.zero, controller.value)!,
              child: widget,
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _kindsText(),
                  SizedBox(height: 15),
                  _locationText(),
                  SizedBox(height: 15),
                  _sizeText(),
                  SizedBox(height: 15),
                  _memoText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Image(
      image: creature.imgURL != ''
          ? NetworkImage(creature.imgURL!)
          : Image.asset(kDefaultImageURL).image,
      height: MediaQuery.of(context).size.height / 2,
      fit: BoxFit.cover,
    );
  }

  Widget _kindsText() {
    return Text(
      creature.kinds,
      style: kTextStyle,
    );
  }

  Widget _locationText() {
    return Container(
      child: (() {
        if (creature.location == '') {
          return Text(
            '例)発見場所：家の近くの公園',
            style: kExampleTextStyle,
          );
        } else {
          return Text(
            creature.location.toString(),
            style: kTextStyle,
          );
        }
      })(),
    );
  }

  Widget _sizeText() {
    return Container(
      child: (() {
        if (creature.size == '') {
          return Text(
            '例)サイズ：10センチ',
            style: kExampleTextStyle,
          );
        } else {
          return Text(
            creature.size.toString(),
            style: kTextStyle,
          );
        }
      })(),
    );
  }

  Widget _memoText() {
    return Container(
      child: (() {
        if (creature.memo == '') {
          return Text(
            '例)メモ：家族になりたそうにこちらを見ていて可愛かった',
            style: kExampleTextStyle,
          );
        } else {
          return Text(
            creature.memo.toString(),
            style: kTextStyle,
          );
        }
      })(),
    );
  }
}
