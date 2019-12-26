import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../types/gf_toggle_type.dart';



class GFToggle extends StatefulWidget {
  GFToggle({Key key,
    @required this.onChanged,
    @required this.value,
    this.activeColor,
//    this.inactiveColor,
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
    this.borderRadius



  }) :super(key: key);



  final String enabledText;
  final String disabledText;
  final TextStyle enabledTextColor;
  final Color enabledThumbColor;
  final Color enabledTrackColor;
  final TextStyle disabledTextColor;
  final Color disabledThumbColor;
  final Color disabledTrackColor;
  final BoxShape boxShape;
  final BorderRadius borderRadius;



//  /// Button type of [GFToggleType] i.e, android, ios, labeledSwitch, animatedSWitch
  GFToggleType type;

  ///A android
  ///
  /// The color to use on the track when this switch is on.
  final Color activeColor;


  /// Whether this switch is on or off.
  ///
  /// This property must not be null.
  final bool value;

  ///the state used to toggle the switch for true or false
  final ValueChanged<bool> onChanged;



  @override
  _GFToggleState createState() => _GFToggleState();
}

class _GFToggleState extends State<GFToggle> with TickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> animation;
  AnimationController controller;
  Animation<Offset> offset;

  bool isOn = false;


  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(controller);


  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
//    if (widget.type == GFToggleType.android)
//    {
      return  GestureDetector(
        onTap: (){
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
        child:   Stack(
          children: <Widget>[
            Container(
              height: widget.type == GFToggleType.android? 25: 30,
              width:widget.type == GFToggleType.android ? 40 :50,
//                    color:Colors.blue
            ),
            Positioned(
              top:5,
              child: Container(

                  width: widget.type == GFToggleType.ios ? 45 :  36,
                  height:  widget.type == GFToggleType.ios ? 25 : 15,
                  decoration: BoxDecoration(
                      color: isOn ? widget.enabledTrackColor??Colors.lightGreen: widget.disabledTrackColor ?? Colors.grey,
                      borderRadius: widget.type == GFToggleType.square?BorderRadius.all(Radius.circular(0)): widget.borderRadius ?? BorderRadius.all(Radius.circular(20))

                  ),
                  child:
                  Padding(padding: EdgeInsets.only(left: 3, right: 3, top: 3.4), child:
                  isOn?

                Text( widget.enabledText ?? widget.type== GFToggleType.custom?'ON':'',style: widget.enabledTextColor?? TextStyle(color: Colors.white, fontSize: 8),):
                  Text(widget.disabledText ??  widget.type== GFToggleType.custom?'OFF':'', textAlign: TextAlign.end, style: widget.disabledTextColor?? TextStyle(color: Colors.white, fontSize: 8),))

              ),
            ),
            Positioned(
                top:  widget.type == GFToggleType.ios?7 : 3,
                left: widget.type == GFToggleType.ios?2 : 0,
                child: GestureDetector(
                    onTap: (){
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
                    child:  SlideTransition(
                      position: offset,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: widget.type == GFToggleType.square ? BoxShape.rectangle : widget.boxShape ?? BoxShape.circle,
                            color: widget.enabledThumbColor ?? Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 6.0,
                                  spreadRadius: 0.0),
                            ]
                        ),
                      ),
                    )
                )
            ),

          ],
        ),
      );
//    } else if (widget.type == GFToggleType.ios) {
//      return (Container());
//
//    } else if (widget.type == GFToggleType.labeledSwitch){
//      return Switch(value: null, onChanged: null,
//
//
//
//      );
//
//
//    }
  }
}



