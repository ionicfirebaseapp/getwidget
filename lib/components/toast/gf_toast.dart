import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'gf_floating_widget.dart';

class GFToast extends StatefulWidget {
  ///
  GFToast({
    Key key,
    this.child,
    this.button,
    this.backgroundColor,
    this.text,
    this.width,
    this.textStyle = const TextStyle(color: Colors.white70),
  }) : super(key: key);

  /// child of  type [Widget]is alternative to text key. text will get priority over child
  final Widget child;

  /// button of type [Widget],or you can use [GFButton] for easy implementation with [GFToast]
  final Widget button;

  ///pass color of type [Color] or [GFColor] for background of [GFToast]
  final dynamic backgroundColor;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// textStyle of type [textStyle] will be applicable to text only and not for the child
  final TextStyle textStyle;

  /// width od type [double] used to control the width od the [GFToast]
  final double width;


  @override
  _GFToastState createState() => _GFToastState();
}

class _GFToastState extends State<GFToast> with TickerProviderStateMixin {
  AnimationController controller, _controller;
  Animation<Offset> offset, offset1;
  Animation<double> animation;
  Timer timer;

  bool slide = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(_controller);
    controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  FadeTransition(
      opacity: animation,
      child:
      Column(
        children: <Widget>[
          Container(
            width: widget.width != null? widget.width: null,
            constraints: BoxConstraints(minHeight: 50.0),
//        width: 100,
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: widget.backgroundColor != null
                  ? getGFColor(widget.backgroundColor)
                  : Color(0xff323232),
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 7,
                  fit: FlexFit.tight,
                  child: widget.text != null
                      ? Text(widget.text, style: widget.textStyle)
                      : (widget.child ?? Container()),
                ),
                SizedBox(
                  width: 10,
                ),
                widget.button != null
                    ? Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: widget.button,
                    ))
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
