import 'package:flutter/material.dart';

enum GFColor {
  primary,
  secondary,
  success,
  info,
  warning,
  danger,
  focus,
  alt,
  light,
  dark,
  white,
  transparent
}

class GFColors {
  static const Color PRIMARY = Color(0xff3880FF);
  static const Color SECONDARY = Color(0xffAA66CC);
  static const Color SUCCESS = Color(0xff10DC60);
  static const Color INFO = Color(0xff33B5E5);
  static const Color WARNING = Color(0xffFFBB33);
  static const Color DANGER = Color(0xffF04141);
  static const Color LIGHT = Color(0xffE0E0E0);
  static const Color DARK = Color(0xff222428);
  static const Color WHITE = Color(0xffffffff);
  static const Color FOCUS = Color(0xff434054);
  static const Color ALT = Color(0xff794c8a);
  static const Color TRANSPARENT = Colors.transparent;

  /// Pass [GFColor] or [Color]
  static Color getGFColor(dynamic color) {
    if (color is Color) {
      return color;
    } else {
      switch (color) {
        case GFColor.primary:
          return PRIMARY;
          break;
        case GFColor.secondary:
          return SECONDARY;
          break;
        case GFColor.success:
          return SUCCESS;
          break;
        case GFColor.warning:
          return WARNING;
          break;
        case GFColor.info:
          return INFO;
          break;
        case GFColor.danger:
          return DANGER;
          break;
        case GFColor.focus:
          return FOCUS;
          break;
        case GFColor.alt:
          return ALT;
          break;
        case GFColor.light:
          return LIGHT;
          break;
        case GFColor.dark:
          return DARK;
          break;
        case GFColor.white:
          return WHITE;
          break;
        case GFColor.transparent:
          return TRANSPARENT;
          break;
        default:
          return null;
          break;
      }
    }
  }
}
