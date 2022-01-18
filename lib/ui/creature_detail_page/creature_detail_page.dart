import 'package:flutter/material.dart';
import 'package:my_collection/domain/creature.dart';

import 'src/creature_detail_page_body.dart';

// class CreatureDetailPage extends StatelessWidget {
//   const CreatureDetailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Hero(
//           tag: "background_${widget.creature.name}",
//           child: Container(
//             color: Colors.white,
//           ),
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             elevation: 0,
//             title: Text(widget.creature.name),
//             leading: CloseButton(),
//           ),
//           body: CreatureDetailPageBody(
//             creature: widget.creature,
//             controller: _controller,
//           ),
//         ),
//       ],
//     );
//   }
// }


class CreatureDetailPage extends StatefulWidget {
  final Creature creature;

  const CreatureDetailPage({
    Key? key,
    required this.creature,
  }) : super(key: key);

  @override
  _CreatureDetailPageState createState() => _CreatureDetailPageState();
}

class _CreatureDetailPageState extends State<CreatureDetailPage>
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
          body: CreatureDetailPageBody(
            creature: widget.creature,
            controller: _controller,
          ),
        ),
      ],
    );
  }
}
