import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';

class HomeScreen extends StatelessWidget {
  final GameController c = Get.put(GameController());

  HomeScreen({Key? key}) : super(key: key);

  void startNewGame(BuildContext context) {
    c.startNewGame();
    Navigator.pushNamed(context, 'game');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => startNewGame(context),
          child: Text('Start Game'),
        ),
      ),
    );
  }
}
