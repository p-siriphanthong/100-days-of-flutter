import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:flutterfire_auth/screens/home_screen.dart';
import 'package:flutterfire_auth/screens/sign_in_screen.dart';
import 'package:flutterfire_auth/screens/sign_up_screen.dart';
import 'package:flutterfire_auth/widgets/error_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await Firebase.initializeApp();

  runApp(FlutterFireAuth());
}

class FlutterFireAuth extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  FlutterFireAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterFire Auth',
      navigatorKey: _navigatorKey,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'sign_in': (context) => SignInScreen(),
        'sign_up': (context) => SignUpScreen(),
      },
      builder: (context, child) {
        return ErrorHandler(
          navigatorKey: _navigatorKey,
          child: child ?? Scaffold(),
        );
      },
    );
  }
}
