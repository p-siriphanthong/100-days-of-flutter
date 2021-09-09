import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
          child: Text('Go To Home Page'),
        ),
      ),
    );
  }
}
