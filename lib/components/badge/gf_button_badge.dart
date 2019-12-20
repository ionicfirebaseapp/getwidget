import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/button/gf_button.dart';

class GFButtonBadge extends StatefulWidget {
  /// Called when the badge is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// Defines the default text style, with [Material.textStyle], for the button's [child].
  final TextStyle textStyle;

  /// The border side for the badge's [Material].
  final BorderSide borderSide;

  /// The internal padding for the badge's [child].
  final EdgeInsetsGeometry padding;

  /// The shape of the badge's [Material].
  final ShapeBorder borderShape;

  /// Badge type of [GFType] i.e, solid, outline, transparent
  final GFType type;

  /// Badge type of [GFShape] i.e, standard, pills, square
  final GFShape shape;

  /// Pass [GFColor] or [Color]
  final dynamic color;

  /// Pass [GFColor] or [Color]
  final dynamic textColor;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final dynamic size;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// text of type [String] is alternative to child. text will get priority over child
  final Widget counterChild;

  /// icon type of [GFPosition] i.e, start, end
  final GFPosition position;

  /// Create badges of all types. check out [GFIconBadge] for icon badges and [GFBadge] for default badges.
  const GFButtonBadge({
    Key key,
    @required this.onPressed,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.borderShape,
    this.type = GFType.solid,
    this.shape = GFShape.standard,
    this.color = GFColor.primary,
    this.textColor = GFColor.dark,
    this.position = GFPosition.end,
    this.size = GFSize.medium,
    this.borderSide,
    @required this.text,
    @required this.counterChild,
  })  : assert(shape != null, 'Badge shape can not be null'),
        assert(padding != null),
        super(key: key);

  @override
  _GFButtonBadgeState createState() => _GFButtonBadgeState();
}

class _GFButtonBadgeState extends State<GFButtonBadge> {
  Color color;
  Color textColor;
  Widget child;
  Widget icon;
  Function onPressed;
  GFType type;
  GFShape shape;
  double size;
  GFPosition position;

  @override
  void initState() {
    this.color = getGFColor(widget.color);
    this.textColor = getGFColor(widget.textColor);
    this.onPressed = widget.onPressed;
    this.type = widget.type;
    this.shape = widget.shape;
    this.size = getGFSize(widget.size);
    this.position = widget.position;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 26.0, minWidth: 98.0),
      child: Container(
        height: this.size,
        child: GFButton(
            textStyle: widget.textStyle,
            borderSide: widget.borderSide,
            color: this.color,
            textColor: this.textColor,
            text: widget.text,
            onPressed: this.onPressed,
            type: this.type,
            shape: this.shape,
            position: this.position,
            size: this.size,
            borderShape: widget.borderShape,
            icon: widget.counterChild),
      ),
    );
  }
}
