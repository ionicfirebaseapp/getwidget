import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFSocialButton extends GFButton {
  /// Create buttons of all types. check out [GFIconButton] for icon buttons, and [GFBadge] for badges
  const GFSocialButton({
    Key? key,
    required this.onPressed,
    this.onHighlightChanged,
    this.textStyle,
    this.boxShadow,
    this.buttonBoxShadow,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 0.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 1.0,
    this.disabledElevation = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.constraints,
    this.borderShape,
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    MaterialTapTargetSize? materialTapTargetSize,
    this.child,
    this.type = GFButtonType.solid,
    this.shape = GFButtonShape.standard,
    this.color = GFColors.PRIMARY,
    this.textColor,
    this.position = GFPosition.start,
    this.size = GFSize.MEDIUM,
    this.borderSide,
    this.text,
    this.icon,
    this.blockButton,
    this.fullWidthButton,
    this.colorScheme,
    this.enableFeedback,
    this.onLongPress,
    this.disabledColor,
    this.disabledTextColor,
  })  : materialTapTargetSize =
            materialTapTargetSize ?? MaterialTapTargetSize.padded,
        // assert(elevation != null && elevation >= 0.0),
        assert(focusElevation >= 0.0),
        assert(hoverElevation >= 0.0),
        assert(highlightElevation >= 0.0),
        assert(disabledElevation >= 0.0),
        super(
          key: key,
          onPressed: onPressed,
        );

  /// Called when the button is tapped or otherwise activated.
  @override
  final VoidCallback? onPressed;

  /// Called by the underlying [InkWell] widget's InkWell.onHighlightChanged callback.
  @override
  final ValueChanged<bool>? onHighlightChanged;

  /// Defines the default text style, with [Material.textStyle], for the button's [child].
  @override
  final TextStyle? textStyle;

  /// The border side for the button's [Material].
  @override
  final BorderSide? borderSide;

  /// The box shadow for the button's [Material], if GFButtonType is solid
  @override
  final BoxShadow? boxShadow;

  /// Pass [GFColors] or [Color]. The color for the button's [Material] when it has the input focus.
  @override
  final Color? focusColor;

  /// Pass [GFColors] or [Color]. The color for the button's [Material] when a pointer is hovering over it.
  @override
  final Color? hoverColor;

  /// Pass [GFColors] or [Color]. The highlight color for the button's [InkWell].
  @override
  final Color? highlightColor;

  /// Pass [GFColors] or [Color]. The splash color for the button's [InkWell].
  @override
  final Color? splashColor;

  /// The elevation for the button's [Material] when the button is [enabled] but not pressed.
  @override
  final double elevation;

  /// The elevation for the button's [Material] when the button is [enabled] and a pointer is hovering over it.
  @override
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button is [enabled] and has the input focus.
  @override
  final double focusElevation;

  /// The elevation for the button's [Material] when the button is [enabled] and pressed.
  @override
  final double highlightElevation;

  /// The elevation for the button's [Material] when the button is not [enabled].
  @override
  final double disabledElevation;

  /// The internal padding for the button's [child].
  @override
  final EdgeInsetsGeometry padding;

  /// Defines the button's size.
  @override
  final BoxConstraints? constraints;

  /// The shape of the button's [Material].
  @override
  final ShapeBorder? borderShape;

  /// Defines the duration of animated changes for [shape] and [elevation].
  @override
  final Duration animationDuration;

  /// Typically the button's label.
  @override
  final Widget? child;

  /// Whether the button is enabled or disabled.
  @override
  bool get enabled => onPressed != null;

  /// Configures the minimum size of the tap target.
  @override
  final MaterialTapTargetSize materialTapTargetSize;

  /// {@macro flutter.widgets.Focus.focusNode}
  @override
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  @override
  final bool autofocus;

  /// {@macro flutter.widgets.Clip}
  @override
  final Clip clipBehavior;

  /// Button type of [GFButtonType] i.e, solid, outline, outline2x, transparent
  @override
  final GFButtonType type;

  /// Button type of GFSocialButtonShape i.e, standard, pills, square, shadow, icons
  @override
  final GFButtonShape shape;

  /// Pass [GFColors] or [Color]
  @override
  final Color color;

  /// The fill color of the button when the button is disabled.
  ///
  /// The default value of this color is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// See also:
  ///
  ///  * [color] - the fill color of the button when the button is [enabled].

  @override
  final Color? disabledColor;

  /// Pass [GFColors] or [Color]
  @override
  final Color? textColor;

  /// The color to use for this button's text when the button is disabled.
  ///
  /// The button's [Material.textStyle] will be the current theme's button
  /// text style, [ThemeData.textTheme.button], configured with this color.
  ///
  /// The default value is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// If [textColor] is a [MaterialStateProperty<Color>], [disabledTextColor]
  /// will be ignored.
  ///
  /// See also:
  ///
  ///  * [textColor] - The color to use for this button's text when the button is [enabled].
  @override
  final Color? disabledTextColor;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  @override
  final double size;

  /// text of type [String] is alternative to child. text will get priority over child
  @override
  final String? text;

  /// icon of type [Widget]
  @override
  final Widget? icon;

  /// icon type of [GFPosition] i.e, start, end
  @override
  final GFPosition position;

  /// on true state blockButton gives block size button
  @override
  final bool? blockButton;

  /// on true state full width Button gives full width button
  @override
  final bool? fullWidthButton;

  /// on true state default box shadow appears around button, if GFButtonType is solid
  @override
  final bool? buttonBoxShadow;

  /// A set of thirteen colors that can be used to derive the button theme's
  /// colors.
  ///
  /// This property was added much later than the theme's set of highly
  /// specific colors, like [ThemeData.buttonColor], [ThemeData.highlightColor],
  /// [ThemeData.splashColor] etc.
  ///
  /// The colors for new button classes can be defined exclusively in terms
  /// of [colorScheme]. When it's possible, the existing buttons will
  /// (continue to) gradually migrate to it.
  @override
  final ColorScheme? colorScheme;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  @override
  final bool? enableFeedback;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  @override
  final VoidCallback? onLongPress;

  Widget build(BuildContext context) => GFButton(
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textStyle: textStyle,
        boxShadow: boxShadow,
        buttonBoxShadow: buttonBoxShadow,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        elevation: elevation,
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        constraints: constraints,
        borderShape: borderShape,
        animationDuration: animationDuration,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        child: child,
        type: GFButtonType.solid,
        shape: GFButtonShape.standard,
        color: GFColors.PRIMARY,
        textColor: textColor,
        position: GFPosition.start,
        size: size,
        borderSide: borderSide,
        text: text,
        icon: icon,
        blockButton: blockButton,
        fullWidthButton: fullWidthButton,
        disabledColor: disabledTextColor,
        disabledTextColor: disabledColor,
      );
}
