import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:brainstorming_board/widgets/platform_widget.dart';

class Button extends PlatformWidget<CupertinoButton, ElevatedButton> {
  final Widget child;
  final void Function()? onPressed;

  const Button({Key? key, required this.child, this.onPressed})
      : super(key: key);

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return new CupertinoButton.filled(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  ElevatedButton createAndroidWidget(BuildContext context) {
    return new ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
