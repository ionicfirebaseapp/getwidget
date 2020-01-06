import 'package:flutter/material.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';

class GFIconBadge extends StatefulWidget {
  /// Called when the badge is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// child of type [GFIconButton] is used to show icon.
  /// Use [Icon] widget for compatibility.
  final GFIconButton child;

  /// widget of type [Widget] is used to show counter to the top right corner of child.
  /// You can use [GFBadge] for compatibility.
  final Widget counterChild;

  /// The internal padding for the badge's [child].
  final EdgeInsetsGeometry padding;

  /// Create badges of all types, check out [GFBadge] for button badges and [GFIconBadge] for icon badges.
  const GFIconBadge({
    Key key,
    @required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    @required this.child,
    @required this.counterChild,
  })  : assert(padding != null),
        super(key: key);

  @override
  _GFIconBadgeState createState() => _GFIconBadgeState();
}

class _GFIconBadgeState extends State<GFIconBadge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      padding: widget.padding,
      child: Stack(
        children: <Widget>[
          widget.child ?? Container(),
          new Positioned(
            top: 2,
            left: 22,
            child: widget.counterChild ?? Container(),
          ),
        ],
      ),
    );
  }
}
