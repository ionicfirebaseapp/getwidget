import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_avatar_shape.dart';
import 'package:ui_kit/size/gf_size.dart';

class GFAvatar extends StatelessWidget {
  /// Typically a [Text] widget. If the [CircleAvatar] is to have an image, use [backgroundImage] instead.
  final Widget child;

  /// The color with which to fill the circle.
  final Color backgroundColor;

  /// The default text color for text in the circle.
  final Color foregroundColor;

  /// The background image of the circle.
  final ImageProvider backgroundImage;

  /// The size of the avatar, expressed as the radius (half the diameter).
  final double radius;

  /// The minimum size of the avatar, expressed as the radius (half the diameter).
  final double minRadius;

  /// The maximum size of the avatar, expressed as the radius (half the diameter).
  final double maxRadius;

  /// size of avatar like [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final GFSize size;

  /// shape of avatar [GFAvatarShape] i.e, standard, pills, square
  final GFAvatarShape shape;

  /// border radius to give extra radius for avatar square or standard shape
  final BorderRadius borderRadius;

  // The default radius if nothing is specified.
  static const double _defaultRadius = 20.0;

  // The default radius if avater size GFSize.small selected.
  static const double _smallRadius = 16.0;

  // The default radius if avater size GFSize.large selected.
  static const double _largeRadius = 28.0;

  // The default min if only the max is specified.
  static const double _defaultMinRadius = 0.0;

  // The default max if only the min is specified.
  static const double _defaultMaxRadius = double.infinity;

  const GFAvatar(
      {Key key,
      this.child,
      this.backgroundColor,
      this.backgroundImage,
      this.foregroundColor,
      this.radius,
      this.minRadius,
      this.maxRadius,
      this.borderRadius,
      this.shape = GFAvatarShape.circle,
      this.size = GFSize.medium})
      : assert(radius == null || (minRadius == null && maxRadius == null)),
        super(key: key);

  double get _minDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      if (size == GFSize.medium) {
        return _defaultRadius * 2.0;
      } else if (size == GFSize.small) {
        return _smallRadius * 2.0;
      } else if (size == GFSize.large) {
        return _largeRadius * 2.0;
      } else {
        return _defaultRadius * 2.0;
      }
    } else {
      return 2.0 * (radius ?? minRadius ?? _defaultMinRadius);
    }
  }

  double get _maxDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      if (size == GFSize.medium) {
        return _defaultRadius * 2.0;
      } else if (size == GFSize.small) {
        return _smallRadius * 2.0;
      } else if (size == GFSize.large) {
        return _largeRadius * 2.0;
      } else {
        return _defaultRadius * 2.0;
      }
    } else {
      return 2.0 * (radius ?? maxRadius ?? _defaultMaxRadius);
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
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    TextStyle textStyle =
        theme.primaryTextTheme.subhead.copyWith(color: foregroundColor);
    Color effectiveBackgroundColor = backgroundColor;

    if (effectiveBackgroundColor == null) {
      switch (ThemeData.estimateBrightnessForColor(textStyle.color)) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    } else if (foregroundColor == null) {
      switch (ThemeData.estimateBrightnessForColor(backgroundColor)) {
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
            ? DecorationImage(image: backgroundImage, fit: BoxFit.cover)
            : null,
        shape: _avatarShape,
        borderRadius: shape == GFAvatarShape.standard && borderRadius == null
            ? BorderRadius.circular(10.0)
            : borderRadius,
      ),
      child: child == null
          ? null
          : Center(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: IconTheme(
                  data: theme.iconTheme.copyWith(color: textStyle.color),
                  child: DefaultTextStyle(
                    style: textStyle,
                    child: child,
                  ),
                ),
              ),
            ),
    );
  }
}
