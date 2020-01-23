import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

/// A toggle button allows the user to change a setting between two states.
///
/// The state of each button is controlled by [isSelected], which is a list of bools that determine
/// if a button is in an unselected or selected state. They are both
/// correlated by their index in the list. The length of [isSelected] has to
/// match the length of the [children] list.
///
/// ## Customizing toggle buttons
/// Each toggle's behavior can be configured by the [onPressed] callback, which
/// can update the [isSelected] list however it wants to.
class GFToggle extends StatefulWidget {
  /// Creates toggle button to switch between states onChanged.
  GFToggle(
      {Key key,
      @required this.onChanged,
      @required this.value,
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
  final String enabledText;

  ///type [String] used to add custom text i.e, ON,DISABLE
  final String disabledText;

  ///type of [TextStyle] used to define the style properties of the enabled text
  final TextStyle enabledTextStyle;

  ///type of [TextStyle] used to define the style peoperties of the disabled text
  final TextStyle disabledTextStyle;

  ///type of [Color] used for the active thumb color
  final Color enabledThumbColor;

  ///type of [Color] used for the inactive thumb color
  final Color disabledThumbColor;

  ///type of [Color] used for the active track color
  final Color enabledTrackColor;

  ///type of [Color] used for the inactive thumb color
  final Color disabledTrackColor;

  ///type of [BoxShape] used to define shapes i.e, Circle , Rectangle
  final BoxShape boxShape;

  ///type of [BorderRadius] used to define the radius of the Container
  final BorderRadius borderRadius;

  ///type of animation [Duration] called when the switch animates during the specific duration
  final Duration duration;

  /// Button type of [GFToggleType] i.e, android, ios, custom, sqaure
  final GFToggleType type;

  /// This property must not be null. Used to set the current state of toggle
  final bool value;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool> onChanged;

  @override
  _GFToggleState createState() => _GFToggleState();
}

class _GFToggleState extends State<GFToggle> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  AnimationController controller;
  Animation<Offset> offset;

  bool isOn = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(controller);
  }

  @override
  void dispose() {
    if (animationController != null) animationController.dispose();
    if (controller != null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
        if (widget.onChanged != null) {
          widget.onChanged(isOn);
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.type == GFToggleType.android ? 25 : 30,
            width: widget.type == GFToggleType.android ? 40 : 50,
          ),
          Positioned(
            top: 5,
            child: Container(
                width: widget.type == GFToggleType.ios ? 45 : 36,
                height: widget.type == GFToggleType.ios ? 25 : 15,
                decoration: BoxDecoration(
                    color: isOn
                        ? widget.enabledTrackColor ?? Colors.lightGreen
                        : widget.disabledTrackColor ?? Colors.grey,
                    borderRadius: widget.type == GFToggleType.square
                        ? BorderRadius.all(Radius.circular(0))
                        : widget.borderRadius ??
                            BorderRadius.all(Radius.circular(20))),
                child: Padding(
                    padding: widget.type == GFToggleType.ios
                        ? EdgeInsets.only(left: 3.5, right: 3.5, top: 5.4)
                        : EdgeInsets.only(left: 3, right: 3, top: 3.4),
                    child: isOn
                        ? Text(
                            widget.enabledText ??
                                (widget.type == GFToggleType.custom
                                    ? 'ON'
                                    : ''),
                            style: widget.enabledTextStyle ??
                                (widget.type == GFToggleType.ios
                                    ? TextStyle(
                                        color: Colors.white, fontSize: 12)
                                    : TextStyle(
                                        color: Colors.white, fontSize: 8)))
                        : Text(
                            widget.disabledText ??
                                (widget.type == GFToggleType.custom
                                    ? 'OFF'
                                    : ''),
                            textAlign: TextAlign.end,
                            style: widget.disabledTextStyle ??
                                (widget.type == GFToggleType.ios
                                    ? TextStyle(color: Colors.white, fontSize: 12)
                                    : TextStyle(color: Colors.white, fontSize: 8))))),
          ),
          Positioned(
              top: widget.type == GFToggleType.ios ? 7.5 : 3,
              left: widget.type == GFToggleType.ios ? 2 : 0,
              child: GestureDetector(
                  onTap: () {
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
                    if (widget.onChanged != null) {
                      widget.onChanged(isOn);
                    }
                  },
                  child: SlideTransition(
                    position: offset,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: widget.type == GFToggleType.square
                              ? BoxShape.rectangle
                              : widget.boxShape ?? BoxShape.circle,
                          color: isOn
                              ? widget.enabledThumbColor ?? Colors.white
                              : widget.disabledThumbColor ?? Colors.white,
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 6.0,
                                spreadRadius: 0.0),
                          ]),
                    ),
                  ))),
        ],
      ),
    );
  }
}
