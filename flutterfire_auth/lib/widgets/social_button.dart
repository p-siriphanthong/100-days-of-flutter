import 'package:flutter/material.dart';

enum SocialBrand { google, facebook, twitter, line }

const SocialBrandImage = {
  SocialBrand.google: 'assets/images/google.png',
  SocialBrand.facebook: 'assets/images/facebook.png',
  SocialBrand.twitter: 'assets/images/twitter.png',
  SocialBrand.line: 'assets/images/line.png',
};

class SocialButton extends StatelessWidget {
  final SocialBrand button;
  final void Function() onPressed;

  const SocialButton({
    Key? key,
    required this.button,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onPressed,
        child: Image(
          image: AssetImage(SocialBrandImage[button]!),
          height: 40,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
