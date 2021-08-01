import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:flutterfire_auth/widgets/input.dart';
import 'package:flutterfire_auth/widgets/button.dart';
import 'package:flutterfire_auth/widgets/social_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                    'Sign In',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 32),
                  Input(labelText: 'Email'),
                  SizedBox(height: 16),
                  Input(labelText: 'Password', isPassword: true),
                  SizedBox(height: 32),
                  Button(text: 'Sign In', onPressed: () => {}),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: 8),
                      Text('or'),
                      SizedBox(width: 8),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialButton(
                        button: Buttons.Facebook,
                        onPressed: () => {},
                      ),
                      SocialButton(
                        button: Buttons.Twitter,
                        onPressed: () => {},
                      ),
                      SocialButton(
                        button: Buttons.Email,
                        onPressed: () => {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                SizedBox(width: 8),
                GestureDetector(
                  child: Text('Sign up', style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'sign_up');
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
