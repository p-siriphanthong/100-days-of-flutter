import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';
import 'package:mastermind/widgets/colored_peg.dart';

class GuessRow extends StatelessWidget {
  final GameController c = Get.put(GameController());
  final int index;

  GuessRow({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.amber[index % 2 == 0 ? 600 : 100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (position) {
          return DragTarget(
            builder: (context, candidateData, rejectedData) {
              return CodePag(color: Colors.grey);
            },
            onWillAccept: (color) {
              return index == c.currentGuessRow;
            },
            onAccept: (color) {
              print('position: ${position + 1}, color: $color');
            },
          );
        }),
      ),
    );
  }
}
