import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Rect> {
  MyCustomClipper({this.alignment = Alignment.topLeft});

  final Alignment alignment;

  @override
  Rect getClip(Size size) {
    final Rect rect = alignment == Alignment.topLeft
        ? Rect.fromLTRB(-size.width, -size.height, size.width, size.height)
        : alignment == Alignment.topCenter
            ? Rect.fromLTRB(0, -size.height, size.width, size.height)
            : alignment == Alignment.topRight
                ? Rect.fromLTRB(0, -size.height, size.height, size.height)
                : alignment == Alignment.bottomLeft
                    ? Rect.fromLTRB(
                        -size.width, -size.height, size.width, size.height)
                    : alignment == Alignment.bottomCenter
                        ? Rect.fromLTRB(
                            0, -size.height, size.width, size.height)
                        : alignment == Alignment.bottomRight
                            ? Rect.fromLTRB(
                                0, -size.width, size.height, size.height)
                            : Rect.fromLTRB(
                                0, -size.height, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
