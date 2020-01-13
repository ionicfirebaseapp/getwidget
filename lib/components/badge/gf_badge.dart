import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_badge_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFBadge extends StatefulWidget {
  /// The border side for the badge's [Material].
  final BorderSide border;

  /// Typically the counter badge's shape.
  final ShapeBorder borderShape;

  /// Counter type of [GFBadgeShape] i.e, standard, pills, square, circle
  final GFBadgeShape shape;

  /// Pass [GFColor] or [Color]
  final dynamic color;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final GFSize size;

  /// child of type [Widget] is alternative to child. text will get priority over child
  final Widget child;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// text style of counter text.
  final TextStyle textStyle;

  /// Pass [GFColor] or [Color]
  final dynamic textColor;

  /// Create badges of all types, check out [GFButtonBadge] for button badges and [GFIconBadge] for icon type badges
  const GFBadge({
    Key key,
    this.textStyle,
    this.borderShape,
    this.shape = GFBadgeShape.standard,
    this.color = GFColor.danger,
    this.textColor = GFColor.white,
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
  GFBadgeShape counterShape;
  GFSize size;
  double height;
  double width;
  double fontSize;

  @override
  void initState() {
    this.color = getGFColor(widget.color);
    this.textColor = getGFColor(widget.textColor);
    this.child = widget.text != null ? Text(widget.text ?? '') : widget.child;
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

    if (this.counterShape == GFBadgeShape.pills) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    } else if (this.counterShape == GFBadgeShape.square) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), side: shapeBorder);
    } else if (this.counterShape == GFBadgeShape.standard) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    } else if (this.counterShape == GFBadgeShape.circle) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0), side: shapeBorder);
    } else {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    }

    if (this.size == GFSize.small) {
      this.height = getGFSize(this.size) * 0.56;
      this.width = getGFSize(this.size) * 0.75;
      this.fontSize = getGFSize(this.size) * 0.31;
    } else if (this.size == GFSize.medium) {
      this.height = getGFSize(this.size) * 0.5;
      this.width = getGFSize(this.size) * 0.65;
      this.fontSize = getGFSize(this.size) * 0.3;
      this.fontSize = 12.0;
    } else if (this.size == GFSize.large) {
      this.height = getGFSize(this.size) * 0.428;
      this.width = getGFSize(this.size) * 0.535;
      this.fontSize = getGFSize(this.size) * 0.214;
    } else {
      this.height = getGFSize(this.size) * 0.56;
      this.width = getGFSize(this.size) * 0.75;
      this.fontSize = getGFSize(this.size) * 0.31;
    }

    return Container(
      height: this.height,
      width:
          this.counterShape == GFBadgeShape.circle ? this.height : this.width,
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
