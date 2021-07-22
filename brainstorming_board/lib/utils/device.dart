import 'package:flutter/material.dart';

String deviceType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 768) return 'mobile';
  if (width <= 1024) return 'tablet';
  return 'desktop';
}

bool isMobile(BuildContext context) {
  return deviceType(context) == 'mobile';
}

bool isTablet(BuildContext context) {
  return deviceType(context) == 'tablet';
}

bool isDesktop(BuildContext context) {
  return deviceType(context) == 'desktop';
}
