import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../types/gf_toggle_type.dart';

class GFToggle extends StatefulWidget {
  GFToggle(
      {Key key,
      @required this.onChanged,
      @required this.value,
      this.enabledText,
      this.disabledText,
      this.enabledTextColor,
      this.enabledThumbColor,
      this.enabledTrackColor,
      this.disabledTextColor,
      this.disabledTrackColor,
      this.disabledThumbColor,
      this.type,
      this.boxShape,
      this.borderRadius,
      this.duration})
      : super(key: key);


  ///type String used to add custom text like ON,  in custom toggle
  final String enabledText;

  ///type String used to add custom text like ON,  in custom toggle
  final String disabledText;

  ///type of TextStyle used to define the style peoperties of the active text
  final TextStyle enabledTextColor;

  ///type of TextStyle used to define the style peoperties of the inactive text
  final TextStyle disabledTextColor;

  ///type of Color used for the active thumb color
  final Color enabledThumbColor;

  ///type of Color used for the inactive thumb color
  final Color disabledThumbColor;

  ///type of Color used for the active track color
  final Color enabledTrackColor;

  ///type of Color used for the inactive thumb color
  final Color disabledTrackColor;

  ///type of boxShape used to define shapes like Circle , Rectangle
  final BoxShape boxShape;

  ///type of borderRadius used to define the radius of the Container
  final BorderRadius borderRadius;

  ///type of animation duration called when the switch animates during the specific duration
  final Duration duration;

 /// Button type of [GFToggleType] i.e, android, ios, custom, sqaure
  GFToggleType type;

  /// This property must not be null.
  final bool value;

  ///the state used to toggle the switch for true or false
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
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0)).animate(controller);
  }

  @override
  void dispose() {
    animationController.dispose();
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
        widget.onChanged(isOn);
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
                    padding: EdgeInsets.only(left: 3, right: 3, top: 3.4),
                    child: isOn
                        ? Text(
                            widget.enabledText ??
                                    widget.type == GFToggleType.custom
                                ? 'ON'
                                : '',
                            style: widget.enabledTextColor ??
                                TextStyle(color: Colors.white, fontSize: 8),
                          )
                        : Text(
                            widget.disabledText ??
                                    widget.type == GFToggleType.custom
                                ? 'OFF'
                                : '',
                            textAlign: TextAlign.end,
                            style: widget.disabledTextColor ??
                                TextStyle(color: Colors.white, fontSize: 8),
                          ))),
          ),
          Positioned(
              top: widget.type == GFToggleType.ios ? 7 : 3,
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
                    widget.onChanged(isOn);
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
                          color: widget.enabledThumbColor ?? Colors.white,
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 6.0,
                                spreadRadius: 0.0),
                          ]),
                    ),
                  )
              )
          ),
        ],
      ),
    );
  }
}
