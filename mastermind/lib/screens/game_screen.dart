import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';
import 'package:mastermind/widgets/colored_peg.dart';
import 'package:mastermind/widgets/guess_row.dart';

class GameScreen extends StatelessWidget {
  final GameController c = Get.put(GameController());

  GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mastermind'),
        ),
        body: Obx(
          () => ListView(
            children: List.generate(c.numberOfGuessRow, (row) {
              return GuessRow(index: row);
            }),
            reverse: true,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Draggable(
                  data: 'red',
                  child: CodePag(color: Colors.red),
                  feedback: CodePag(color: Colors.red),
                  childWhenDragging: CodePag(color: Colors.red),
                );
              }),
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
