import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../types/gf_toggle_type.dart';





class GFToggle extends StatelessWidget {
  GFToggle({Key key,
    @required this.onChanged,
    @required this.value,
    this.activeColor,
//    this.inactiveColor,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
    this.activeThumbColor,
    this.focusColor,
    this.hoverColor,
    this.type,
    this.height,
    this.width,
  }) :super(key: key);


//  /// Button type of [GFToggleType] i.e, androidSwitch, iosSwitch, labeledSwitch, animatedSWitch
  GFToggleType type;

  ///A androidSwitch
  ///
  /// The color to use on the track when this switch is on.
  final Color activeColor;


  /// Whether this switch is on or off.
  ///
  /// This property must not be null.
  final bool value;

  ///the state used to toggle the switch for true or false
  final ValueChanged<bool> onChanged;

  /// The color to use on the track when this switch is off.
  final Color inactiveTrackColor;

  /// Defaults to the colors described in the Material design specification.
  final Color inactiveThumbColor;

  /// Defaults to the colors described in the Material design specification when switch is on.
  final Color activeThumbColor;


  /// The color for the button's [Material] when it has the input focus.
  final Color focusColor;

  /// The color for the button's [Material] when a pointer is hovering over it.
  final Color hoverColor;


  ///height of the ios button
  final double height;

  ///width of the track button
  final double width;


  @override
  Widget build(BuildContext context) {
    if (type == GFToggleType.androidSwitch) {
      return Switch(
        value: value,
        activeColor: activeColor,
        inactiveThumbColor: inactiveTrackColor,
        inactiveTrackColor: inactiveTrackColor,
        hoverColor: hoverColor,
        focusColor: focusColor,
        onChanged: onChanged,


      );
    } else if (type == GFToggleType.iosSwitch) {
      return CupertinoSwitch(
          value: value,
          onChanged: onChanged,


      );

    }
  }
}