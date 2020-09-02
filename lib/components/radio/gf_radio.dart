import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class GFRadio<T> extends StatefulWidget {
  const GFRadio(
      {Key key,
        @required this.value,
        @required this.groupValue,
        @required this.onChanged,
      this.size = GFSize.SMALL,
      this.type = GFRadioType.basic,
      this.radioColor = GFColors.SUCCESS,
      this.activebgColor = GFColors.WHITE,
      this.inactivebgColor = GFColors.WHITE,
      this.activeBorderColor = GFColors.DARK,
      this.inactiveBorderColor = GFColors.DARK,
      this.activeIcon = const Icon(
        Icons.check,
        size: 20,
        color: GFColors.DARK,
      ),
      this.inactiveIcon = const Icon(
        Icons.close,
        size: 20,
        color: GFColors.DARK,
      ),
      this.custombgColor = GFColors.SUCCESS,
      this.autofocus = false,
      this.focusNode,
      this.toggleable = false
      })
      : assert(autofocus != null),
        assert(toggleable != null),
        super(key: key);

  /// type of [GFRadioType] which is of four type is basic, sqaure, circular and custom
  final GFRadioType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type pf [Color] used to change the checkcolor when the checkbox is active
  final Color radioColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activebgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactivebgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<T> onChanged;

//  ///Used to set the current state of the checkbox
//  final bool value;
//
//  /// The currently selected value for a group of radio buttons.
//  ///
//  /// This radio button is considered selected if its [value] matches the
//  /// [groupValue].
//  final bool groupValue;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color custombgColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T groupValue;

  final bool toggleable;

  @override
  _GFRadioState<T> createState() => _GFRadioState<T>();
}

class _GFRadioState<T> extends State<GFRadio<T>>
    with TickerProviderStateMixin {
  bool get enabled => widget.onChanged != null;
  bool selected = false;
  var groupValue;

  void onStatusChange() {
    print('wer ${widget.value == widget.groupValue}');
    groupValue = widget.value;
    _handleChanged(widget.value == groupValue);
  }

  void _handleChanged(bool selected) {
    if (selected == null) {
      widget.onChanged(null);
      return;
    }
    if (selected) {
      widget.onChanged(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
//    print('gr ${widget.value} ${widget.groupValue}');
    selected = widget.value == widget.groupValue;
//    print('sel $selected');

    return InkWell(
        enableFeedback: enabled,
        onTap: onStatusChange,
        child: Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
                color: selected ? widget.activebgColor : widget
                    .inactivebgColor,
                borderRadius: widget.type == GFRadioType.basic
                    ? BorderRadius.circular(50)
                    : widget.type == GFRadioType.square
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(10),
                border: Border.all(
                    color: selected
                        ? widget.activeBorderColor
                        : widget.inactiveBorderColor)),
            child: selected
                ? widget.type == GFRadioType.basic ||
                widget.type == GFRadioType.square
                ? Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: widget.size * 0.7,
                  height: widget.size * 0.7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: widget.radioColor),
                )
              ],
            )
                : widget.type == GFRadioType.blunt
                ? Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: widget.size * 0.8,
                  height: widget.size * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(50)),
                      color: widget.custombgColor),
                )
              ],
            )
                : widget.type == GFRadioType.custom
                ? widget.activeIcon
                : widget.inactiveIcon
                : widget.inactiveIcon));
  }
}
