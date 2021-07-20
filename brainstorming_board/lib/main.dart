import 'package:flutter/material.dart';

import 'package:brainstorming_board/screens/list_screen.dart';
import 'package:brainstorming_board/screens/form_screen.dart';
import 'package:brainstorming_board/services/idea_service.dart';
import 'package:brainstorming_board/models/idea.dart';

void main() => runApp(BrainstormingBoard());

class BrainstormingBoard extends StatefulWidget {
  const BrainstormingBoard({Key? key}) : super(key: key);

  @override
  _BrainstormingBoardState createState() => _BrainstormingBoardState();
}

class _BrainstormingBoardState extends State<BrainstormingBoard> {
  late Future<List<Idea>> ideas;

  @override
  void initState() {
    super.initState();
    ideas = getIdeas();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brainstorming Board',
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(ideas: ideas),
        '/create': (context) => FormScreen(),
      },
    );
  }
}
