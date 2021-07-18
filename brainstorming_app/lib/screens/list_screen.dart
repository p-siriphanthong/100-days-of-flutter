import 'package:flutter/material.dart';

import '../widgets/idea_card.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Brainstorming App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create'),
          tooltip: 'Create Idea',
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: List.generate(10, (index) {
              return IdeaCard(text: 'Sample Idea');
            }),
          ),
        ));
  }
}
