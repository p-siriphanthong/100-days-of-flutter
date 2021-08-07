import 'package:flutter/material.dart';

import 'package:flutterfire_auth/providers/authentication_provider.dart';

class UnauthenticationGuard extends StatelessWidget {
  final Widget child;

  const UnauthenticationGuard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationCustomer(builder: (context, auth, _) {
      if (!auth.isReady) return Scaffold();
      if (!auth.isAuthenticated) return child;

      WidgetsBinding.instance!.addPostFrameCallback((Duration duration) {
        Navigator.pushReplacementNamed(context, 'home');
      });

      return Scaffold();
    });
  }
}
