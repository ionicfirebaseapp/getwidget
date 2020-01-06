import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/shape/gf_button_shape.dart';
import 'package:ui_kit/size/gf_size.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFButtonTheme extends StatelessWidget {

  const GFButtonTheme({
    this.textTheme = ButtonTextTheme.normal,
    this.minWidth = 88.0,
    this.height = 36.0,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    this.layoutBehavior = ButtonBarLayoutBehavior.padded,
    this.alignedDropdown = false,
    Color buttonColor,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    this.colorScheme,
    MaterialTapTargetSize materialTapTargetSize,
  }) : assert(textTheme != null),
        assert(minWidth != null && minWidth >= 0.0),
        assert(height != null && height >= 0.0),
        assert(alignedDropdown != null),
        assert(layoutBehavior != null),
        _buttonColor = buttonColor,
        _disabledColor = disabledColor,
        _focusColor = focusColor,
        _hoverColor = hoverColor,
        _highlightColor = highlightColor,
        _splashColor = splashColor,
        _padding = padding,
        _shape = shape,
        _materialTapTargetSize = materialTapTargetSize;

  /// The minimum width for buttons.
  ///
  /// The actual horizontal space allocated for a button's child is
  /// at least this value less the theme's horizontal [padding].
  ///
  /// Defaults to 88.0 logical pixels.
  final double minWidth;

  /// The minimum height for buttons.
  ///
  /// Defaults to 36.0 logical pixels.
  final double height;

  /// Defines a button's base colors, and the defaults for the button's minimum
  /// size, internal padding, and shape.
  ///
  /// Despite the name, this property is not a [TextTheme], its value is not a
  /// collection of [TextStyle]s.
  final ButtonTextTheme textTheme;

  /// Defines whether a [ButtonBar] should size itself with a minimum size
  /// constraint or with padding.
  ///
  /// Defaults to [ButtonBarLayoutBehavior.padded].
  final ButtonBarLayoutBehavior layoutBehavior;

  /// Simply a convenience that returns [minWidth] and [height] as a
  /// [BoxConstraints] object:
  ///
  /// ```dart
  /// return BoxConstraints(
  ///   minWidth: minWidth,
  ///   minHeight: height,
  /// );
  /// ```
  BoxConstraints get constraints {
    return BoxConstraints(
      minWidth: minWidth,
      minHeight: height,
    );
  }

  /// Padding for a button's child (typically the button's label).
  ///
  /// Defaults to 24.0 on the left and right if [textTheme] is
  /// [ButtonTextTheme.primary], 16.0 on the left and right otherwise.
  ///
  /// See also:
  ///
  ///  * [getPadding], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  EdgeInsetsGeometry get padding {
    if (_padding != null)
      return _padding;
    switch (textTheme) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return const EdgeInsets.symmetric(horizontal: 16.0);
      case ButtonTextTheme.primary:
        return const EdgeInsets.symmetric(horizontal: 24.0);
    }
    assert(false);
    return EdgeInsets.zero;
  }
  final EdgeInsetsGeometry _padding;

  /// The shape of a button's material.
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this
  /// shape as well.
  ///
  /// Defaults to a rounded rectangle with circular corner radii of 4.0 if
  /// [textTheme] is [ButtonTextTheme.primary], a rounded rectangle with
  /// circular corner radii of 2.0 otherwise.
  ///
  /// See also:
  ///
  ///  * [getShape], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  ShapeBorder get shape {
    if (_shape != null)
      return _shape;
    switch (textTheme) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        );
      case ButtonTextTheme.primary:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        );
    }
    return const RoundedRectangleBorder();
  }
  final ShapeBorder _shape;

  /// If true, then a [DropdownButton] menu's width will match the button's
  /// width.
  ///
  /// If false (the default), then the dropdown's menu will be wider than
  /// its button. In either case the dropdown button will line up the leading
  /// edge of the menu's value with the leading edge of the values
  /// displayed by the menu items.
  ///
  /// This property only affects [DropdownButton] and its menu.
  final bool alignedDropdown;

  /// The background fill color for [RaisedButton]s.
  ///
  /// This property is null by default.
  ///
  /// If the button is in the focused, hovering, or highlighted state, then the
  /// [focusColor], [hoverColor], or [highlightColor] will take precedence over
  /// the [focusColor].
  ///
  /// See also:
  ///
  ///  * [getFillColor], which is used by [RaisedButton] to compute its
  ///    background fill color.
  final Color _buttonColor;

  /// The background fill color for disabled [RaisedButton]s.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [getDisabledFillColor], which is used by [RaisedButton] to compute its
  ///    background fill color.
  final Color _disabledColor;

  /// The fill color of the button when it has the input focus.
  ///
  /// This property is null by default.
  ///
  /// If the button is in the hovering or highlighted state, then the [hoverColor]
  /// or [highlightColor] will take precedence over the [focusColor].
  ///
  /// See also:
  ///
  ///  * [getFocusColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _focusColor;

  /// The fill color of the button when a pointer is hovering over it.
  ///
  /// This property is null by default.
  ///
  /// If the button is in the highlighted state, then the [highlightColor] will
  /// take precedence over the [hoverColor].
  ///
  /// See also:
  ///
  ///  * [getHoverColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _hoverColor;

  /// The color of the overlay that appears when a button is pressed.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [getHighlightColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _highlightColor;

  /// The color of the ink "splash" overlay that appears when a button is tapped.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [getSplashColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _splashColor;

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

  // The minimum size of a button's tap target.
  //
  // This property is null by default.
  //
  // See also:
  //
  //  * [getMaterialTargetTapSize], which is used by [RaisedButton],
  //    [OutlineButton] and [FlatButton].
  final MaterialTapTargetSize _materialTapTargetSize;

  /// The [button]'s overall brightness.
  ///
  /// Returns the button's [MaterialButton.colorBrightness] if it is non-null,
  /// otherwise the color scheme's [ColorScheme.brightness] is returned.
  Brightness getBrightness(MaterialButton button) {
    return button.colorBrightness ?? colorScheme.brightness;
  }

  /// Defines the [button]'s base colors, and the defaults for the button's
  /// minimum size, internal padding, and shape.
  ///
  /// Despite the name, this property is not the [TextTheme] whose
  /// [TextTheme.button] is used as the button text's [TextStyle].
  ButtonTextTheme getTextTheme(MaterialButton button) {
    return button.textTheme ?? textTheme;
  }

  /// The foreground color of the [button]'s text and icon when
  /// [MaterialButton.onPressed] is null (when MaterialButton.enabled is false).
  ///
  /// Returns the button's [MaterialButton.disabledColor] if it is non-null.
  /// Otherwise the color scheme's [ColorScheme.onSurface] color is returned
  /// with its opacity set to 0.38.
  ///
  /// If [MaterialButton.textColor] is a [MaterialStateProperty<Color>], it will be
  /// used as the `disabledTextColor`. It will be resolved in the [MaterialState.disabled] state.
  Color getDisabledTextColor(MaterialButton button) {
    if (button.textColor is MaterialStateProperty<Color>)
      return button.textColor;
    if (button.disabledTextColor != null)
      return button.disabledTextColor;
    return colorScheme.onSurface.withOpacity(0.38);
  }

  /// The [button]'s background color when [MaterialButton.onPressed] is null
  /// (when [MaterialButton.enabled] is false).
  ///
  /// Returns the button's [MaterialButton.disabledColor] if it is non-null.
  ///
  /// Otherwise the value of the `disabledColor` constructor parameter
  /// is returned, if it is non-null.
  ///
  /// Otherwise the color scheme's [ColorScheme.onSurface] color is returned
  /// with its opacity set to 0.38.
  Color getDisabledFillColor(MaterialButton button) {
    if (button.disabledColor != null)
      return button.disabledColor;
    if (_disabledColor != null)
      return _disabledColor;
    return colorScheme.onSurface.withOpacity(0.38);
  }

  /// The button's background fill color or null for buttons that don't have
  /// a background color.
  ///
  /// Returns [MaterialButton.color] if it is non-null and the button
  /// is enabled.
  ///
  /// Otherwise, returns [MaterialButton.disabledColor] if it is non-null and
  /// the button is disabled.
  ///
  /// Otherwise, if button is a [FlatButton] or an [OutlineButton] then null is
  /// returned.
  ///
  /// Otherwise, if button is a [RaisedButton], returns the `buttonColor`
  /// constructor parameter if it was non-null and the button is enabled.
  ///
  /// Otherwise the fill color depends on the value of [getTextTheme].
  ///
  ///  * [ButtonTextTheme.normal] or [ButtonTextTheme.accent], the
  ///    color scheme's [ColorScheme.primary] color if the [button] is enabled
  ///    the value of [getDisabledFillColor] otherwise.
  ///  * [ButtonTextTheme.primary], if the [button] is enabled then the value
  ///    of the `buttonColor` constructor parameter if it is non-null,
  ///    otherwise the color scheme's ColorScheme.primary color. If the button
  ///    is not enabled then the colorScheme's [ColorScheme.onSurface] color
  ///    with opacity 0.12.
  Color getFillColor(MaterialButton button) {
    final Color fillColor = button.enabled ? button.color : button.disabledColor;
    if (fillColor != null)
      return fillColor;

    if (button is FlatButton || button is OutlineButton || button.runtimeType == MaterialButton)
      return null;

    if (button.enabled && button is RaisedButton && _buttonColor != null)
      return _buttonColor;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return button.enabled ? colorScheme.primary : getDisabledFillColor(button);
      case ButtonTextTheme.primary:
        return button.enabled
            ? _buttonColor ?? colorScheme.primary
            : colorScheme.onSurface.withOpacity(0.12);
    }

    assert(false);
    return null;
  }

  /// The foreground color of the [button]'s text and icon.
  ///
  /// If [button] is not [MaterialButton.enabled], the value of
  /// [getDisabledTextColor] is returned. If the button is enabled and
  /// [buttonTextColor] is non-null, then [buttonTextColor] is returned.
  ///
  /// Otherwise the text color depends on the value of [getTextTheme]
  /// and [getBrightness].
  ///
  ///  * [ButtonTextTheme.normal]: [Colors.white] is used if [getBrightness]
  ///    resolves to [Brightness.dark]. [Colors.black87] is used if
  ///    [getBrightness] resolves to [Brightness.light].
  ///  * [ButtonTextTheme.accent]: [colorScheme.secondary].
  ///  * [ButtonTextTheme.primary]: If [getFillColor] is dark then [Colors.white],
  ///    otherwise if [button] is a [FlatButton] or an [OutlineButton] then
  ///    [colorScheme.primary], otherwise [Colors.black].
  Color getTextColor(MaterialButton button) {
    if (!button.enabled)
      return getDisabledTextColor(button);

    if (button.textColor != null)
      return button.textColor;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
        return getBrightness(button) == Brightness.dark ? Colors.white : Colors.black87;

      case ButtonTextTheme.accent:
        return colorScheme.secondary;

      case ButtonTextTheme.primary:
        final Color fillColor = getFillColor(button);
        final bool fillIsDark = fillColor != null
            ? ThemeData.estimateBrightnessForColor(fillColor) == Brightness.dark
            : getBrightness(button) == Brightness.dark;
        if (fillIsDark)
          return Colors.white;
        if (button is FlatButton || button is OutlineButton)
          return colorScheme.primary;
        return Colors.black;
    }

    assert(false);
    return null;
  }

  /// The color of the ink "splash" overlay that appears when the (enabled)
  /// [button] is tapped.
  ///
  /// Returns the button's [MaterialButton.splashColor] if it is non-null.
  ///
  /// Otherwise, returns the value of the `splashColor` constructor parameter
  /// it is non-null and [button] is a [RaisedButton] or an [OutlineButton].
  ///
  /// Otherwise, returns the value of the `splashColor` constructor parameter
  /// if it is non-null and [button] is a [FlatButton] and
  /// [getTextTheme] is not [ButtonTextTheme.primary]
  ///
  /// Otherwise, returns [getTextColor] with an opacity of 0.12.
  Color getSplashColor(MaterialButton button) {
    if (button.splashColor != null)
      return button.splashColor;

    if (_splashColor != null && (button is RaisedButton || button is OutlineButton))
      return _splashColor;

    if (_splashColor != null && button is FlatButton) {
      switch (getTextTheme(button)) {
        case ButtonTextTheme.normal:
        case ButtonTextTheme.accent:
          return _splashColor;
        case ButtonTextTheme.primary:
          break;
      }
    }

    return getTextColor(button).withOpacity(0.12);
  }

  /// The fill color of the button when it has input focus.
  ///
  /// Returns the button's [MaterialButton.focusColor] if it is non-null.
  /// Otherwise the focus color depends on [getTextTheme]:
  ///
  ///  * [ButtonTextTheme.normal], [ButtonTextTheme.accent]: returns the
  ///    value of the `focusColor` constructor parameter if it is non-null,
  ///    otherwise the value of [getTextColor] with opacity 0.12.
  ///  * [ButtonTextTheme.primary], returns [Colors.transparent].
  Color getFocusColor(MaterialButton button) {
    return button.focusColor ?? _focusColor ?? getTextColor(button).withOpacity(0.12);
  }

  /// The fill color of the button when it has input focus.
  ///
  /// Returns the button's [MaterialButton.focusColor] if it is non-null.
  /// Otherwise the focus color depends on [getTextTheme]:
  ///
  ///  * [ButtonTextTheme.normal], [ButtonTextTheme.accent],
  ///    [ButtonTextTheme.primary]: returns the value of the `focusColor`
  ///    constructor parameter if it is non-null, otherwise the value of
  ///    [getTextColor] with opacity 0.04.
  Color getHoverColor(MaterialButton button) {
    return button.hoverColor ?? _hoverColor ?? getTextColor(button).withOpacity(0.04);
  }

  /// The color of the overlay that appears when the [button] is pressed.
  ///
  /// Returns the button's [MaterialButton.highlightColor] if it is non-null.
  /// Otherwise the highlight color depends on [getTextTheme]:
  ///
  ///  * [ButtonTextTheme.normal], [ButtonTextTheme.accent]: returns the
  ///    value of the `highlightColor` constructor parameter if it is non-null,
  ///    otherwise the value of [getTextColor] with opacity 0.16.
  ///  * [ButtonTextTheme.primary], returns [Colors.transparent].
  Color getHighlightColor(MaterialButton button) {
    if (button.highlightColor != null)
      return button.highlightColor;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return _highlightColor ?? getTextColor(button).withOpacity(0.16);
      case ButtonTextTheme.primary:
        return Colors.transparent;
    }

    assert(false);
    return Colors.transparent;
  }

  /// The [button]'s elevation when it is enabled and has not been pressed.
  ///
  /// Returns the button's [MaterialButton.elevation] if it is non-null.
  ///
  /// If button is a [FlatButton] then elevation is 0.0, otherwise it is 2.0.
  double getElevation(MaterialButton button) {
    if (button.elevation != null)
      return button.elevation;
    if (button is FlatButton)
      return 0.0;
    return 2.0;
  }

  /// The [button]'s elevation when it is enabled and has focus.
  ///
  /// Returns the button's [MaterialButton.focusElevation] if it is non-null.
  ///
  /// If button is a [FlatButton] or an [OutlineButton] then the focus
  /// elevation is 0.0, otherwise the highlight elevation is 4.0.
  double getFocusElevation(MaterialButton button) {
    if (button.focusElevation != null)
      return button.focusElevation;
    if (button is FlatButton)
      return 0.0;
    if (button is OutlineButton)
      return 0.0;
    return 4.0;
  }

  /// The [button]'s elevation when it is enabled and has focus.
  ///
  /// Returns the button's [MaterialButton.hoverElevation] if it is non-null.
  ///
  /// If button is a [FlatButton] or an [OutlineButton] then the hover
  /// elevation is 0.0, otherwise the highlight elevation is 4.0.
  double getHoverElevation(MaterialButton button) {
    if (button.hoverElevation != null)
      return button.hoverElevation;
    if (button is FlatButton)
      return 0.0;
    if (button is OutlineButton)
      return 0.0;
    return 4.0;
  }

  /// The [button]'s elevation when it is enabled and has been pressed.
  ///
  /// Returns the button's [MaterialButton.highlightElevation] if it is non-null.
  ///
  /// If button is a [FlatButton] or an [OutlineButton] then the highlight
  /// elevation is 0.0, otherwise the highlight elevation is 8.0.
  double getHighlightElevation(MaterialButton button) {
    if (button.highlightElevation != null)
      return button.highlightElevation;
    if (button is FlatButton)
      return 0.0;
    if (button is OutlineButton)
      return 0.0;
    return 8.0;
  }

  /// The [button]'s elevation when [MaterialButton.onPressed] is null (when
  /// MaterialButton.enabled is false).
  ///
  /// Returns the button's [MaterialButton.elevation] if it is non-null.
  ///
  /// Otherwise the disabled elevation is 0.0.
  double getDisabledElevation(MaterialButton button) {
    if (button.disabledElevation != null)
      return button.disabledElevation;
    return 0.0;
  }

  /// Padding for the [button]'s child (typically the button's label).
  ///
  /// Returns the button's [MaterialButton.padding] if it is non-null.
  ///
  /// If this is a button constructed with [RaisedButton.icon] or
  /// [FlatButton.icon] or [OutlineButton.icon] then the padding is:
  /// `EdgeInsetsDirectional.only(start: 12.0, end: 16.0)`.
  ///
  /// Otherwise, returns [padding] if it is non-null.
  ///
  /// Otherwise, returns horizontal padding of 24.0 on the left and right if
  /// [getTextTheme] is [ButtonTextTheme.primary], 16.0 on the left and right
  /// otherwise.
  EdgeInsetsGeometry getPadding(MaterialButton button) {
    if (button.padding != null)
      return button.padding;

    if (button is MaterialButtonWithIconMixin)
      return const EdgeInsetsDirectional.only(start: 12.0, end: 16.0);

    if (_padding != null)
      return _padding;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return const EdgeInsets.symmetric(horizontal: 16.0);
      case ButtonTextTheme.primary:
        return const EdgeInsets.symmetric(horizontal: 24.0);
    }
    assert(false);
    return EdgeInsets.zero;
  }

  /// The shape of the [button]'s [Material].
  ///
  /// Returns the button's [MaterialButton.shape] if it is non-null, otherwise
  /// [shape] is returned.
  ShapeBorder getShape(MaterialButton button) {
    return button.shape ?? shape;
  }

  /// The duration of the [button]'s highlight animation.
  ///
  /// Returns the button's [MaterialButton.animationDuration] it if is non-null,
  /// otherwise 200ms.
  Duration getAnimationDuration(MaterialButton button) {
    return button.animationDuration ?? kThemeChangeDuration;
  }

  /// The [BoxConstraints] that the define the [button]'s size.
  ///
  /// By default this method just returns [constraints]. Subclasses
  /// could override this method to return a value that was,
  /// for example, based on the button's type.
  BoxConstraints getConstraints(MaterialButton button) => constraints;

  /// The minimum size of the [button]'s tap target.
  ///
  /// Returns the button's [MaterialButton.tapTargetSize] if it is non-null.
  ///
  /// Otherwise the value of the [materialTapTargetSize] constructor
  /// parameter is returned if that's non-null.
  ///
  /// Otherwise [MaterialTapTargetSize.padded] is returned.
  MaterialTapTargetSize getMaterialTapTargetSize(MaterialButton button) {
    return button.materialTapTargetSize ?? _materialTapTargetSize ?? MaterialTapTargetSize.padded;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          buttonTheme: ButtonThemeData(
            textTheme: textTheme ?? this.textTheme,
            layoutBehavior: layoutBehavior ?? this.layoutBehavior,
            minWidth: minWidth ?? this.minWidth,
            height: height ?? this.height,
            padding: padding ?? this.padding,
            shape: shape ?? this.shape,
            alignedDropdown: alignedDropdown ?? this.alignedDropdown,
            buttonColor: _buttonColor,
            disabledColor: _disabledColor,
            focusColor: _focusColor,
            hoverColor: _hoverColor,
            highlightColor: _highlightColor,
            splashColor: _splashColor,
            colorScheme: colorScheme,
            materialTapTargetSize: _materialTapTargetSize,
          )
      ),
      home: Scaffold(
        body: GFButton(),
      ),
    );
  }
}