//
//enum TextTransitionTypes { ROTATE, SCALE, FADE, SIZE }
//
//class LabeledToggle extends StatefulWidget {
//  final Widget child;
//  final String onText;
//  final String offText;
//  final Color onTextColor;
//  final Color offTextColor;
//  final Color onThumbColor;
//  final Color offThumbColor;
//  final Color onBorderColor;
//  final Color offBorderColor;
//  final Color onBkColor;
//  final Color offBkColor;
//  final bool value;
//  final double thumbSize;
//  final double borderSize;
//  final Duration duration;
//  final Curve curve;
//  final ValueChanged<bool> onChanged;
//  final bool forceWidth;
//  final bool rounded;
//  final TextTransitionTypes transitionType;
//  final bool rotationAnimation;
//
//  const LabeledToggle(
//      {Key key,
//        this.value = false,
//        this.onText = "",
//        this.offText = "",
//        this.onThumbColor,
//        this.offThumbColor,
//        this.onBorderColor,
//        this.offBorderColor,
//        this.onBkColor,
//        this.offBkColor,
//        this.onChanged,
//        @required this.thumbSize,
//        this.duration = const Duration(milliseconds: 400),
//        this.curve = Curves.linear,
//        this.forceWidth = false,
//        this.onTextColor = Colors.black,
//        this.offTextColor = Colors.black,
//        this.rounded = true,
//        this.borderSize = 1.0,
//        this.transitionType = TextTransitionTypes.SCALE,
//        this.rotationAnimation = false,
//        this.child})
//      : assert(thumbSize != null),
//        super(key: key);
//
//  const LabeledToggle.theme(
//      {Key key,
//        this.value = false,
//        this.onText = "",
//        this.offText = "",
//        @required onColor,
//        @required offColor,
//        this.onChanged,
//        @required this.thumbSize,
//        this.duration = const Duration(milliseconds: 400),
//        this.curve = Curves.linear,
//        this.forceWidth = false,
//        this.rounded = true,
//        this.borderSize = 1.0,
//        this.transitionType = TextTransitionTypes.SCALE,
//        this.rotationAnimation = false,
//        this.child})
//      : assert(thumbSize != null),
//        onThumbColor = offColor,
//        onBorderColor = offColor,
//        onBkColor = onColor,
//        offThumbColor = onColor,
//        offBorderColor = onColor,
//        offBkColor = offColor,
//        onTextColor = offColor,
//        offTextColor = onColor,
//        super(key: key);
//
//  @override
//  _LabeledToggleState createState() => _LabeledToggleState();
//}
//
//class _LabeledToggleState extends State<LabeledToggle>
//    with SingleTickerProviderStateMixin {
//  bool _value;
//  AnimationController animationController;
//  Animation<double> animation;
//
//  @override
//  void initState() {
//    super.initState();
//    _value = widget.value;
//    animationController =
//        AnimationController(vsync: this, duration: widget.duration);
//    CurvedAnimation curvedAnimation =
//    CurvedAnimation(parent: animationController, curve: widget.curve);
//    animation = Tween<double>(begin: 0.0, end: 180.0).animate(curvedAnimation)
//      ..addListener(() {
//        setState(() {});
//      });
//  }
//
//  @override
//  void dispose() {
//    animationController.dispose();
//
//    super.dispose();
//  }
//
//  @override
//  void didUpdateWidget(LabeledToggle oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    _value = widget.value;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        widget.onChanged == null ? print("") : widget.onChanged(!_value);
//        if (widget.rotationAnimation) {
//          if (animationController.status == AnimationStatus.completed) {
//            animationController.reverse();
//          } else {
//            animationController.forward();
//          }
//        }
//      },
//      child: Opacity(
//        opacity: widget.onChanged == null ? 0.3 : 1.0,
//        child: AnimatedContainer(
//          duration: widget.duration,
//          height: widget.thumbSize,
//          width: widget.forceWidth ? widget.thumbSize * 1.7 : null,
//          child: Stack(
//            children: <Widget>[
//          Padding(
//          padding: const EdgeInsets.only(top:1.5, bottom: 1.5),
//          child: AnimatedAlign(
//            curve: widget.curve,
//
//            alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
//            duration: widget.duration,
//            child: RotationTransition(
//              turns: AlwaysStoppedAnimation(animation.value / 360),
//              child: AnimatedContainer(
//                duration: widget.duration,
//                width: widget.thumbSize,
//                height: widget.thumbSize,
//                child: widget?.child,
//                decoration: BoxDecoration(
//                  shape: widget.rounded ? BoxShape.circle : BoxShape.rectangle,
//                  color: _value ? widget.onThumbColor : widget.offThumbColor,
//                ),
//              ),
//            ),
//          ),
//        ),
//              Padding(
//                padding: EdgeInsets.only(
//                    right: _value ? widget.thumbSize : 1,
//                    left: _value ? 1.0 : widget.thumbSize),
//                child: Row(
//                  children: <Widget>[
////          Expanded(child: Text('l')),
//                    Expanded(
//                      child: Padding(
//                        padding: const EdgeInsets.all(0),
//                        child: Container(
//                          height: widget.thumbSize,
//                          child: FittedBox(
//                            child: Center(
//                              child: AnimatedSwitcher(
//                                duration: widget.duration,
//                                switchInCurve: widget.curve,
//                                switchOutCurve: widget.curve,
//                                transitionBuilder:
//                                    (Widget child, Animation<double> animation) {
//                                  switch (widget.transitionType) {
//                                    case TextTransitionTypes.ROTATE:
//                                      {
//                                        return RotationTransition(
//                                          child: child,
//                                          turns: animation,
//                                        );
//                                      }
//                                      break;
//                                    case TextTransitionTypes.FADE:
//                                      {
//                                        return FadeTransition(
//                                          child: child,
//                                          opacity: animation,
//                                        );
//                                      }
//                                      break;
//
//                                    case TextTransitionTypes.SIZE:
//                                      {
//                                        return SizeTransition(
//                                          child: child,
//                                          sizeFactor: animation,
//                                          axisAlignment: widget.value ? -5.0 : 5.0,
//                                          axis: Axis.horizontal,
//                                        );
//                                      }
//                                      break;
//
//                                    case TextTransitionTypes.SCALE:
//                                      {
//                                        return ScaleTransition(
//                                          child: child,
//                                          scale: animation,
//                                        );
//                                      }
//                                      break;
//                                  }
//                                },
//                                child: Text(
//                                  _value ? widget.onText : widget.offText,
//                                  key: ValueKey<bool>(_value),
//                                  style: TextStyle(
//                                      color: _value
//                                          ? widget.onTextColor
//                                          : widget.offTextColor),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              )
//            ],
//          ),
//          decoration: BoxDecoration(
//              border: Border.all(
//                  color: widget.onChanged == null
//                      ? Color(0xFFD3D3D3)
//                      : _value
//                      ? (widget.onBorderColor ?? widget.onThumbColor)
//                      : (widget.offBorderColor ?? widget.offThumbColor),
//                  width: widget.borderSize),
//              color: _value ? widget.onBkColor : widget.offBkColor,
//              borderRadius:
//              BorderRadius.circular(widget.rounded ? 100.0 : 0.0)),
//        ),
//      ),
//    );
//  }
//
//
//  }


