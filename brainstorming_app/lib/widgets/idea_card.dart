import 'dart:math';
import 'package:flutter/material.dart';

class IdeaCard extends StatelessWidget {
  static List<MaterialColor> colors = [
    Colors.orange,
    Colors.amber,
    Colors.lime,
    Colors.lightGreen,
    Colors.cyan,
  ];
  final String text;

  const IdeaCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors[Random().nextInt(colors.length)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(this.text),
      ),
    );
  }
}
