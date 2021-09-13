import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  late List<Color> _secretCode;
  late List<Color> _availableColors;
  late List<RxList<Color?>> _guessedCodes;
  late Rx<int> _numberOfGuessRow;
  late Rx<int> _currentGuessRow;
  late Rx<int?> _focusedPosition;

  List<Color> get secretCode => _secretCode;
  List<Color> get availableColors => _availableColors;
  List<List<Color?>> get guessedCodes => _guessedCodes;
  int get codeSize => _secretCode.length;
  int get numberOfGuessRow => _numberOfGuessRow.value;
  int get currentGuessRow => _currentGuessRow.value;
  int? get focusedPosition => _focusedPosition.value;

  void startNewGame() {
    _availableColors = [
      Color(0xFFC74A4A),
      Color(0xFFD67F36),
      Color(0xFFEBC55F),
      Color(0xFF71C97B),
      Color(0xFF67C3CB),
      Color(0xFF4949D3),
    ];
    _numberOfGuessRow = Rx<int>(10);
    _currentGuessRow = Rx<int>(0);
    _focusedPosition = Rx<int?>(null);

    _secretCode = _generateSecretCode(4);
    _guessedCodes = List.generate(numberOfGuessRow, (row) {
      return RxList.generate(codeSize, (position) => null);
    });
  }

  void addMoreGuessRow(int value) {
    _numberOfGuessRow.value += value;
  }

  void updateFocusedPosition(int? position) {
    _focusedPosition.value = position;
  }

  void guess(Color color) {
    if (focusedPosition == null) return;

    _guessedCodes[currentGuessRow][focusedPosition!] = color;
    _focusedPosition.value = null;
  }

  List<Color> _generateSecretCode(int size) {
    return List.generate(
      size,
      (index) => availableColors[Random().nextInt(availableColors.length)],
    );
  }
}
