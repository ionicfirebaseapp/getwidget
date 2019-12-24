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
    this.alignment,
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

  /// How the image should be inscribed into the box.
  /// The default is [BoxFit.scaleDown] if [centerSlice] is null, and
  /// [BoxFit.fill] if [centerSlice] is not null.
  final BoxFit boxFit;

  /// A color filter to apply to the image before painting it.
  final ColorFilter colorFilter;

  /// The corners of this [GFCard] are rounded by this [BorderRadius].
  final BorderRadiusGeometry borderRadius;

  /// A border to draw above the [GFCard].
  final Border border;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: alignment,
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      child: child,
      decoration: new BoxDecoration(
        borderRadius: borderRadius,
        border: border,
        color: color,
        image: new DecorationImage(
            fit: boxFit,
            colorFilter: colorFilter,
            image: image
        ),
      ),
    );
  }
}



