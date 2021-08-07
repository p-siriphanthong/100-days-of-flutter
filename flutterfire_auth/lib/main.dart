import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterfire_auth/screens/home_screen.dart';
import 'package:flutterfire_auth/screens/sign_in_screen.dart';
import 'package:flutterfire_auth/screens/sign_up_screen.dart';
import 'package:flutterfire_auth/providers/authentication_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await Firebase.initializeApp();

  runApp(FlutterFireAuth());
}

class FlutterFireAuth extends StatelessWidget {
  const FlutterFireAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationProvider(
      child: MaterialApp(
        title: 'FlutterFire Auth',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomeScreen(),
          'sign_in': (context) => SignInScreen(),
          'sign_up': (context) => SignUpScreen(),
        },
      ),
    );
  }
}
