import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'game'),
          child: Text('Start Game'),
        ),
      ),
    );
  }
}
