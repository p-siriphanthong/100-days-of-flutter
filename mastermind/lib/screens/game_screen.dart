import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mastermind/controllers/game_controller.dart';
import 'package:mastermind/widgets/colored_peg.dart';
import 'package:mastermind/widgets/game_setting_bar.dart';
import 'package:mastermind/widgets/guess_row.dart';
import 'package:mastermind/widgets/mastermind_icons.dart';

class GameScreen extends StatelessWidget {
  final GameController c = Get.put(GameController());

  GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        backgroundColor: Color(0xFF1D213E),
        appBar: AppBar(
          title: Text(
            'Mastermind',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Mastermind.arrow_left),
            onTap: () => Navigator.pop(context),
          ),
          actions: [
            GestureDetector(
              child: Icon(Mastermind.information),
              onTap: () {},
            ),
            SizedBox(width: 16),
          ],
          backgroundColor: Color(0xFF1D213E),
          shadowColor: Colors.transparent,
          bottom: PreferredSize(
            child: GameSettingBar(),
            preferredSize: Size.fromHeight(40),
          ),
        ),
        body: Obx(
          () => ListView(
            children: List.generate(c.numberOfGuessRow, (row) {
              return GuessRow(index: row);
            }),
            padding: EdgeInsets.symmetric(vertical: 18),
            reverse: true,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: c.availableColors.map((color) {
                return Draggable(
                  data: color,
                  child: CodePag(color: color),
                  feedback: CodePag(color: color),
                  childWhenDragging: CodePag(),
                  maxSimultaneousDrags: 1,
                );
              }).toList(),
            ),
            padding: EdgeInsets.all(16),
          ),
          color: Color(0xFF0F1331),
        ),
      ),
    );
  }
}
