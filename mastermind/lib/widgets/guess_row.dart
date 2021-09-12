import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';
import 'package:mastermind/widgets/peg_hole.dart';

class GuessRow extends StatelessWidget {
  final GameController c = Get.put(GameController());
  final int index;

  GuessRow({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final code = c.guessedCodes[index];

    return Container(
      color: Colors.amber[index % 2 == 0 ? 600 : 100],
      child: Row(
        children: List.generate(c.codeSize, (position) {
          return Expanded(
            child: DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  child: Obx(
                    () => PegHole(
                      color: code[position],
                      row: index,
                      position: position,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                );
              },
              onMove: (data) => c.updateFocusedPosition(position),
              onLeave: (data) => c.updateFocusedPosition(null),
              onAccept: (Color color) => c.guess(color),
            ),
          );
        }),
      ),
    );
  }
}
