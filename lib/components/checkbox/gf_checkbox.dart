import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFCheckbox extends StatefulWidget {
  /// [GFCheckbox] is a small box (as in a checklist) in which to place a check mark to make a selection with various customization options.
  const GFCheckbox({
    Key? key,
    this.size = GFSize.MEDIUM,
    this.type = GFCheckboxType.basic,
    this.activeBgColor = GFColors.PRIMARY,
    this.inactiveBgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.DARK,
    required this.onChanged,
    required this.value,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.WHITE,
    ),
    this.inactiveIcon,
    this.customBgColor = GFColors.SUCCESS,
    this.autofocus = false,
    this.focusNode,
    this.validator,
  }) : super(key: key);

  /// type of [GFCheckboxType] which is of four type is basic, square, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool>? onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// type of [Widget] used to change the  checkbox's active icon
  final Widget activeIcon;

  /// type of [Widget] used to change the  checkbox's inactive icon
  final Widget? inactiveIcon;

  /// type of [Color] used to change the background color of the custom active checkbox only
  final Color customBgColor;

  /// on true state this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused
  final bool autofocus;

  /// an optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  final FormFieldValidator<bool>? validator;
  @override
  _GFCheckboxState createState() => _GFCheckboxState();
}

class _GFCheckboxState extends State<GFCheckbox> {
  bool get enabled => widget.onChanged != null;
  @override
  void initState() {
    super.initState();
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) => FormField<bool>(
        initialValue: _isChecked,
        validator: widget.validator,
        builder: (state) => Column(children: [
          FocusableActionDetector(
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            enabled: enabled,
            child: InkResponse(
              highlightShape: widget.type == GFCheckboxType.circle
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              containedInkWell: widget.type != GFCheckboxType.circle,
              canRequestFocus: enabled,
              onTap: widget.onChanged != null
                  ? () {
                      _isChecked = !widget.value;
                      state.didChange(!widget.value);
                      widget.onChanged!(!widget.value);
                    }
                  : null,
              child: Container(
                height: widget.size,
                width: widget.size,
                margin: widget.type != GFCheckboxType.circle
                    ? const EdgeInsets.all(10)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: enabled
                        ? widget.value
                            ? widget.type == GFCheckboxType.custom
                                ? Colors.white
                                : widget.activeBgColor
                            : widget.inactiveBgColor
                        : Colors.grey,
                    borderRadius: widget.type == GFCheckboxType.basic
                        ? BorderRadius.circular(3)
                        : widget.type == GFCheckboxType.circle
                            ? BorderRadius.circular(50)
                            : BorderRadius.zero,
                    border: Border.all(
                        color: widget.value
                            ? widget.type == GFCheckboxType.custom
                                ? Colors.black87
                                : widget.activeBorderColor
                            : widget.inactiveBorderColor)),
                child: widget.value
                    ? widget.type == GFCheckboxType.custom
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
                                    shape: BoxShape.rectangle,
                                    color: widget.customBgColor),
                              )
                            ],
                          )
                        : widget.activeIcon
                    : widget.inactiveIcon,
              ),
            ),
          ),
          state.hasError
              ? Text(
                  state.errorText!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                )
              : Container(),
        ]),
      );
}
