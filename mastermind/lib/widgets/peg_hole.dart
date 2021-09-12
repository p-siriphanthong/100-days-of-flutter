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
    return Obx(
      () => Container(
        child: CodePag(color: color ?? Colors.grey),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: (c.currentGuessRow == row && c.focusedPosition == position)
                ? Colors.red
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
