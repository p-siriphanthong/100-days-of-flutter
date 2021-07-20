import 'package:flutter/material.dart';

import 'package:brainstorming_app/screens/list_screen.dart';
import 'package:brainstorming_app/screens/form_screen.dart';
import 'package:brainstorming_app/services/idea_service.dart';
import 'package:brainstorming_app/models/idea.dart';

void main() => runApp(BrainstormingApp());

class BrainstormingApp extends StatefulWidget {
  const BrainstormingApp({Key? key}) : super(key: key);

  @override
  _BrainstormingAppState createState() => _BrainstormingAppState();
}

class _BrainstormingAppState extends State<BrainstormingApp> {
  late Future<List<Idea>> ideas;

  @override
  void initState() {
    super.initState();
    ideas = getIdeas();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brainstorming App',
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(ideas: ideas),
        '/create': (context) => FormScreen(),
      },
    );
  }
}