//
//
//enum TextTransitionTypes { ROTATE, SCALE, FADE, SIZE }
//
//class LabeledToggle extends StatefulWidget {
//  final Widget child;
//  final String onText;
//  final String offText;
//  final Color onTextColor;
//  final Color offTextColor;
//  final Color onThumbColor;
//  final Color offThumbColor;
//  final Color onBorderColor;
//  final Color offBorderColor;
//  final Color onBkColor;
//  final Color offBkColor;
//  final bool value;
//  final double thumbSize;
//  final double borderSize;
//  final Duration duration;
//  final Curve curve;
//  final ValueChanged<bool> onChanged;
//  final bool forceWidth;
//  final bool rounded;
//  final TextTransitionTypes transitionType;
//  final bool rotationAnimation;
//
//  const LabeledToggle(
//      {Key key,
//        this.value = false,
//        this.onText = "",
//        this.offText = "",
//        this.onThumbColor,
//        this.offThumbColor,
//        this.onBorderColor,
//        this.offBorderColor,
//        this.onBkColor,
//        this.offBkColor,
//        this.onChanged,
//        @required this.thumbSize,
//        this.duration = const Duration(milliseconds: 400),
//        this.curve = Curves.linear,
//        this.forceWidth = false,
//        this.onTextColor = Colors.black,
//        this.offTextColor = Colors.black,
//        this.rounded = true,
//        this.borderSize = 1.0,
//        this.transitionType = TextTransitionTypes.SCALE,
//        this.rotationAnimation = false,
//        this.child})
//      : assert(thumbSize != null),
//        super(key: key);
//
//  const LabeledToggle.theme(
//      {Key key,
//        this.value = false,
//        this.onText = "",
//        this.offText = "",
//        @required onColor,
//        @required offColor,
//        this.onChanged,
//        @required this.thumbSize,
//        this.duration = const Duration(milliseconds: 400),
//        this.curve = Curves.linear,
//        this.forceWidth = false,
//        this.rounded = true,
//        this.borderSize = 1.0,
//        this.transitionType = TextTransitionTypes.SCALE,
//        this.rotationAnimation = false,
//        this.child})
//      : assert(thumbSize != null),
//        onThumbColor = offColor,
//        onBorderColor = offColor,
//        onBkColor = onColor,
//        offThumbColor = onColor,
//        offBorderColor = onColor,
//        offBkColor = offColor,
//        onTextColor = offColor,
//        offTextColor = onColor,
//        super(key: key);
//
//  @override
//  _LabeledToggleState createState() => _LabeledToggleState();
//}
//
//class _LabeledToggleState extends State<LabeledToggle>
//    with SingleTickerProviderStateMixin {
//  bool _value;
//  AnimationController animationController;
//  Animation<double> animation;
//
//  @override
//  void initState() {
//    super.initState();
//    _value = widget.value;
//    animationController =
//        AnimationController(vsync: this, duration: widget.duration);
//    CurvedAnimation curvedAnimation =
//    CurvedAnimation(parent: animationController, curve: widget.curve);
//    animation = Tween<double>(begin: 0.0, end: 180.0).animate(curvedAnimation)
//      ..addListener(() {
//        setState(() {});
//      });
//  }
//
//  @override
//  void dispose() {
//    animationController.dispose();
//
//    super.dispose();
//  }
//
//  @override
//  void didUpdateWidget(LabeledToggle oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    _value = widget.value;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        widget.onChanged == null ? print("") : widget.onChanged(!_value);
//        if (widget.rotationAnimation) {
//          if (animationController.status == AnimationStatus.completed) {
//            animationController.reverse();
//          } else {
//            animationController.forward();
//          }
//        }
//      },
//      child:
//
//      Opacity(
//        opacity: widget.onChanged == null ? 0.3 : 1.0,
//        child: AnimatedContainer(
//          duration: widget.duration,
//          height: 20,
//          width: 40,
////          width: widget.forceWidth ? widget.thumbSize * 1.4 : null,
//          child: Stack(
//            children: <Widget>[
//              AnimatedAlign(
//                curve: widget.curve,
//                alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
//                duration: widget.duration,
//                child: RotationTransition(
//                  turns: AlwaysStoppedAnimation(animation.value / 360),
//                  child: AnimatedContainer(
//
//                    duration: widget.duration,
//                    width: widget.thumbSize,
//                    height: 150,
//                    child: widget?.child,
//                    decoration: BoxDecoration(
//                      shape: widget.rounded ? BoxShape.circle : BoxShape.rectangle,
//                      color: _value ? widget.onThumbColor : widget.offThumbColor,
//                    ),
//                  ),
//                ),
//              ),
//             Positioned(
//
//                 child:  Padding(
//               padding: EdgeInsets.only(
//                   right: _value ? widget.thumbSize : 1,
//                   left: _value ? 2.0 : widget.thumbSize),
//               child: Row(
//                 children: <Widget>[
////          Expanded(child: Text('l')),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(0),
//                       child: Container(
//                         width: 80,
//                         height: 100,
//                         child: FittedBox(
//                           child: Center(
//                             child: AnimatedSwitcher(
//                               duration: widget.duration,
//                               switchInCurve: widget.curve,
//                               switchOutCurve: widget.curve,
//                               transitionBuilder:
//                                   (Widget child, Animation<double> animation) {
//                                 switch (widget.transitionType) {
//                                   case TextTransitionTypes.ROTATE:
//                                     {
//                                       return RotationTransition(
//                                         child: child,
//                                         turns: animation,
//                                       );
//                                     }
//                                     break;
//                                   case TextTransitionTypes.FADE:
//                                     {
//                                       return FadeTransition(
//                                         child: child,
//                                         opacity: animation,
//                                       );
//                                     }
//                                     break;
//
//                                   case TextTransitionTypes.SIZE:
//                                     {
//                                       return SizeTransition(
//                                         child: child,
//                                         sizeFactor: animation,
//                                         axisAlignment: widget.value ? -5.0 : 5.0,
//                                         axis: Axis.horizontal,
//                                       );
//                                     }
//                                     break;
//
//                                   case TextTransitionTypes.SCALE:
//                                     {
//                                       return ScaleTransition(
//                                         child: child,
//                                         scale: animation,
//                                       );
//                                     }
//                                     break;
//                                 }
//                               },
//                               child: Text(
//                                 _value ? widget.onText : widget.offText,
//                                 key: ValueKey<bool>(_value),
//                                 style: TextStyle(
//                                     color: _value
//                                         ? widget.onTextColor
//                                         : widget.offTextColor),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ))
//            ],
//          ),
//          decoration: BoxDecoration(
//              border: Border.all(
//                  color: widget.onChanged == null
//                      ? Color(0xFFD3D3D3)
//                      : _value
//                      ? (widget.onBorderColor ?? widget.onThumbColor)
//                      : (widget.offBorderColor ?? widget.offThumbColor),
//                  width: widget.borderSize),
//              color: _value ? widget.onBkColor : widget.offBkColor,
//              borderRadius:
//              BorderRadius.circular(widget.rounded ? 100.0 : 0.0)),
//        ),
//      ),
//    );
//  }
//
//
//}





