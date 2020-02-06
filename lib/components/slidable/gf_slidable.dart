import 'package:flutter/material.dart';

class GFSlidable extends StatefulWidget {
  const GFSlidable({
    this.child,
  });

  /// defines main widget
  final Widget child;

  @override
  _GFSlidableState createState() => _GFSlidableState();
}

class _GFSlidableState extends State<GFSlidable> {
  @override
  Widget build(BuildContext context) =>
      Container(
        child: widget.child,
      );
}
