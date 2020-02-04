import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class GFIconBadge extends StatefulWidget {
  /// Create badges of all types, check out [GFBadge] for button badges and [GFIconBadge] for icon badges.
  const GFIconBadge({
    Key key,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    @required this.child,
    @required this.counterChild,
  })  : assert(padding != null),
        super(key: key);

  /// child of type [Widget] is used to show icon.
  /// Use [GFIconButton] widget for compatibility.
  final Widget child;

  /// widget of type [Widget] is used to show counter to the top right corner of child.
  /// You can use [GFBadge] for compatibility.
  final Widget counterChild;

  /// The internal padding for the badge's [child].
  final EdgeInsetsGeometry padding;

  @override
  _GFIconBadgeState createState() => _GFIconBadgeState();
}

class _GFIconBadgeState extends State<GFIconBadge> {
  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        child: Stack(
          children: <Widget>[
            widget.child ?? Container(),
            Positioned(
              //  top: 2,
              //  left: 22,
              right: 0,
              child: widget.counterChild ?? Container(),
            ),
          ],
        ),
      );
}
