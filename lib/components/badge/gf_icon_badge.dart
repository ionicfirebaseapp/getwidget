import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/position/gf_position.dart';

class GFIconBadges extends StatefulWidget {
  /// Called when the badge is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// text of type [String] is alternative to child. text will get priority over child
  final Widget child;

  /// text of type [String] is alternative to child. text will get priority over child
  final Widget counterChild;

  /// The internal padding for the badge's [child].
  final EdgeInsetsGeometry padding;

  /// Create badges of all types, check out [GFBadge] for button badges and [GFIconBadge] for icon badges.
  const GFIconBadges({
    Key key,
    @required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    @required this.child,
    @required this.counterChild,
  })  : assert(padding != null),
        super(key: key);

  @override
  _GFIconBadgesState createState() => _GFIconBadgesState();
}

class _GFIconBadgesState extends State<GFIconBadges> {
  Color badgeColor, counterColor;
  Color textColor;
  Widget child;
  Widget icon;
  Function onPressed;
  GFType type;
  GFShape shape;
  GFPosition position;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      child: Stack(
        children: <Widget>[
          widget.child,
          new Positioned(
            top: 2,
            left: 22,
            child: widget.counterChild,
          ),
        ],
      ),
    );
  }
}
