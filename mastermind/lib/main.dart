import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mastermind/screens/home_screen.dart';
import 'package:mastermind/screens/game_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(Mastermind());
}

class Mastermind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mastermind',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'game': (context) => GameScreen(),
      },
    );
  }
}