class GFButton extends StatefulWidget {
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

  /// Typically the button's label.
  final Widget child;

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

  /// Button type of [GFType] i.e, solid, outline, dashed
  final GFType type;

  /// Button type of [GFButtonShape] i.e, standard, pills, square, shadow, icons
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

  /// icon of type [Widget]
  final Widget icon;

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

  /// Create buttons of all types. check out [GFIconButton] for icon buttons, and [GFBadge] for badges
  const GFButton(
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
        this.child,
        this.type = GFType.solid,
        this.shape = GFButtonShape.standard,
        this.color = GFColor.primary,
        this.textColor,
        this.position = GFPosition.start,
        this.size = GFSize.medium,
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
        assert(autofocus != null),
        super(key: key);

  @override
  _GFButtonState createState() => _GFButtonState();
}

class _GFButtonState extends State<GFButton> {
  Color color;
  Color disabledColor;
  Color textColor;
  Color disabledTextColor;
  Widget child;
  Widget icon;
  Function onPressed;
  GFType type;
  GFButtonShape shape;
  double size;
  GFPosition position;
  BoxShadow boxShadow;

  final Set<MaterialState> _states = <MaterialState>{};

  @override
  void initState() {
    this.color = getGFColor(widget.color);
    this.textColor = getGFColor(widget.textColor);
    this.child = widget.text != null ? Text(widget.text) : widget.child;
    this.icon = widget.icon;
    this.onPressed = widget.onPressed;
    this.type = widget.type;
    this.shape = widget.shape;
    this.size = getGFSize(widget.size);
    this.position = widget.position;
    this.disabledColor = getGFColor(widget.disabledColor);
    this.disabledTextColor = getGFColor(widget.disabledTextColor);

    _updateState(MaterialState.disabled, !widget.enabled);
    super.initState();
  }

