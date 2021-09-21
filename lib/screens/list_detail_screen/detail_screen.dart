import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';
import 'package:my_collection/widget/screens/list_detail_screen/detail_screen_body.dart';

class DetailScreen extends StatefulWidget {
  final Creature creature;

  const DetailScreen({
    Key? key,
    required this.creature,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
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
          body: DetailScreenBody(creature: widget.creature,controller: _controller,),
        ),
      ],
    );
  }
}
