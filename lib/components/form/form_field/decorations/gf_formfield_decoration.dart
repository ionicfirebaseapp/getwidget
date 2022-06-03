import 'package:flutter/material.dart';
import 'package:getwidget/shape/gf_textfield_shape.dart';

class GfFormFieldDecoration extends InputDecoration {
  const GfFormFieldDecoration(
      {required this.context,
      required this.shape,
      required this.bgfilled,
      this.bgcolor,
      this.editingBorderColor,
      this.idleBorderColor,
      this.borderRadius,
      this.textColor,
      this.radius,
      this.borderWidth,
      this.gfprefixIcon,
      this.hinttext,
      this.fieldPadding});

  final Color? editingBorderColor;
  final Color? textColor;
  final double? radius;
  final GFTextFieldShape shape;
  final Color? idleBorderColor;
  final BuildContext context;
  final double? borderWidth;
  final Widget? gfprefixIcon;
  final double? borderRadius;
  final String? hinttext;
  final bool bgfilled;
  final Color? bgcolor;
  final EdgeInsets? fieldPadding;

  @override
  InputBorder get errorBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red.shade800,
          width: borderWidth ?? 0,
        ),
        borderRadius: getradius(shape),
      );

  @override
  InputBorder get focusedErrorBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: borderWidth ?? 0,
        ),
        borderRadius: getradius(shape),
      );
  @override
  InputBorder get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: editingBorderColor ?? Theme.of(context).primaryColor,
          width: borderWidth ?? 0,
        ),
        borderRadius: getradius(shape),
      );

  @override
  InputBorder get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: editingBorderColor ?? Theme.of(context).primaryColor,
          width: borderWidth ?? 0,
        ),
        borderRadius: getradius(shape),
      );
  @override
  InputBorder get border => OutlineInputBorder(
        borderSide: BorderSide(
          color: editingBorderColor ?? Theme.of(context).primaryColor,
          width: borderWidth ?? 0,
        ),
        borderRadius: getradius(shape),
      );
  @override
  InputBorder get disabledBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: editingBorderColor ?? Theme.of(context).primaryColor,
          width: borderWidth ?? 0,
        ),
        borderRadius: getradius(shape),
      );

  @override
  Widget? get prefixIcon => gfprefixIcon;

  @override
  String? get hintText => hinttext;

  @override
  bool get filled => bgfilled;

  @override
  Color? get fillColor => bgcolor;

  @override
  EdgeInsets get contentPadding =>
      fieldPadding ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 4);

  BorderRadius getradius(GFTextFieldShape shape) {
    double radius = 0;
    switch (shape) {
      case GFTextFieldShape.pills:
        radius = 50;
        break;
      case GFTextFieldShape.roundedsquare:
        radius = borderRadius ?? 0;
        break;
      case GFTextFieldShape.square:
        radius = 0;
        break;
    }
    return BorderRadius.circular(radius);
  }
}
