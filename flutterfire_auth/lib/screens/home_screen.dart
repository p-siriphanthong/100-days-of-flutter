import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutterfire_auth/widgets/button.dart';
import 'package:flutterfire_auth/widgets/authentication_guard.dart';
import 'package:flutterfire_auth/controllers/authentication_controller.dart';
import 'package:flutterfire_auth/services/authentication_service.dart';
import 'package:flutterfire_auth/controllers/error_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthenticationController auth = Get.put(AuthenticationController());
  final ErrorController error = Get.put(ErrorController());

  HomeScreen({Key? key}) : super(key: key);

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
              Text("UID: ${auth.user?.uid}"),
              SizedBox(height: 20),
              Button(
                text: 'Sign Out',
                onPressed: () => signOut().catchError((err) {
                  error.onErrorCode(err?.code);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
