import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFButtonBadge extends GFButton {

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged] callback.
  final ValueChanged<bool> onHighlightChanged;

  /// Defines the default text style, with [Material.textStyle], for the button's [child].
  final TextStyle textStyle;

  /// The border side for the button's [Material].
  final BorderSide borderSide;

  /// The box shadow for the button's [Material].
  final BoxShadow boxShadow;

  /// Pass [GFColor] or [Color]. The color for the button's [Material] when it has the input focus.
  final dynamic focusColor;

  /// Pass [GFColor] or [Color]. The color for the button's [Material] when a pointer is hovering over it.
  final dynamic hoverColor;

  /// Pass [GFColor] or [Color]. The highlight color for the button's [InkWell].
  final dynamic highlightColor;

  /// Pass [GFColor] or [Color]. The splash color for the button's [InkWell].
  final dynamic splashColor;

  /// The elevation for the button's [Material] when the button is [enabled] but not pressed.
  final double elevation;

  /// The elevation for the button's [Material] when the button is [enabled] and a pointer is hovering over it.
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button is [enabled] and has the input focus.
  final double focusElevation;

  /// The elevation for the button's [Material] when the button is [enabled] and pressed.
  final double highlightElevation;

  /// The elevation for the button's [Material] when the button is not [enabled].
  final double disabledElevation;

  /// The internal padding for the button's [child].
  final EdgeInsetsGeometry padding;

  /// Defines the button's size.
  final BoxConstraints constraints;

  /// The shape of the button's [Material].
  final ShapeBorder borderShape;

  /// Defines the duration of animated changes for [shape] and [elevation].
  final Duration animationDuration;

  /// Whether the button is enabled or disabled.
  bool get enabled => onPressed != null;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize materialTapTargetSize;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  /// Button type of [GFType] i.e, solid, outline, outline2x, transparent
  final GFType type;

  /// Button type of [GFButtonBadgeShape] i.e, standard, pills, square, shadow, icons
  final GFButtonShape shape;

  /// Pass [GFColor] or [Color]
  final dynamic color;

  /// The fill color of the button when the button is disabled.
  ///
  /// The default value of this color is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// See also:
  ///
  ///  * [color] - the fill color of the button when the button is [enabled].
  final dynamic disabledColor;

  /// Pass [GFColor] or [Color]
  final dynamic textColor;

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
  final dynamic disabledTextColor;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final dynamic size;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// icon type of [GFIconPosition] i.e, start, end
  final GFPosition position;

  /// on true state blockButton gives block size button
  final bool blockButton;

  /// on true state full width Button gives full width button
  final bool fullWidthButton;

  /// on true state default box shadow appears around button
  final bool buttonBoxShadow;

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
  final ColorScheme colorScheme;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback onLongPress;

  /// Can be used to display [GFCounter], [Icons] inside button design
  final Widget icon;

  /// Create buttons badges of all types. check out [GFIconButton] for icon buttons, and [GFBadge] for badges
  const GFButtonBadge(
      {Key key,
        @required this.onPressed,
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
        this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
        this.constraints,
        this.borderShape,
        this.animationDuration = kThemeChangeDuration,
        this.clipBehavior = Clip.none,
        this.focusNode,
        this.autofocus = false,
        MaterialTapTargetSize materialTapTargetSize,
        this.type = GFType.solid,
        this.shape = GFButtonShape.standard,
        this.color = GFColor.primary,
        this.textColor,
        this.position = GFPosition.end,
        this.size = GFSize.medium,
        this.borderSide,
        this.text,
        this.blockButton,
        this.fullWidthButton,
        this.colorScheme,
        this.enableFeedback,
        this.onLongPress,
        this.disabledColor,
        this.disabledTextColor,
        this.icon,
      })
      : materialTapTargetSize =
      materialTapTargetSize ?? MaterialTapTargetSize.padded,
        assert(shape != null, 'Button shape can not be null'),
