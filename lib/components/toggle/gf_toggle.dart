import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// A toggle button allows the user to change a setting between two states.
///
/// The state of each button is controlled by isSelected, which is a list of bools that determine
/// if a button is in an unselected or selected state. They are both
/// correlated by their index in the list. The length of isSelected has to
/// match the length of the children list.
///
/// ## Customizing toggle buttons
/// Each toggle's behavior can be configured by the onPressed callback, which
/// can update the isSelected list however it wants to.
class GFToggle extends StatefulWidget {
  /// Creates toggle button to switch between states onChanged.
  const GFToggle(
      {Key? key,
      required this.onChanged,
      required this.value,
      this.enabledText,
      this.disabledText,
      this.enabledTextStyle,
      this.enabledThumbColor,
      this.enabledTrackColor,
      this.disabledTextStyle,
      this.disabledTrackColor,
      this.disabledThumbColor,
      this.type,
      this.boxShape,
      this.borderRadius,
      this.duration = const Duration(milliseconds: 400)})
      : super(key: key);

  ///type [String] used to add custom text i.e, ON,ENABLE
  ///please add only 4 character in this string.
  final String? enabledText;

  ///type [String] used to add custom text i.e, ON,DISABLE
  ///please add only 4 character in this string.
  final String? disabledText;

  ///type of [TextStyle] used to define the style properties of the enabled text
  final TextStyle? enabledTextStyle;

  ///type of [TextStyle] used to define the style peoperties of the disabled text
  final TextStyle? disabledTextStyle;

  ///type of [Color] used for the active thumb color
  final Color? enabledThumbColor;

  ///type of [Color] used for the inactive thumb color
  final Color? disabledThumbColor;

  ///type of [Color] used for the active track color
  final Color? enabledTrackColor;

  ///type of [Color] used for the inactive thumb color
  final Color? disabledTrackColor;

  ///type of [BoxShape] used to define shapes i.e, Circle , Rectangle
  final BoxShape? boxShape;

  ///type of [BorderRadius] used to define the radius of the Container
  final BorderRadius? borderRadius;

  ///type of animation [Duration] called when the switch animates during the specific duration
  final Duration duration;

  /// Button type of [GFToggleType] i.e, android, ios, custom, sqaure
  final GFToggleType? type;

  /// This property must not be null. Used to set the current state of toggle
  final bool value;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool?> onChanged;
  @override
  _GFToggleState createState() => _GFToggleState();
}

class _GFToggleState extends State<GFToggle> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  late AnimationController controller;
  late Animation<Offset> offset;
  late bool isOn;
  @override
  void initState() {
    isOn = widget.value;
    controller = AnimationController(duration: widget.duration, vsync: this);
    offset = (isOn
            ? Tween<Offset>(
                begin: const Offset(1.28, 0),
                end: Offset.zero,
              )
            : Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(1.28, 0),
              ))
        .animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    controller.dispose();
    super.dispose();
  }

  void onStatusChange() {
    setState(() {
      isOn = !isOn;
    });
    switch (controller.status) {
      case AnimationStatus.dismissed:
        controller.forward();
        break;
      case AnimationStatus.completed:
        controller.reverse();
        break;
      default:
    }
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            height: widget.type == GFToggleType.android ? 25 : 30,
            width: widget.type == GFToggleType.android ? 46.5 : 55,
          ),
          Positioned(
            top: 5,
            child: InkWell(
              borderRadius: widget.type == GFToggleType.square
                  ? const BorderRadius.all(Radius.circular(0))
                  : widget.borderRadius ??
                      const BorderRadius.all(Radius.circular(20)),
              onTap: onStatusChange,
              child: Container(
                width: widget.type == GFToggleType.ios ? 54 : 46,
                height: widget.type == GFToggleType.ios ? 25 : 18,
                decoration: BoxDecoration(
                    color: isOn
                        ? widget.enabledTrackColor ?? Colors.lightGreen
                        : widget.disabledTrackColor ?? Colors.grey,
                    borderRadius: widget.type == GFToggleType.square
                        ? const BorderRadius.all(Radius.circular(0))
                        : widget.borderRadius ??
                            const BorderRadius.all(Radius.circular(20))),
                padding: widget.type == GFToggleType.ios
                    ? const EdgeInsets.only(
                        left: 3.5,
                        right: 3.5,
                      )
                    : const EdgeInsets.only(
                        left: 7,
                        right: 7,
                      ),
                child: isOn
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          (widget.enabledText != null &&
                                      widget.enabledText!.length > 4
                                  ? widget.enabledText?.substring(0, 4)
                                  : widget.enabledText) ??
                              (widget.type == GFToggleType.custom ? 'ON' : ''),
                          style: widget.enabledTextStyle ??
                              (widget.type == GFToggleType.ios
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 12)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 8)),
                        ))
                    : Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          (widget.disabledText != null &&
                                      widget.disabledText!.length > 4
                                  ? widget.disabledText?.substring(0, 4)
                                  : widget.disabledText) ??
                              (widget.type == GFToggleType.custom ? 'OFF' : ''),
                          style: widget.disabledTextStyle ??
                              (widget.type == GFToggleType.ios
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 12)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 8)),
                        )),
              ),
            ),
          ),
          Positioned(
            top: widget.type == GFToggleType.ios ? 6.5 : 3,
            left: widget.type == GFToggleType.ios ? 3 : 0,
            child: InkWell(
              onTap: onStatusChange,
              child: SlideTransition(
                position: offset,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: widget.type == GFToggleType.square
                        ? BoxShape.rectangle
                        : widget.boxShape ?? BoxShape.circle,
                    color: isOn
                        ? widget.enabledThumbColor ?? Colors.white
                        : widget.disabledThumbColor ?? Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
