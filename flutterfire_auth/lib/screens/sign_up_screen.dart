import 'package:flutter/material.dart';

import 'package:flutterfire_auth/widgets/button.dart';
import 'package:flutterfire_auth/widgets/input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 32),
                  Input(labelText: 'Email'),
                  SizedBox(height: 16),
                  Input(labelText: 'Password', isPassword: true),
                  SizedBox(height: 16),
                  Input(labelText: 'Confirm Password', isPassword: true),
                  SizedBox(height: 32),
                  Button(text: 'Sign Up', onPressed: () => {}),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                SizedBox(width: 8),
                GestureDetector(
                  child: Text('Sign in', style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'sign_in');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
