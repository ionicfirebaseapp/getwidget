import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFBadge extends StatefulWidget {
  /// The border side for the button's [Material].
  final BorderSide border;

  /// Typically the counter button's shape.
  final ShapeBorder borderShape;

  /// Counter type of [GFShape] i.e, standard, pills, square,
  final GFShape shape;

  /// Pass [GFColor] or [Color]
  final dynamic color;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final GFSize size;

  /// text of type [String] is alternative to child. text will get priority over child
  final Widget child;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// text style of counter text
  final TextStyle textStyle;

  /// Pass [GFColor] or [Color]
  final dynamic textColor;

  /// Create badges of all types, check out [GFButtonBadge] for button badges and [GFIconBadge] for icon badges
  const GFBadge({
    Key key,
    this.textStyle,
    this.borderShape,
    this.shape = GFShape.standard,
    this.color = GFColor.secondary,
    this.textColor = GFColor.dark,
    this.size = GFSize.medium,
    this.border,
    this.text,
    this.child,
  })  : assert(shape != null, 'Counter shape can not be null'),
        super(key: key);

  @override
  _GFBadgeState createState() => _GFBadgeState();
}

class _GFBadgeState extends State<GFBadge> {
  Color color;
  Color textColor;
  Widget child;
  GFShape counterShape;
  GFSize size;
  double height;
  double width;
  double fontSize;

  @override
  void initState() {
    this.color = getGFColor(widget.color);
    this.textColor = getGFColor(widget.textColor);
    this.child = widget.child == null ? Text(widget.text) : widget.child;
    this.counterShape = widget.shape;
    this.size = widget.size;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BorderSide shapeBorder = widget.border != null
        ? widget.border
        : BorderSide(
            color: this.color,
            width: 0.0,
          );

    ShapeBorder shape;

    if (this.counterShape == GFShape.pills) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    } else if (this.counterShape == GFShape.square) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), side: shapeBorder);
    } else if (this.counterShape == GFShape.standard) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    } else if (this.counterShape == GFShape.circle) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0), side: shapeBorder);
    } else {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    }

    if (this.size == GFSize.small) {
      this.height = 18.0;
      this.width = 24.0;
      this.fontSize = 10.0;
    } else if (this.size == GFSize.medium) {
      this.height = 20.0;
      this.width = 26.0;
      this.fontSize = 12.0;
    } else if (this.size == GFSize.large) {
      this.height = 24.0;
      this.width = 30.0;
      this.fontSize = 12.0;
    } else {
      this.height = 20.0;
      this.width = 26.0;
      this.fontSize = 12.0;
    }

    return Container(
      height: this.height,
      width: this.counterShape == GFShape.circle ? this.height : this.width,
      child: Material(
        textStyle: this.textColor != null
            ? TextStyle(color: this.textColor, fontSize: this.fontSize)
            : widget.textStyle,
        shape: widget.borderShape == null ? shape : widget.borderShape,
        color: this.color,
        type: MaterialType.button,
        child: Container(
          child: Center(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: this.child,
          ),
        ),
      ),
    );
  }
}
