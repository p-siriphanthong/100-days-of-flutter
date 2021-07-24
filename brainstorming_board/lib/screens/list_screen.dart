import 'package:flutter/material.dart';

import 'package:brainstorming_board/widgets/idea_card.dart';
import 'package:brainstorming_board/models/idea.dart';
import 'package:brainstorming_board/utils/device.dart';

class ListScreen extends StatelessWidget {
  final Future<List<Idea>> ideas;
  final bool isDarkTheme;
  final void Function() toggleTheme;

  const ListScreen({
    Key? key,
    required this.ideas,
    required this.isDarkTheme,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brainstorming Board'),
        actions: <Widget>[
          IconButton(
            icon: Icon(isDarkTheme
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
            onPressed: toggleTheme,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        tooltip: 'Create Idea',
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Idea>>(
          future: ideas,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text('${snapshot.error}'));
            if (!snapshot.hasData) return Center(child: Text('Loading...'));

            List<Idea> data = snapshot.data!;

            return GridView.count(
              crossAxisCount: isMobile(context) ? 2 : 4,
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
