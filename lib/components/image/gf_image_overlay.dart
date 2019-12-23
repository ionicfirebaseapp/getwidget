import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GFImageOverlay extends StatelessWidget {

  const GFImageOverlay({
    Key key,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.margin,
    this.image,
    this.child,
    this.constraints,
    this.alignment,
    this.decoration,
    this.borderRadius,
    this.colorFilter,
    this.boxFit,
    this.border
  }) : super(key: key);

  /// define image's [double] height
  final double height;

  /// define image's [double] width
  final double width;

  /// The image background color.
  final Color color;

  /// The empty space that surrounds the card. Defines the image's outer [Container.margin].
  final EdgeInsetsGeometry margin;

  /// The empty space that surrounds the card. Defines the image's outer [Container.margin]..
  final EdgeInsetsGeometry padding;

  /// The [Image] widget used to display image
  final ImageProvider image;

  /// The [child] contained by the container, used to display text over image
  final Widget child;

  /// Align the [child] within the container.
  final AlignmentGeometry alignment;

  /// The decoration to paint behind the [child].
  final Decoration decoration;

  /// Additional constraints to apply to the child.
  final BoxConstraints constraints;

  final BoxFit boxFit;
  final ColorFilter colorFilter;
  final BorderRadius borderRadius;
  final Border border;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: new Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        child: child,
        decoration: new BoxDecoration(
          borderRadius: borderRadius,
          border: border,
//          backgroundBlendMode: BlendMode.darken,
          color: color,
          image: new DecorationImage(
            fit: boxFit,
            colorFilter: colorFilter,
            image: image
          ),
        ),
      ),
    );
  }
}



