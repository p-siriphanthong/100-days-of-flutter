import 'package:flutter/material.dart';

import 'package:mastermind/widgets/mastermind_icons.dart';

class GameSettingBar extends StatelessWidget {
  const GameSettingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Mastermind.clock, color: Colors.white),
              SizedBox(width: 8),
              Text(
                '12 : 08 : 37',
                style: TextStyle(
                  color: Color(0xFF71C97B),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(Mastermind.megaphone, color: Colors.white),
                onTap: () {},
              ),
              SizedBox(width: 16),
              GestureDetector(
                child: Icon(Mastermind.music, color: Colors.white),
                onTap: () {},
              ),
              SizedBox(width: 16),
              GestureDetector(
                child: Icon(Mastermind.palette, color: Colors.white),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      color: Color(0xFF292D4E),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }
}
