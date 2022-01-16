import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';

import 'src/detail_page_body.dart';

class DetailPage extends StatefulWidget {
  final Creature creature;

  const DetailPage({
    Key? key,
    required this.creature,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "background_${widget.creature.name}",
          child: Container(
            color: Colors.white,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Text(widget.creature.name),
            leading: CloseButton(),
          ),
          body: DetailPageBody(
            creature: widget.creature,
            controller: _controller,
          ),
        ),
      ],
    );
  }
}
