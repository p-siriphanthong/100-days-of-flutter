import 'package:flutter/material.dart';

class CodePag extends StatelessWidget {
  final Color? color;

  const CodePag({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
