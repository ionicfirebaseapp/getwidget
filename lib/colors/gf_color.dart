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
}

const PRIMARY = Colors.blue;
const SECONDARY = Colors.grey;
const SUCCESS = Colors.green;
const INFO = Colors.yellow;
const WARNING = Colors.lightBlueAccent;
const DANGER = Colors.red;
const FOCUS = Colors.black38;
const ALT = Colors.purple;
const LIGHT = Colors.white30;
const DARK = Colors.black;
const WHITE = Colors.white;

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
      default:
        return PRIMARY;
        break;
    }
  }
}