//        assert(elevation != null && elevation >= 0.0),
        assert(focusElevation != null && focusElevation >= 0.0),
        assert(hoverElevation != null && hoverElevation >= 0.0),
        assert(highlightElevation != null && highlightElevation >= 0.0),
        assert(disabledElevation != null && disabledElevation >= 0.0),
        assert(padding != null),
        assert(animationDuration != null),
        assert(clipBehavior != null),
        assert(autofocus != null);


  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 26.0, minWidth: 98.0),
      child: Container(
        height: getGFSize(size),
        child: GFButton(
          onPressed: onPressed,
          onHighlightChanged: onHighlightChanged,
          textStyle: textStyle,
          boxShadow: boxShadow,
          buttonBoxShadow: buttonBoxShadow,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          elevation:  elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation:highlightElevation,
          disabledElevation: disabledElevation,
          constraints: constraints,
          borderShape: borderShape,
          animationDuration: animationDuration,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus : autofocus ,
//          child: child,
          type : type,
          shape : shape,
          color : color,
          textColor: textColor,
          position : position,
          size : getGFSize(size),
          borderSide: borderSide,
          text: text,
          icon: icon,
          blockButton: blockButton,
          fullWidthButton: fullWidthButton,
          disabledColor: disabledTextColor,
          disabledTextColor: disabledColor,
        ),
      ),
    );
  }
}





//class GFButtonBadge extends StatefulWidget {
//  /// Called when the badge is tapped or otherwise activated.
//  final VoidCallback onPressed;
//
//  /// Defines the default text style, with [Material.textStyle], for the button's [child].
//  final TextStyle textStyle;
//
//  /// The border side for the badge's [Material].
//  final BorderSide borderSide;
//
//  /// The internal padding for the badge's [child].
//  final EdgeInsetsGeometry padding;
//
//  /// The shape of the badge's [Material].
//  final ShapeBorder borderShape;
//
//  /// Badge type of [GFType] i.e, solid, outline, transparent
//  final GFType type;
//
//  /// Badge type of [GFBadgeShape] i.e, standard, pills, square, circle
//  final GFButtonShape shape;
//
//  /// Pass [GFColor] or [Color]
//  final dynamic color;
//
//  /// Pass [GFColor] or [Color]
//  final dynamic textColor;
//
//  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
//  final dynamic size;
//
//  /// text of type [String] is used to display text on the button.
//  final String text;
//
//  /// child of type [Widget] is alternative to child. text will get priority over child.
//  /// You can use [GFBadge] for compatibility.
//  final Widget counter;
//
//  /// icon type of [GFPosition] i.e, start, end
//  final GFPosition position;
//
//  /// Create badges of all types. check out [GFIconBadge] for icon badges and [GFBadge] for default badges.
//  const GFButtonBadge({
//    Key key,
//    @required this.onPressed,
//    this.textStyle,
//    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
//    this.borderShape,
//    this.type = GFType.solid,
//    this.shape = GFButtonShape.standard,
//    this.color = GFColor.primary,
//    this.textColor,
//    this.position = GFPosition.end,
//    this.size = GFSize.medium,
//    this.borderSide,
//    @required this.text,
//    @required this.counter,
//  })  : assert(shape != null, 'Badge shape can not be null'),
//        assert(padding != null),
//        super(key: key);
//
//  @override
//  _GFButtonBadgeState createState() => _GFButtonBadgeState();
//}
//
//class _GFButtonBadgeState extends State<GFButtonBadge> {
//  Color color;
//  Color textColor;
//  Widget child;
//  Widget icon;
//  Function onPressed;
//  GFType type;
//  GFButtonShape shape;
//  double size;
//  GFPosition position;
//
//  @override
//  void initState() {
//    this.color = getGFColor(widget.color);
//    this.textColor = getGFColor(widget.textColor);
//    this.onPressed = widget.onPressed;
//    this.type = widget.type;
//    this.shape = widget.shape;
//    this.size = getGFSize(widget.size);
//    this.position = widget.position;
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ConstrainedBox(
//      constraints: BoxConstraints(minHeight: 26.0, minWidth: 98.0),
//      child: Container(
//        height: this.size,
//        child: GFButton(
//          textStyle: widget.textStyle,
//          borderSide: widget.borderSide,
//          color: this.color,
//          textColor: this.textColor,
//          text: widget.text,
//          onPressed: this.onPressed,
//          type: this.type,
//          shape: this.shape,
//          position: this.position,
//          size: this.size,
//          borderShape: widget.borderShape,
//          icon: widget.counter,
//        ),
//      ),
//    );
//  }
//}
