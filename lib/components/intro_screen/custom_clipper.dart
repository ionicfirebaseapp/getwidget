import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Rect> {
  MyCustomClipper({this.alignment = Alignment.topLeft});

  final Alignment alignment;

  @override
  Rect getClip(Size size) {
    final Rect rect = alignment == Alignment.topLeft
        ? Rect.fromLTRB(-size.width, -size.height, size.width, size.height)
        : alignment == Alignment.topRight
            ? Rect.fromLTRB(-size.height, -size.width, size.width, size.height)
            : alignment == Alignment.topCenter
                ? Rect.fromLTRB(-size.width, -size.height, -size.width, 0)
                : alignment == Alignment.bottomLeft
                    ? Rect.fromLTRB(0, -size.height, size.width, size.height)
                    : alignment == Alignment.bottomCenter
                        ? Rect.fromLTRB(
                            0, -size.height, size.width, size.height)
                        : Rect.fromLTRB(
                            0, -size.height, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
