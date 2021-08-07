import 'package:flutter/material.dart';

import 'package:flutterfire_auth/widgets/button.dart';
import 'package:flutterfire_auth/widgets/authentication_guard.dart';
import 'package:flutterfire_auth/providers/authentication_provider.dart';
import 'package:flutterfire_auth/services/authentication_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationGuard(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You're signed in", style: TextStyle(fontSize: 24)),
              SizedBox(height: 12),
              AuthenticationCustomer(builder: (context, auth, child) {
                return Text("UID: ${auth.user!.uid}");
              }),
              SizedBox(height: 20),
              Button(text: 'Sign Out', onPressed: signOut),
            ],
          ),
        ),
      ),
    );
  }
}
