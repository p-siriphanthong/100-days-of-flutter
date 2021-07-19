import 'package:flutter/material.dart';

import 'package:brainstorming_app/screens/list_screen.dart';
import 'package:brainstorming_app/screens/form_screen.dart';

void main() => runApp(BrainstormingApp());

class BrainstormingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brainstorming App',
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(),
        '/create': (context) => FormScreen(),
      },
    );
  }
}
