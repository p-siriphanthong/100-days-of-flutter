import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';

class SubmitButton extends StatelessWidget {
  final GameController c = Get.put(GameController());
  final GuessedCode guessedCode;

  SubmitButton({Key? key, required this.guessedCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => ElevatedButton(
          onPressed: guessedCode.submittable ? c.submitGuess : null,
          child: Text(
            "Send",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF3698EB),
            minimumSize: Size(46, 40),
            padding: EdgeInsets.zero,
            elevation: 0,
          ),
        ),
      ),
      width: 46,
    );
  }
}
