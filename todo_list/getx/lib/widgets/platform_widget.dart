// Read more: https://medium.com/flutter/do-flutter-apps-dream-of-platform-aware-widgets-7d7ed7b4624d

import 'dart:io' show Platform;

import 'package:flutter/material.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) return createIosWidget(context);
    return createAndroidWidget(context);
  }

  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);
}
