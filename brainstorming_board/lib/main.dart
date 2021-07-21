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
  late Future<List<Idea>> _ideas;

  @override
  void initState() {
    super.initState();
    _ideas = getIdeas();
  }

  Future<Idea> onCreateIdea(String text) {
    return createIdea(text).then((Idea newIdea) {
      _ideas.then((ideas) {
        List<Idea> newIdeas = ideas;
        newIdeas.add(newIdea);

        setState(() {
          _ideas = Future<List<Idea>>.value(newIdeas);
        });
      });

      return newIdea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brainstorming Board',
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(ideas: _ideas),
        '/create': (context) => FormScreen(onCreateIdea: onCreateIdea),
      },
    );
  }
}
