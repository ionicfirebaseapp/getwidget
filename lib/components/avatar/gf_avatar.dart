import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFAvatar extends StatelessWidget {
  /// Create Avatar of all types i,e, square, circle, standard with different sizes.
  const GFAvatar(
      {Key? key,
      this.child,
      this.backgroundColor,
      this.backgroundImage,
      this.foregroundColor,
      this.radius,
      this.minRadius,
      this.maxRadius,
      this.borderRadius,
      this.shape = GFAvatarShape.circle,
      this.size = GFSize.MEDIUM})
      : assert(radius == null || (minRadius == null && maxRadius == null)),
        super(key: key);

  /// Typically a [Text] widget. If the [CircleAvatar] is to have an image, use [backgroundImage] instead.
  final Widget? child;

  /// use [Color] or [GFColors]. The color with which to fill the circle.
  final Color? backgroundColor;

  /// use [Color] or [GFColors]. The default text color for text in the circle.
  final Color? foregroundColor;

  /// The background image of the circle.
  final ImageProvider? backgroundImage;

  /// The size of the avatar, expressed as the radius (half the diameter).
  final double? radius;

  /// The minimum size of the avatar, expressed as the radius (half the diameter).
  final double? minRadius;

  /// The maximum size of the avatar, expressed as the radius (half the diameter).
  final double? maxRadius;

  /// size of avatar. use [GFSize] or [double] i.e, 1.2, small, medium, large etc.
  final double size;

  /// shape of avatar [GFAvatarShape] i.e, standard, circle, square
  final GFAvatarShape shape;

  /// border radius to give extra radius for avatar square or standard shape
  /// Not applicable to circleshape
  final BorderRadius? borderRadius;

  // /// The default max if only the min is specified.
  // static const double _defaultMaxRadius = double.infinity;

  double get _minDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return 1.5 * size;
    } else {
      return 2.0 * (radius ?? minRadius ?? 0);
    }
  }

  double get _maxDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return 1.5 * size;
    } else {
      return 2.0 * (radius ?? maxRadius ?? 0);
    }
  }

  BoxShape get _avatarShape {
    if (shape == GFAvatarShape.circle) {
      return BoxShape.circle;
    } else if (shape == GFAvatarShape.square) {
      return BoxShape.rectangle;
    } else if (shape == GFAvatarShape.standard) {
      return BoxShape.rectangle;
    } else {
      return BoxShape.rectangle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor = this.backgroundColor;
    final Color? foregroundColor = this.foregroundColor;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    TextStyle? textStyle = theme.primaryTextTheme.titleMedium?.copyWith(
      color: foregroundColor,
    );
    Color? effectiveBackgroundColor = backgroundColor;

    if (effectiveBackgroundColor == null && textStyle?.color != null) {
      switch (ThemeData.estimateBrightnessForColor(textStyle!.color!)) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    } else if (foregroundColor == null && textStyle != null) {
      switch (ThemeData.estimateBrightnessForColor(backgroundColor!)) {
        case Brightness.dark:
          textStyle = textStyle.copyWith(color: theme.primaryColorLight);
          break;
        case Brightness.light:
          textStyle = textStyle.copyWith(color: theme.primaryColorDark);
          break;
      }
    }
    final double minDiameter = _minDiameter;
    final double maxDiameter = _maxDiameter;
    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                fit: BoxFit.cover,
              )
            : null,
        shape: _avatarShape,
        borderRadius: shape == GFAvatarShape.standard && borderRadius == null
            ? BorderRadius.circular(10)
            : borderRadius,
      ),
      child: child == null && textStyle != null
          ? null
          : Center(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: IconTheme(
                  data: theme.iconTheme.copyWith(color: textStyle?.color),
                  child: DefaultTextStyle(
                    style: textStyle!,
                    child: child!,
                  ),
                ),
              ),
            ),
    );
  }
}