enum TextTransitionTypes { ROTATE, SCALE, FADE, SIZE }

class LabeledToggle extends StatefulWidget {
//  final Widget child;

  final String enabledText;
  final String disabledText;
  final TextStyle enabledTextColor;
  final Color enabledThumbColor;
  final Color enabledTrackColor;
  final TextStyle disabledTextColor;
  final Color disabledThumbColor;
  final Color disabledTrackColor;
  final bool value;
  final double borderSize;
  final Duration duration;
  final Curve curve;
  final ValueChanged<bool> onChanged;
  final bool forceWidth;
  final bool rounded;
  final  BoxShape boxShape;
  final TextTransitionTypes transitionType;
  final bool rotationAnimation;

  const LabeledToggle(
      {Key key,
        this.value = false,
        this.enabledText ,
        this.disabledText ,
        this.enabledTextColor,
        this.enabledThumbColor,
        this.enabledTrackColor,
        this.disabledTextColor,
        this.disabledThumbColor,
        this.disabledTrackColor,
        this.onChanged,

        this.duration = const Duration(milliseconds: 400),
        this.curve = Curves.linear,
        this.forceWidth = false,
        this.rounded = true,
        this.borderSize = 1.0,
        this.transitionType = TextTransitionTypes.SCALE,
        this.rotationAnimation = false,
        this.boxShape
        })
      :
        super(key: key);

//  const LabeledToggle.theme(
//      {Key key,
//        this.value = false,
//        this.onText = "",
//        this.offText = "",
//        @required onColor,
//        @required offColor,
//        this.onChanged,
//        @required this.thumbSize,
//        this.duration = const Duration(milliseconds: 400),
//        this.curve = Curves.linear,
//        this.forceWidth = false,
//        this.rounded = true,
//        this.borderSize = 1.0,
//        this.transitionType = TextTransitionTypes.SCALE,
//        this.rotationAnimation = false,
//        this.child})
//      : assert(thumbSize != null),
//        onThumbColor = offColor,
//        onBorderColor = offColor,
//        onBkColor = onColor,
//        offThumbColor = onColor,
//        offBorderColor = onColor,
//        offBkColor = offColor,
//        onTextColor = offColor,
//        offTextColor = onColor,
//        super(key: key);

