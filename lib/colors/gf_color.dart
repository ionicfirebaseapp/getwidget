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

const PRIMARY = Color(0xff3880FF);
const SECONDARY = Color(0xffAA66CC);
const SUCCESS = Color(0xff10DC60);
const INFO = Color(0xff33B5E5);
const WARNING = Color(0xffFFBB33);
const DANGER = Color(0xffF04141);
const LIGHT = Color(0xffE0E0E0);
const DARK = Color(0xff222428);
const WHITE = Color(0xffffffff);
const FOCUS = Color(0xff434054);
const ALT = Color(0xff794c8a);
const TRANSPARENT = Colors.transparent;

/// Pass [GFColor] or [Color]
Color getGFColor(dynamic color) {
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
