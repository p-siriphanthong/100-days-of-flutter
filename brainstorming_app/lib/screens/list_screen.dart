import 'package:flutter/material.dart';

import 'package:brainstorming_app/widgets/idea_card.dart';
import 'package:brainstorming_app/models/idea.dart';

class ListScreen extends StatelessWidget {
  final Future<List<Idea>> ideas;

  const ListScreen({Key? key, required this.ideas}) : super(key: key);

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
      body: FutureBuilder<List<Idea>>(
          future: ideas,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Center(child: Text('Loading...'));
            if (snapshot.hasError)
              return Center(child: Text('${snapshot.error}'));

            List<Idea> data = snapshot.data!;

            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: EdgeInsets.all(16),
              children: List.generate(data.length, (index) {
                return IdeaCard(idea: data.elementAt(index));
              }),
            );
          }),
    );
  }
}