  bool get _hovered => _states.contains(MaterialState.hovered);
   bool get _focused => _states.contains(MaterialState.focused);
  bool get _pressed => _states.contains(MaterialState.pressed);
  bool get _disabled => _states.contains(MaterialState.disabled);

  double buttonWidth() {
    if (widget.blockButton == true) {
      return MediaQuery.of(context).size.width * 0.88;
    } else if (widget.fullWidthButton == true) {
      return MediaQuery.of(context).size.width;
    } else {
      return null;
    }
  }

  void _updateState(MaterialState state, bool value) {
    value ? _states.add(state) : _states.remove(state);
  }

  void _handleHighlightChanged(bool value) {
    if (_pressed != value) {
      setState(() {
        _updateState(MaterialState.pressed, value);
        if (widget.onHighlightChanged != null) {
          widget.onHighlightChanged(value);
        }
      });
    }
  }

  void _handleHoveredChanged(bool value) {
    if (_hovered != value) {
      setState(() {
        _updateState(MaterialState.hovered, value);
      });
    }
  }

   void _handleFocusedChanged(bool value) {
     if (_focused != value) {
       setState(() {
         _updateState(MaterialState.focused, value);
       });
     }
   }

  @override
  void didUpdateWidget(GFButton oldWidget) {
    _updateState(MaterialState.disabled, !widget.enabled);
    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (_disabled && _pressed) {
      _handleHighlightChanged(false);
    }
    super.didUpdateWidget(oldWidget);
  }

