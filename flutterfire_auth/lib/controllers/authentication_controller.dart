import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutterfire_auth/services/authentication_service.dart';

class AuthenticationController extends GetxController {
  Rx<User?> _user = (getFirebaseAuth().currentUser).obs;
  Rx<bool> _isAuthenticated = (getFirebaseAuth().currentUser != null).obs;

  User? get user => _user.value;
  bool get isAuthenticated => _isAuthenticated.value;

  @override
  void onReady() {
    super.onReady();

    getFirebaseAuth().authStateChanges().listen((User? user) {
      _user.value = user;
      _isAuthenticated.value = user != null;
    });

    _user.value?.reload();
  }
}
