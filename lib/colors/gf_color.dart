import 'package:flutter/material.dart';

class GFColors {
  // Basic Theme Colors
  static const Color PRIMARY = Color(0xff3880FF);
  static const Color SECONDARY = Color(0xffAA66CC);
  static const Color SUCCESS = Color(0xff10DC60);
  static const Color INFO = Color(0xff33B5E5);
  static const Color WARNING = Color(0xffFFBB33);
  static const Color DANGER = Color(0xffF04141);

  // Light and Dark Variants
  static const Color LIGHT = Color(0xffE0E0E0);
  static const Color DARK = Color(0xff222428);
  static const Color WHITE = Color(0xffffffff);
  static const Color BLACK = Color(0xff000000);

  // Utility & Brand Colors
  static const Color FOCUS = Color(0xff434054);
  static const Color ALT = Color(0xff794c8a);
  static const Color DISABLED = Color(0xffBDBDBD);
  static const Color BACKGROUND = Color(0xffF4F5F8);
  static const Color TRANSPARENT = Colors.transparent;

  // Extended Color Palette
  static const Color NEUTRAL = Color(0xff9E9E9E);
  static const Color MUTED = Color(0xff757575);
  static const Color BRAND = Color(0xff6200EE); // GF branding support

  // MaterialColor Swatches for ThemeData.primarySwatch
  static const MaterialColor PRIMARY_SWATCH = MaterialColor(
    0xff3880FF,
    <int, Color>{
      50: Color(0xffe3f2fd),
      100: Color(0xffbbdefb),
      200: Color(0xff90caf9),
      300: Color(0xff64b5f6),
      400: Color(0xff42a5f5),
      500: Color(0xff2196f3),
      600: Color(0xff1e88e5),
      700: Color(0xff1976d2),
      800: Color(0xff1565c0),
      900: Color(0xff0d47a1),
    },
  );

  static const MaterialColor SUCCESS_SWATCH = MaterialColor(
    0xff10DC60,
    <int, Color>{
      50: Color(0xffe6f7f0),
      100: Color(0xffc0edd9),
      200: Color(0xff99e2c2),
      300: Color(0xff73d7aa),
      400: Color(0xff4ccf93),
      500: Color(0xff26c47b),
      600: Color(0xff20a369),
      700: Color(0xff1a8257),
      800: Color(0xff146145),
      900: Color(0xff0e4033),
    },
  );

  static const MaterialColor DANGER_SWATCH = MaterialColor(
    0xffF04141,
    <int, Color>{
      50: Color(0xfffdeaea),
      100: Color(0xfff8bdbd),
      200: Color(0xfff28f8f),
      300: Color(0xffec6161),
      400: Color(0xffe73333),
      500: Color(0xffe10505),
      600: Color(0xffb90404),
      700: Color(0xff910303),
      800: Color(0xff690202),
      900: Color(0xff410101),
    },
  );
}
