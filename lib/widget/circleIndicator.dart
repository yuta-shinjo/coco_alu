import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -100,
      color: Colors.black54,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