  @override
  _LabeledToggleState createState() => _LabeledToggleState();
}

class _LabeledToggleState extends State<LabeledToggle>
    with TickerProviderStateMixin {
  bool _value;


  AnimationController animationController;
  Animation<double> animation;
  AnimationController controller;
  Animation<Offset> offset;

  bool isOn = false;


  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(controller);
    _value = widget.value;

  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(LabeledToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          isOn = !isOn;
        });
        print(controller.status);
        switch (controller.status) {
          case AnimationStatus.dismissed:
            controller.forward();
            break;
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
        }

      },
      child:   Stack(
        children: <Widget>[
          Container(
            height: 25,
            width:40,
//                    color:Colors.blue
          ),
          Positioned(
            top:5,
            child: Container(
                width: 36,
                height: 15,
                decoration: BoxDecoration(
                    color: isOn ? widget.enabledTrackColor??Colors.lightGreen: widget.disabledTrackColor ?? Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20))

                ),
                child:
                Padding(padding: EdgeInsets.only(left: 3, right: 3, top: 3.4), child:
                isOn?

                Text( widget.enabledText ?? 'ON',style: widget.enabledTextColor?? TextStyle(color: Colors.white, fontSize: 8),):
                Text(widget.disabledText ?? 'OFF', textAlign: TextAlign.end, style: widget.disabledTextColor?? TextStyle(color: Colors.white, fontSize: 8),))

            ),
          ),
          Positioned(
              top: 3,
              child: GestureDetector(
                  onTap: (){
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
                  },
                  child:  SlideTransition(
                    position: offset,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: widget.boxShape ?? BoxShape.circle,
                          color: widget.enabledThumbColor ?? Colors.white,
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 6.0,
                                spreadRadius: 0.0),
                          ]
                      ),
                    ),
                  )
              )
          ),

        ],
      ),
    );
