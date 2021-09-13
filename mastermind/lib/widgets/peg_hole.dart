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
    return Obx(() {
      final bool isFocused =
          (c.currentGuessRow == row) && (c.focusedPosition == position);

      return Container(
        child: CodePag(color: color ?? Color(0xFF0F1331)),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isFocused ? Colors.white : Colors.transparent,
            width: 1,
          ),
          boxShadow: isFocused
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 10,
                  ),
                ]
              : null,
        ),
      );
    });
  }
}
