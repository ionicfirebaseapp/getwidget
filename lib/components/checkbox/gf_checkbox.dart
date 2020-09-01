import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class GFCheckbox extends StatefulWidget {
  const GFCheckbox({
    Key key,
    this.size = GFSize.MEDIUM,
    this.type = GFCheckboxType.basic,
    this.checkColor = GFColors.WHITE,
    this.activebgColor = GFColors.PRIMARY,
    this.inactivebgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.DARK,
    this.onChanged,
    this.value,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.WHITE,
    ),
    this.inactiveIcon = const Icon(Icons.close),
    this.custombgColor = GFColors.SUCCESS,
    this.autofocus = false,
    this.focusNode
  }) : assert(autofocus != null),
        super(key: key);

  /// type of [GFCheckboxType] which is of four type is basic, sqaure, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  // type pf [Color] used to change the checkcolor when the checkbox is active
  final Color checkColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activebgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactivebgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

  ///Used to set the current state of the checkbox
  final bool value;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color custombgColor;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  @override
  _GFCheckboxState createState() => _GFCheckboxState();
}

class _GFCheckboxState extends State<GFCheckbox> {
  bool get enabled => widget.onChanged != null;
  Map<Type, Action<Intent>> _actionMap;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.value;
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: _actionHandler),
    };
  }

  void _actionHandler(ActivateIntent intent) {
    if (widget.onChanged != null) {
      switch (widget.value) {
        case false:
          widget.onChanged(true);
          break;
        default: // case null:
          widget.onChanged(false);
          break;
      }
    }
    final RenderObject renderObject = context.findRenderObject();
    renderObject.sendSemanticsEvent(const TapSemanticEvent());
  }

  void onStatusChange() {
    setState(() {
      isSelected = !isSelected;
    });
    if (widget.onChanged != null) {
      widget.onChanged(isSelected);
    }
  }


  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    actions: _actionMap,
    focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        enabled: enabled,
        child: InkWell(
//          onTap: onStatusChange,
//          canRequestFocus: enabled,
          canRequestFocus: widget.onChanged != null,
          onTap: widget.onChanged != null ?
              () {
                setState(() {
                  isSelected = !isSelected;
                });
            widget.onChanged(!widget.value);
          } : null,
          child: Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
                color: enabled
                    ? isSelected
                        ? widget.type == GFCheckboxType.custom
                            ? Colors.white
                            : widget.activebgColor
                        : widget.inactivebgColor
                    : Colors.grey,
                borderRadius: widget.type == GFCheckboxType.basic
                    ? BorderRadius.circular(3)
                    : widget.type == GFCheckboxType.circle
                        ? BorderRadius.circular(50)
                        : BorderRadius.zero,
                border: Border.all(
                    color: isSelected
                        ? widget.type == GFCheckboxType.custom
                            ? Colors.black87
                            : widget.activeBorderColor
                        : widget.inactiveBorderColor)),
            child: isSelected
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
                                color: widget.custombgColor),
                          )
                        ],
                      )
                    : widget.activeIcon
                : widget.inactiveIcon,
          ),
        ),
      );
}
