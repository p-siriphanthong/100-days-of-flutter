import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';
import 'package:mastermind/widgets/feedback_card.dart';
import 'package:mastermind/widgets/peg_hole.dart';

class GuessRow extends StatelessWidget {
  final GameController c = Get.put(GameController());
  final int index;

  GuessRow({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final code = c.guessedCodes[index];

    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              (index + 1).toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFB2B5D1),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            width: 20,
          ),
          SizedBox(width: 16),
          Expanded(
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
                        padding: EdgeInsets.symmetric(vertical: 10),
                      );
                    },
                    onMove: (data) => c.updateFocusedPosition(position),
                    onLeave: (data) => c.updateFocusedPosition(null),
                    onAccept: (Color color) => c.guess(color),
                  ),
                );
              }),
            ),
          ),
          SizedBox(width: 16),
          FeedbackCard(row: index),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
