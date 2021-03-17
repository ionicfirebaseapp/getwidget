import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

class GFToast extends StatefulWidget {
  ///Creates [GFToast] that can be used to display quick warning or error messages.
  /// Toast has to be wrap inside the body like [GFFloatingWidget]. See [GFFloatingWidget]
  const GFToast({
    Key? key,
    this.child,
    this.button,
    this.backgroundColor,
    this.text,
    this.width,
    this.type = GFToastType.basic,
    this.autoDismiss = true,
    this.alignment,
    this.animationDuration = const Duration(milliseconds: 300),
    this.duration = const Duration(milliseconds: 300),
    this.textStyle = const TextStyle(color: Colors.white70),
    this.autoDismissDuration = const Duration(milliseconds: 3000),
  }) : super(key: key);

  /// child of  type [Widget]is alternative to text key. text will get priority over child
  final Widget? child;

  /// button of type [Widget],or you can use [GFButton] for easy implementation with [GFToast]
  final Widget? button;

  ///pass color of type [Color] or [GFColors] for background of [GFToast]
  final Color? backgroundColor;

  /// text of type [String] is alternative to child. text will get priority over child
  final String? text;

  /// textStyle of type [textStyle] will be applicable to text only and not for the child
  final TextStyle textStyle;

  /// width of type [double] used to control the width of the [GFToast]
  final double? width;

  ///type of [GFToastType] which takes the type ie, basic, rounded and fullWidth for the [GFToast]
  final GFToastType type;

  ///type of [bool] which takes bool values ie, true or false to automatically hide the [GFToast] message
  final bool autoDismiss;

  ///type of [Duration] which takes the duration of the fade in animation
  final Duration animationDuration;

  ///type of [Duration] which takes the duration of the animation
  final Duration duration;

  ///type of [Duration] which takes the duration of the autoDismiss
  final Duration autoDismissDuration;

  /// type of [Alignment] used to align the text inside the toast
  final Alignment? alignment;

  @override
  _GFToastState createState() => _GFToastState();
}

class _GFToastState extends State<GFToast> with TickerProviderStateMixin {
  late AnimationController animationController, fadeAnimationController;
  late Animation<double> animation, fadeAnimation;
  Timer? timer;
  bool hideToast = false;

  @override
  void initState() {
    animationController =
        AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    if (mounted) {
      animationController.forward();
      fadeAnimationController =
          AnimationController(duration: widget.animationDuration, vsync: this)
            ..addListener(() => setState(() {}));
      fadeAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(fadeAnimationController);
      timer = Timer(widget.duration, () {
        if (mounted) {
          fadeAnimationController.forward();
        }
      });
      fadeAnimation = Tween<double>(
        begin: 1,
        end: 0,
      ).animate(fadeAnimationController);
      fadeAnimation.addStatusListener((AnimationStatus state) {
        if (fadeAnimation.isCompleted && widget.autoDismiss) {
          setState(() {
            hideToast = true;
          });
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    fadeAnimationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => hideToast
      ? Container()
      : FadeTransition(
          opacity: widget.autoDismiss ? fadeAnimation : animation,
          child: Column(
            children: <Widget>[
              Container(
                width: widget.type == GFToastType.fullWidth
                    ? MediaQuery.of(context).size.width
                    : widget.width ?? MediaQuery.of(context).size.width * 0.885,
                constraints: const BoxConstraints(minHeight: 50),
                margin: widget.type == GFToastType.fullWidth
                    ? const EdgeInsets.only(left: 0, right: 0)
                    : const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: widget.type == GFToastType.basic
                        ? BorderRadius.circular(0)
                        : widget.type == GFToastType.rounded
                            ? BorderRadius.circular(10)
                            : BorderRadius.zero,
                    color: widget.backgroundColor ?? const Color(0xff323232),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.40),
                        blurRadius: 6,
                      )
                    ]),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 7,
                      fit: FlexFit.tight,
                      child: Align(
                        alignment: widget.alignment ?? Alignment.topLeft,
                        child: widget.text != null
                            ? Text(widget.text!, style: widget.textStyle)
                            : (widget.child ?? Container()),
                      ),
                    ),
                    const SizedBox(
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