  double get _effectiveElevation {
    // These conditionals are in order of precedence, so be careful about
    // reorganizing them.
    if (_disabled) {
      return widget.disabledElevation;
    }
    if (_pressed) {
      return widget.highlightElevation;
    }
    if (_hovered) {
      return widget.hoverElevation;
    }
    if (_focused) {
      return widget.focusElevation;
    }
    return widget.elevation;
  }


  @override
  Widget build(BuildContext context) {
    ShapeBorder shape;

    final Color effectiveTextColor = MaterialStateProperty.resolveAs<Color>(
        widget.textStyle?.color, _states);
    final Color themeColor =
    Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    final BorderSide outlineBorder = BorderSide(
      color: this.color == null
          ? themeColor
          : widget.borderSide == null ? this.color : widget.borderSide.color,
      width: widget.borderSide?.width ?? 1.0,
    );

    Size minSize;
    switch (widget.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        minSize = const Size(48.0, 48.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
        break;
      default:
        minSize = Size.zero;
        break;
    }

    Color getDisabledFillColor() {
      if (this.disabledColor != null)
        return this.disabledColor;
      else {
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
      }
    }

    Color getColor() {
      if (widget.type == GFType.transparent || widget.type == GFType.outline)
        return Colors.transparent;
      else{
        final Color fillColor = this.color == null ? getGFColor(GFColor.dark) : this.color;
        if (fillColor != null)
          return fillColor;
      }
    }

    Color getDisabledTextColor() {
      if (this.disabledColor != null)
        return this.disabledTextColor;
      else{
        return Theme.of(context).disabledColor;
      }
    }


    Color getTextColor() {

      if (widget.type == GFType.outline){
        return widget.enabled ? this.textColor == null ? this.color : this.textColor : getDisabledTextColor();
      }
        if (this.textColor == null) {
          return getGFColor(GFColor.dark);
        }
        else{
          return this.textColor;
        }
    }

    final BorderSide shapeBorder = widget.type == GFType.outline
        ? outlineBorder
        : widget.borderSide != null
        ? widget.borderSide
        : BorderSide(
      color: this.color == null ? themeColor : getColor(),
      width: 0.0,
    );

    if (this.shape == GFButtonShape.pills) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    } else if (this.shape == GFButtonShape.square) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), side: shapeBorder);
    } else if (this.shape == GFButtonShape.standard) {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), side: shapeBorder);
    } else {
      shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), side: shapeBorder);
    }

    BoxDecoration getBoxShadow() {
      if (widget.type != GFType.transparent) {
        if (widget.boxShadow == null && widget.buttonBoxShadow != true) {
          return null;
        } else {
          return BoxDecoration(
              color: widget.type == GFType.transparent ||
                  widget.type == GFType.outline
                  ? Colors.transparent
                  : this.color,
              borderRadius: widget.shape == GFButtonShape.pills
                  ? BorderRadius.circular(50.0)
                  : widget.shape == GFButtonShape.standard
                  ? BorderRadius.circular(5.0)
                  : BorderRadius.zero,
              boxShadow: [
                widget.boxShadow == null && widget.buttonBoxShadow == true
                    ? BoxShadow(
                  color: themeColor,
                  blurRadius: 1.5,
                  spreadRadius: 2.0,
                  offset: Offset.zero,
                )
                    : widget.boxShadow != null
                    ? widget.boxShadow
                    : BoxShadow(
                  color: Theme.of(context).canvasColor,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                  offset: Offset.zero,
                ),
              ]);
        }
      }
      return null;
    }

    final Widget result = Container(
      constraints: this.icon == null
          ? BoxConstraints(minWidth: 88.0)
          : BoxConstraints(minWidth: 98.0),
      decoration: getBoxShadow(),
      child: Material(
        elevation: _effectiveElevation,
        textStyle: widget.textStyle == null
            ? TextStyle(color: widget.enabled ? getTextColor() : getDisabledTextColor(), fontSize: 14)
            : widget.textStyle,
        shape: widget.type == GFType.transparent
            ? null
            : widget.borderShape == null ? shape : widget.borderShape,
        color: widget.enabled ? getColor() : getDisabledFillColor(),
        type: this.color == null
            ? MaterialType.transparency
            : MaterialType.button,
        animationDuration: widget.animationDuration,
        clipBehavior: widget.clipBehavior,
        child: InkWell(
          focusNode: widget.focusNode,
          canRequestFocus: widget.enabled,
          onFocusChange: _handleFocusedChanged,
          autofocus: widget.autofocus,
          onHighlightChanged: _handleHighlightChanged,
          onHover: _handleHoveredChanged,
          onTap: widget.onPressed,
          onLongPress: widget.onLongPress,
          enableFeedback: widget.enableFeedback,
          splashColor: getGFColor(widget.splashColor),
          highlightColor: getGFColor(widget.highlightColor),
          focusColor: getGFColor(widget.focusColor),
          hoverColor: getGFColor(widget.hoverColor),
          customBorder: widget.type == GFType.transparent
              ? null
              : widget.borderShape == null ? shape : widget.borderShape,
          child: IconTheme.merge(
            data: IconThemeData(color: effectiveTextColor),
            child: Container(
              height: this.size,
              width: buttonWidth(),
              padding: widget.padding,
              child: Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: this.icon != null &&
                    (this.position == GFPosition.start ||
                        this.position == null)
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    this.icon,
                    const SizedBox(width: 8.0),
                    this.child
                  ],
                )
                    : this.icon != null && (this.position == GFPosition.end)
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    this.child,
                    const SizedBox(width: 8.0),
                    this.icon
                  ],
                )
                    : this.child,
              ),
            ),
          ),
        ),
      ),
    );

