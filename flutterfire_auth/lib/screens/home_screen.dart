import 'package:flutter/material.dart';

import 'package:flutterfire_auth/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You're signed in", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Button(text: 'Sign Out', onPressed: () => {}),
          ],
        ),
      ),
    );
  }
}
