import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutterfire_auth/screens/home_screen.dart';
import 'package:flutterfire_auth/screens/sign_in_screen.dart';
import 'package:flutterfire_auth/screens/sign_up_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(FlutterFireAuth());
}

class FlutterFireAuth extends StatelessWidget {
  const FlutterFireAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Auth',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'sign_in': (context) => SignInScreen(),
        'sign_up': (context) => SignUpScreen(),
      },
    );
  }
}