//    return Semantics(
//      container: true,
//      button: true,
//      enabled: widget.enabled,
//      child: _InputPadding(
//        minSize: minSize,
//        child: result,
//      ),
//    );

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: _handleFocusedChanged,
          autofocus: widget.autofocus,
          child: result
        ),
      ),
    );
  }
}

/// A widget to pad the area around a [MaterialButton]'s inner [Material].
///
/// Redirect taps that occur in the padded area around the child to the center
/// of the child. This increases the size of the button and the button's
/// "tap target", but not its material or its ink splashes.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({
    Key key,
    Widget child,
    this.minSize,
  }) : super(key: key, child: child);

  final Size minSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInputPadding(minSize);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox child]) : super(child);

  Size get minSize => _minSize;
  Size _minSize;
  set minSize(Size value) {
    if (_minSize == value) return;
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMinIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMinIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMaxIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMaxIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  void performLayout() {
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      final double height = math.max(child.size.width, minSize.width);
      final double width = math.max(child.size.height, minSize.height);
      size = constraints.constrain(Size(height, width));
      final BoxParentData childParentData = child.parentData;
      childParentData.offset = Alignment.center.alongOffset(size - child.size);
    } else {
      size = Size.zero;
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final Offset center = child.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (BoxHitTestResult result, Offset position) {
        assert(position == center);
        return child.hitTest(result, position: center);
      },
    );
  }
}