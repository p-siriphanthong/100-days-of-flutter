import 'package:get/get.dart';

const ERROR_MESSAGE = {
  'email-already-in-use': 'This email address is already being used.',
  'user-not-found': 'The email address or password is incorrect.',
  'user-disabled': 'This account has been disabled.',
};

class ErrorController extends GetxController {
  Rx<String> _message = ''.obs;

  String get message => _message.value;

  void onErrorCode(String? code) {
    _message.value = ERROR_MESSAGE[code] ?? 'Something went wrong.';
  }

  void clearError() {
    _message.value = '';
  }
}
