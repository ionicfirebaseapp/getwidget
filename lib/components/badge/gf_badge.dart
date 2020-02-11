import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class GFBadge extends StatefulWidget {
  /// Create badges of all types, check out [GFButtonBadge] for button badges and [GFIconBadge] for icon type badges
  const GFBadge({
    Key key,
    this.textStyle,
    this.borderShape,
    this.shape = GFBadgeShape.standard,
    this.color = GFColors.DANGER,
    this.textColor = GFColors.WHITE,
    this.size = GFSize.SMALL,
    this.border,
    this.text,
    this.child,
  })  : assert(shape != null, 'Counter shape can not be null'),
        super(key: key);

  /// The border side for the badge's [Material].
  final BorderSide border;

  /// Typically the counter badge's shape.
  final ShapeBorder borderShape;

  /// Counter type of [GFBadgeShape] i.e, standard, pills, square, circle
  final GFBadgeShape shape;

  /// Pass [GFColors] or [Color]
  final Color color;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final double size;

  /// child of type [Widget] is alternative to child. text will get priority over child
  final Widget child;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// text style of counter text.
  final TextStyle textStyle;

  /// Pass [GFColors] or [Color]
  final Color textColor;

  @override
  _GFBadgeState createState() => _GFBadgeState();
}

class _GFBadgeState extends State<GFBadge> {
  Color color;
  Color textColor;
  Widget child;
  GFBadgeShape counterShape;
  double size;
  double height;
  double width;
  double fontSize;

  @override
  void initState() {
    color = widget.color;
    textColor = widget.textColor;
    child = widget.text != null ? Text(widget.text ?? '') : widget.child;
    counterShape = widget.shape;
    size = widget.size;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BorderSide shapeBorder = widget.border != null
        ? widget.border
        : BorderSide(
            color: color,
            width: 0,
          );

    ShapeBorder shape;

    if (counterShape == GFBadgeShape.pills) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: shapeBorder,
      );
    } else if (counterShape == GFBadgeShape.square) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: shapeBorder,
      );
    } else if (counterShape == GFBadgeShape.standard) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: shapeBorder,
      );
    } else if (counterShape == GFBadgeShape.circle) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: shapeBorder,
      );
    } else {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: shapeBorder,
      );
    }

    if (widget.size == GFSize.SMALL) {
      height = size * 0.56;
      width = size * 0.73;
      fontSize = size * 0.31;
    } else if (widget.size == GFSize.MEDIUM) {
      height = size * 0.58;
      width = size * 0.76;
      fontSize = size * 0.34;
    } else if (widget.size == GFSize.LARGE) {
      height = size * 0.6;
      width = size * 0.79;
      fontSize = size * 0.37;
    } else {
      height = size * 0.58;
      width = size * 0.76;
      fontSize = size * 0.34;
    }

    return Container(
      height: height,
      width: counterShape == GFBadgeShape.circle ? height : width,
      child: Material(
        textStyle: textColor != null
            ? TextStyle(
                color: textColor,
                fontSize: fontSize,
              )
            : widget.textStyle,
        shape: widget.borderShape ?? shape,
        color: color,
        type: MaterialType.button,
        child: Container(
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: child,
          ),
        ),
      ),
    );
  }
}
