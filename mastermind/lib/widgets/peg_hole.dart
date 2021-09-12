import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';
import 'package:mastermind/widgets/colored_peg.dart';

class PegHole extends StatelessWidget {
  final GameController c = Get.put(GameController());
  final Color? color;
  final int row;
  final int position;

  PegHole({
    Key? key,
    required this.color,
    required this.row,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return CodePag(color: color ?? Colors.grey);
      },
      onWillAccept: (data) {
        return row == c.currentGuessRow;
      },
      onAccept: (Color color) {
        c.guess(color, position);
      },
    );
  }
}
