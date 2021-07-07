import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIconBadge extends StatefulWidget {
  /// Create badges of all types, check out [GFBadge] for button badges and [GFIconBadge] for icon badges.
  const GFIconBadge(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 8),
      required this.child,
      required this.counterChild,
      this.position})
      : super(key: key);

  /// child of type [Widget] is used to show icon.
  /// Use [GFIconButton] widget for compatibility.
  final Widget child;

  /// widget of type [Widget] is used to show counter to the top right corner of child.
  /// You can use [GFBadge] for compatibility.
  final Widget counterChild;

  /// The internal padding for the badge's [child].
  final EdgeInsetsGeometry padding;

  /// defines the position of [GFBadge].
  final GFBadgePosition? position;

  @override
  _GFIconBadgeState createState() => _GFIconBadgeState();
}



class _GFIconBadgeState extends State<GFIconBadge> {
  @override
  Widget build(BuildContext context) => Container(
      padding: widget.padding,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          widget.child,
          widget.position == null
              ? PositionedDirectional(
                  top: GFBadgePosition.topEnd().top,
                  end: GFBadgePosition.topEnd().end,
                  child: widget.counterChild,
                )
              : PositionedDirectional(
                  top: widget.position!.top,
                  end: widget.position!.end,
                  bottom: widget.position!.bottom,
                  start: widget.position!.start,
                  child: widget.counterChild,
                )
        ],
      ));
}
