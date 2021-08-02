import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text, style: TextStyle(fontSize: 18)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
