import 'package:flutter/material.dart';

import 'package:mastermind/widgets/colored_peg.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mastermind'),
        ),
        body: ListView(
          children: List.generate(10, (row) {
            return Container(
              height: 80,
              color: Colors.amber[row % 2 == 0 ? 600 : 100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (position) {
                  return DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return CodePag(color: Colors.grey);
                    },
                    onWillAccept: (data) {
                      return row == 0;
                    },
                    onAccept: (color) {
                      print('position: ${position + 1}, color: $color');
                    },
                  );
                }),
              ),
            );
          }),
          reverse: true,
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
