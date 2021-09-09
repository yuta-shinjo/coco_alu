import 'package:flutter/material.dart';

class CreatureImage extends StatelessWidget {
  CreatureImage({
    required this.backgroundImage,
    required this.radius,
  });

  final ImageProvider<Object> backgroundImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      backgroundImage: backgroundImage,
      radius: radius,
    );
  }
}