//    return GestureDetector(
//      onTap: () {
//        widget.onChanged == null ? print("") : widget.onChanged(!_value);
//        if (widget.rotationAnimation) {
//          if (animationController.status == AnimationStatus.completed) {
//            animationController.reverse();
//          } else {
//            animationController.forward();
//          }
//        }
//      },
//      child:
//
//      Opacity(
//        opacity: widget.onChanged == null ? 0.3 : 1.0,
//        child: AnimatedContainer(
//          duration: widget.duration,
//          height: 20,
//          width: 40,
////          width: widget.forceWidth ? widget.thumbSize * 1.4 : null,
//          child: Stack(
//            children: <Widget>[
//
//              Positioned(
//                top:2,
//                left: 5,
//                child: Container(
//                  width: 30,
//                  height: 12,
//                  decoration: BoxDecoration(
//                      color: Colors.red,
//                      borderRadius: BorderRadius.all(Radius.circular(20))
//
//                  ),
//
//                ),
//              ),
//
//              Positioned(
////                      right:20,
//
//                  child: Container(
//                    height: 25,
//                    width: 25,
//                    decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        color: Colors.white,
//                        boxShadow: [
//                          new BoxShadow(
//                              color: Colors.black.withOpacity(0.16),
//                              blurRadius: 6.0,
//                              spreadRadius: 0.0),
//                        ]
//                    ),
//
//                    child:  AnimatedAlign(
//                      curve: widget.curve,
//                      alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
//                      duration: widget.duration,
//                      child: RotationTransition(
//                        turns: AlwaysStoppedAnimation(animation.value / 360),
//                        child: AnimatedContainer(
//
//                          duration: widget.duration,
//                          width: widget.thumbSize,
//                          height: 150,
//                          child: widget?.child,
//                          decoration: BoxDecoration(
//                            shape: widget.rounded ? BoxShape.circle : BoxShape.rectangle,
//                            color: _value ? widget.onThumbColor : widget.offThumbColor,
//                          ),
//                        ),
//                      ),
//                    ),
//                  )),
//
//
//
//               Padding(
//                    padding: EdgeInsets.only(
//                        right: _value ? widget.thumbSize : 1,
//                        left: _value ? 2.0 : widget.thumbSize),
//                    child:
//                    Stack(
//                      children: <Widget>[
//                        Positioned(
//                          top:2,
//                          left: 5,
//                          child: Container(
//                            width: 30,
//                            height: 12,
//                            decoration: BoxDecoration(
//                                color: Colors.red,
//                                borderRadius: BorderRadius.all(Radius.circular(20))
//
//                            ),
//
//                          ),
//                        ),
//                      ],
//                    )
////                    Row(
////                      children: <Widget>[
////
////                        Expanded(
////                          child: Padding(
////                            padding: const EdgeInsets.all(0),
////                            child: Container(
////                              width: 80,
////                              height: 100,
////                              child: FittedBox(
////                                child: Center(
////                                  child: AnimatedSwitcher(
////                                    duration: widget.duration,
////                                    switchInCurve: widget.curve,
////                                    switchOutCurve: widget.curve,
////                                    transitionBuilder:
////                                        (Widget child, Animation<double> animation) {
////                                      switch (widget.transitionType) {
////                                        case TextTransitionTypes.ROTATE:
////                                          {
////                                            return RotationTransition(
////                                              child: child,
////                                              turns: animation,
////                                            );
////                                          }
////                                          break;
////                                        case TextTransitionTypes.FADE:
////                                          {
////                                            return FadeTransition(
////                                              child: child,
////                                              opacity: animation,
////                                            );
////                                          }
////                                          break;
////
////                                        case TextTransitionTypes.SIZE:
////                                          {
////                                            return SizeTransition(
////                                              child: child,
////                                              sizeFactor: animation,
////                                              axisAlignment: widget.value ? -5.0 : 5.0,
////                                              axis: Axis.horizontal,
////                                            );
////                                          }
////                                          break;
////
////                                        case TextTransitionTypes.SCALE:
////                                          {
////                                            return ScaleTransition(
////                                              child: child,
////                                              scale: animation,
////                                            );
////                                          }
////                                          break;
////                                      }
////                                    },
////                                    child: Text(
////                                      _value ? widget.onText : widget.offText,
////                                      key: ValueKey<bool>(_value),
////                                      style: TextStyle(
////                                          color: _value
////                                              ? widget.onTextColor
////                                              : widget.offTextColor),
////                                    ),
////                                  ),
////                                ),
////                              ),
////                            ),
////                          ),
////                        ),
////                      ],
////                    ),
//                  )
//            ],
//          ),
//          decoration: BoxDecoration(
//              border: Border.all(
//                  color: widget.onChanged == null
//                      ? Color(0xFFD3D3D3)
//                      : _value
//                      ? (widget.onBorderColor ?? widget.onThumbColor)
//                      : (widget.offBorderColor ?? widget.offThumbColor),
//                  width: widget.borderSize),
//              color: _value ? widget.onBkColor : widget.offBkColor,
//              borderRadius:
//              BorderRadius.circular(widget.rounded ? 100.0 : 0.0)),
//        ),
//      ),
//    );
  }


}




