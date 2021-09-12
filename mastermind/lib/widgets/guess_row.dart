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
      height: 80,
      color: Colors.amber[index % 2 == 0 ? 600 : 100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(c.codeSize, (position) {
          return Obx(
            () => PegHole(
              color: code[position],
              row: index,
              position: position,
            ),
          );
        }),
      ),
    );
  }
}
