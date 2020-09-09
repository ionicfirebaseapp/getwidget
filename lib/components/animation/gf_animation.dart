import 'package:flutter/material.dart';

enum GFAnimationType {
  align,
  size,
  container,
  rotateTransition,
  scaleTransition,
  slideTransition,
  textStyle
}

class GFAnimation extends StatefulWidget {
  const GFAnimation({
    Key key,
    this.duration,
    this.alignment,
    this.child,
    this.curve,
    this.type,
    this.width,
    this.height,
    this.activeColor,
    this.color,
    this.padding,
    this.activeAlignment,
    this.onTap,
    this.margin,
    this.turnsAnimation,
    this.scaleAnimation,
    this.controller,
    this.textDirection,
    this.slidePosition,
    this.style,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.textWidthBasis,
  }) : super(key: key);

  final Duration duration;
  final Alignment alignment;
  final Alignment activeAlignment;
  final Widget child;
  final Curve curve;
  final GFAnimationType type;
  final double width;
  final double height;
  final Color activeColor;
  final Color color;
  final EdgeInsets padding, margin;
  final Function onTap;
  final Animation<double> turnsAnimation;
  final Animation<double> scaleAnimation;
  final AnimationController controller;
  final TextDirection textDirection;
  final Animation<Offset> slidePosition;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int maxLines;
  final TextWidthBasis textWidthBasis;

  @override
  _GFAnimationState createState() => _GFAnimationState();
}

class _GFAnimationState extends State<GFAnimation>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  bool expand = false;

  AnimationController controller;
  Animation<double> animation;
  Animation<Offset> offsetAnimation;

  @override
  void initState() {
    if (widget.type == GFAnimationType.rotateTransition) {
      controller = widget.controller ??
          AnimationController(
              duration: widget.duration ?? const Duration(seconds: 2),
              vsync: this);
      animation = widget.turnsAnimation ??
          Tween<double>(begin: 0, end: 20).animate(controller);
      if (widget.turnsAnimation == null) {
        controller.forward();
      }
    } else if (widget.type == GFAnimationType.scaleTransition) {
      controller = widget.controller ??
          AnimationController(
              vsync: this,
              duration: widget.duration ?? const Duration(seconds: 2));
      animation = widget.scaleAnimation ??
          CurvedAnimation(
              parent: controller, curve: widget.curve ?? Curves.ease);
      controller.forward();
    } else if (widget.type == GFAnimationType.slideTransition) {
      controller = AnimationController(
        duration: widget.duration ?? const Duration(seconds: 2),
        vsync: this,
      )..repeat(reverse: true);
      offsetAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1.5, 0),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => getAnimatedTypeWidget();

  Widget buildAnimatedContainerWidget() => GestureDetector(
        onTap: () {
          if (mounted) {
            setState(() {
              selected = !selected;
            });
          }
        },
        child: AnimatedContainer(
          margin: widget.margin ?? const EdgeInsets.all(0),
          padding: widget.padding ?? const EdgeInsets.all(8),
          width: selected ? widget.width ?? 200.0 : 100.0,
          height: selected ? widget.width ?? 100.0 : 200.0,
          color: selected
              ? widget.activeColor ?? Colors.red
              : widget.color ?? Colors.blue,
          alignment: selected
              ? widget.activeAlignment ?? Alignment.center
              : widget.alignment ?? Alignment.center,
          duration: widget.duration ?? const Duration(milliseconds: 2000),
          curve: widget.curve ?? Curves.linear,
          child: widget.child,
        ),
      );

  Widget buildAnimatedAlignWidget() => GestureDetector(
        onTap: () {
          if (mounted) {
            setState(() {
              selected = !selected;
            });
          }
        },
        child: Container(
          margin: widget.margin ?? const EdgeInsets.all(0),
          padding: widget.padding ?? const EdgeInsets.all(0),
          child: AnimatedAlign(
            curve: widget.curve ?? Curves.linear,
            alignment: selected
                ? widget.alignment ?? Alignment.center
                : Alignment.topCenter,
            duration: widget.duration ?? const Duration(seconds: 2),
            child: widget.child,
          ),
        ),
      );

  Widget buildAnimatedSizeWidget() => GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: widget.margin ?? const EdgeInsets.all(0),
          padding: widget.padding ?? const EdgeInsets.all(0),
          color: widget.color ?? Colors.white,
          child: AnimatedSize(
            alignment: widget.alignment ?? Alignment.center,
            curve: widget.curve ?? Curves.linear,
            vsync: this,
            duration: widget.duration ?? const Duration(milliseconds: 2000),
            child: widget.child,
          ),
        ),
      );

  Widget buildRotationTransitionWidget() => RotationTransition(
        turns: animation,
        child: widget.child,
        alignment: widget.alignment,
      );

  Widget buildScaleTransitionWidget() => ScaleTransition(
        child: widget.child,
        scale: animation,
        alignment: widget.alignment ?? Alignment.center,
      );

  Widget buildSlideTransitionWidget() => SlideTransition(
        child: widget.child,
        textDirection: widget.textDirection ?? TextDirection.ltr,
        position: widget.slidePosition ?? offsetAnimation,
      );

  Widget buildAnimatedDefaultTextStyleWidget() => GestureDetector(
        onTap: () {
          if (mounted) {
            setState(() {});
          }
        },
        child: AnimatedDefaultTextStyle(
          maxLines: widget.maxLines,
          style: widget.style ?? const TextStyle(),
          textWidthBasis: widget.textWidthBasis ?? TextWidthBasis.parent,
          textAlign: widget.textAlign ?? TextAlign.start,
          curve: widget.curve ?? Curves.linear,
          duration: widget.duration ?? const Duration(seconds: 2),
          child: widget.child,
        ),
      );

  Widget getAnimatedTypeWidget() {
    switch (widget.type) {
      case GFAnimationType.align:
        return buildAnimatedAlignWidget();
        break;
      case GFAnimationType.container:
        return buildAnimatedContainerWidget();
        break;
      case GFAnimationType.size:
        return buildAnimatedSizeWidget();
        break;
      case GFAnimationType.rotateTransition:
        return buildRotationTransitionWidget();
        break;
      case GFAnimationType.scaleTransition:
        return buildScaleTransitionWidget();
        break;
      case GFAnimationType.slideTransition:
        return buildSlideTransitionWidget();
        break;
      case GFAnimationType.textStyle:
        return buildAnimatedDefaultTextStyleWidget();
        break;
      default:
        return buildAnimatedContainerWidget();
    }
  }
}
