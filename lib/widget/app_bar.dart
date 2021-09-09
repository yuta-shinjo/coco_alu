import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget {
  AppBarClass({required this.title, required this.actions});

  final Widget title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      actions: actions,
    );
  }
}
