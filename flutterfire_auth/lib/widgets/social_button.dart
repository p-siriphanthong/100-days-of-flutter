import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class SocialButton extends StatelessWidget {
  final ButtonType button;
  final void Function() onPressed;

  const SocialButton({
    Key? key,
    required this.button,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton.mini(
      buttonType: button,
      onPressed: onPressed,
    );
  }
}
