import 'package:get/get.dart';

class GameController extends GetxController {
  Rx<int> _numberOfGuessRow = 10.obs;
  Rx<int> _currentGuessRow = 0.obs;

  int get numberOfGuessRow => _numberOfGuessRow.value;
  int get currentGuessRow => _currentGuessRow.value;

  void addMoreGuessRow(int value) {
    _numberOfGuessRow.value += value;
  }
}
