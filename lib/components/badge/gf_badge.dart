import 'package:flutter/material.dart';
import 'package:getflutter/shape/gf_badge_shape.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:getflutter/colors/gf_color.dart';

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
  final dynamic size;

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
  double size;
  double height;
  double width;
  double fontSize;

  @override
  void initState() {
    this.color = GFColors.getGFColor(widget.color);
    this.textColor = GFColors.getGFColor(widget.textColor);
    this.child = widget.text != null ? Text(widget.text ?? '') : widget.child;
    this.counterShape = widget.shape;
    this.size = GFSizesClass.getGFSize(widget.size);
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

    if (widget.size == GFSize.small) {
      this.height = this.size * 0.56;
      this.width = this.size * 0.73;
      this.fontSize = this.size * 0.31;
    } else if (widget.size == GFSize.medium) {
      this.height = this.size * 0.58;
      this.width = this.size * 0.76;
      this.fontSize = this.size * 0.34;
    } else if (widget.size == GFSize.large) {
      this.height = this.size * 0.6;
      this.width = this.size * 0.79;
      this.fontSize = this.size * 0.37;
    } else {
      this.height = this.size * 0.58;
      this.width = this.size * 0.76;
      this.fontSize = this.size * 0.34;
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
