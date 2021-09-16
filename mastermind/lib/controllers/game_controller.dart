import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  late List<Color> _secretCode;
  late List<Color> _availableColors;
  late List<GuessedCode> _guessedCodes;
  late Rx<int> _numberOfGuessRow;
  late Rx<int> _currentGuessRow;
  late Rx<int?> _focusedPosition;

  List<Color> get secretCode => _secretCode;
  List<Color> get availableColors => _availableColors;
  List<GuessedCode> get guessedCodes => _guessedCodes;
  int get codeSize => _secretCode.length;
  int get numberOfGuessRow => _numberOfGuessRow.value;
  int get currentGuessRow => _currentGuessRow.value;
  int? get focusedPosition => _focusedPosition.value;
  GuessedCode get _currentGuessCode => guessedCodes[currentGuessRow];

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
    _guessedCodes = RxList.generate(
      numberOfGuessRow,
      (row) => GuessedCode(codeSize: codeSize),
    );
  }

  void addMoreGuessRow(int value) {
    _numberOfGuessRow.value += value;
  }

  void updateFocusedPosition(int? position) {
    _focusedPosition.value = position;
  }

  void guess(Color color) {
    if (focusedPosition == null) return;

    _currentGuessCode.setColor(color: color, position: focusedPosition!);
    _focusedPosition.value = null;
  }

  void submitGuess() {
    if (!_currentGuessCode.submittable) return;

    final compareResult = _compareCode(secretCode, _currentGuessCode.colors);
    _currentGuessCode.submit(
      correctCount: compareResult[0],
      almostCorrectCount: compareResult[1],
    );
    _currentGuessRow.value += 1;
  }

  List<Color> _generateSecretCode(int size) {
    return List.generate(
      size,
      (index) => availableColors[Random().nextInt(availableColors.length)],
    );
  }

  List _compareCode(List<Color?> expected, List<Color?> actual) {
    List<Color?> cloneExpected = List.from(expected);
    List<Color?> cloneActual = List.from(actual);
    var correctCount = 0;
    var almostCorrectCount = 0;

    cloneActual.asMap().forEach((index, color) {
      if (color != null && cloneExpected[index] == color) {
        correctCount += 1;
        cloneExpected[index] = null;
        cloneActual[index] = null;
      }
    });

    cloneActual.asMap().forEach((index, color) {
      if (color != null && cloneExpected.contains(color)) {
        almostCorrectCount += 1;
        cloneExpected[cloneExpected.indexOf(color)] = null;
      }
    });

    return [correctCount, almostCorrectCount];
  }
}

class GuessedCode extends GetxController {
  final int codeSize;
  late RxList<Color?> _colors;
  late Rx<int> _correctCount = Rx<int>(0);
  late Rx<int> _almostCorrectCount = Rx<int>(0);
  late Rx<bool> _editable = Rx<bool>(true);

  GuessedCode({required this.codeSize}) {
    _colors = RxList.generate(codeSize, (index) => null);
  }

  List<Color?> get colors => _colors;
  int get correctCount => _correctCount.value;
  int get almostCorrectCount => _almostCorrectCount.value;
  bool get editable => _editable.value;
  bool get submittable => colors.every((color) => color != null);

  void setColor({Color? color, required int position}) {
    _colors[position] = color;
  }

  void submit({required int correctCount, required int almostCorrectCount}) {
    _correctCount.value = correctCount;
    _almostCorrectCount.value = almostCorrectCount;
    _editable.value = false;
  }
}
