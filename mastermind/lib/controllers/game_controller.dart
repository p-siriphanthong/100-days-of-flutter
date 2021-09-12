import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  late List<Color> _secretCode;
  late List<Color> _availableColors;
  late List<RxList<Color?>> _guessedCodes;
  late Rx<int> _numberOfGuessRow;
  late Rx<int> _currentGuessRow;

  List<Color> get secretCode => _secretCode;
  List<Color> get availableColors => _availableColors;
  List<List<Color?>> get guessedCodes => _guessedCodes;
  int get codeSize => _secretCode.length;
  int get numberOfGuessRow => _numberOfGuessRow.value;
  int get currentGuessRow => _currentGuessRow.value;

  void startNewGame() {
    _availableColors = [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.yellow,
      Colors.pink
    ];
    _guessedCodes = [];
    _numberOfGuessRow = 10.obs;
    _currentGuessRow = 0.obs;

    _secretCode = _generateSecretCode(4);
    _guessedCodes = List.generate(numberOfGuessRow, (_) {
      return RxList.generate(codeSize, (_) => null);
    });
  }

  void addMoreGuessRow(int value) {
    _numberOfGuessRow.value += value;
  }

  void guess(Color color, int position) {
    _guessedCodes[currentGuessRow][position] = color;
  }

  List<Color> _generateSecretCode(int size) {
    return List.generate(
      size,
      (index) => _availableColors[Random().nextInt(_availableColors.length)],
    );
  }
}
