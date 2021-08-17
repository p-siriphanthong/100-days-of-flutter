import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutterfire_auth/controllers/authentication_controller.dart';

class UnauthenticationGuard extends StatelessWidget {
  final AuthenticationController auth = Get.put(AuthenticationController());
  final Widget child;

  UnauthenticationGuard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!auth.isAuthenticated) return child;

      WidgetsBinding.instance!.addPostFrameCallback((Duration duration) {
        Navigator.pushReplacementNamed(context, 'home');
      });

      return Scaffold();
    });
  }
}
