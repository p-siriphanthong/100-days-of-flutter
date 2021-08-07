import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:flutterfire_auth/services/authentication_service.dart';

class Authentication extends ChangeNotifier {
  User? _user;
  bool _isReady = false;

  User? get user => _user;
  bool get isReady => _isReady;
  bool get isAuthenticated => _user != null;

  Authentication() {
    getFirebaseAuth().authStateChanges().listen((User? user) {
      _user = user;
      _isReady = true;

      notifyListeners();
    });
  }
}

class AuthenticationProvider extends StatelessWidget {
  final Widget? child;

  AuthenticationProvider({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: child,
    );
  }
}

class AuthenticationCustomer extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    Authentication authentication,
    Widget? child,
  ) builder;

  AuthenticationCustomer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(builder: builder);
  }
}
