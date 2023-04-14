import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFRadio<T> extends StatefulWidget {
  /// [GFRadio] is one type of selection indicator in a list of options.
  const GFRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = GFSize.SMALL,
    this.type = GFRadioType.basic,
    this.radioColor = GFColors.SUCCESS,
    this.activeBgColor = GFColors.WHITE,
    this.inactiveBgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.DARK,
    this.inactiveBorderColor = GFColors.DARK,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.DARK,
    ),
    this.inactiveIcon,
    this.customBgColor = GFColors.SUCCESS,
    this.autofocus = false,
    this.focusNode,
    this.toggleable = false,
    this.validator,
  }) : super(key: key);

  /// type of [GFRadioType] which is of four type is basic, sqaure, circular and custom
  final GFRadioType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type pf [Color] used to change the checkcolor when the radio button is active
  final Color radioColor;

  /// type of [Color] used to change the backgroundColor of the active radio button
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive radio button
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active radio button
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive radio button
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the radio button
  final ValueChanged<T>? onChanged;

  ///type of Widget used to change the  radio button's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  radio button's inactive icon
  final Widget? inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  radio button only
  final Color customBgColor;

  /// on true state this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused
  final bool autofocus;

  /// an optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons. Radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T groupValue;

  /// sets the radio value
  final bool toggleable;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  final FormFieldValidator<T>? validator;

  @override
  _GFRadioState<T> createState() => _GFRadioState<T>();
}

class _GFRadioState<T> extends State<GFRadio<T>> with TickerProviderStateMixin {
  bool get enabled => widget.onChanged != null;
  bool selected = false;
  T? groupValue;

  void onStatusChange() {
    groupValue = widget.value;
    _handleChanged(widget.value == groupValue);
  }

  void _handleChanged(bool selected) {
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) => FormField<T>(
      validator: widget.validator,
      builder: (state) {
        selected = widget.value == widget.groupValue;
        return Column(children: [
          InkWell(
              borderRadius: widget.type == GFRadioType.basic &&
                      widget.type == GFRadioType.blunt
                  ? BorderRadius.circular(50)
                  : widget.type == GFRadioType.square
                      ? BorderRadius.circular(0)
                      : BorderRadius.circular(10),
              enableFeedback: enabled,
              onTap: () {
                onStatusChange();
                state.didChange(widget.value);
              },
              child: Container(
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                      color: selected
                          ? widget.activeBgColor
                          : widget.inactiveBgColor,
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
                                      shape: BoxShape.circle,
                                      color: widget.radioColor),
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
                                          color: widget.customBgColor),
                                    )
                                  ],
                                )
                              : widget.type == GFRadioType.custom
                                  ? widget.activeIcon
                                  : widget.inactiveIcon
                      : widget.inactiveIcon)),
          state.hasError
              ? Text(
                  state.errorText!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                )
              : Container(),
        ]);
      });
}
