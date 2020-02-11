import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum GFShimmerDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

@immutable
class GFShimmer extends StatefulWidget {
  const GFShimmer({
    Key key,
    @required this.child,
    @required this.gradient,
    this.direction = GFShimmerDirection.leftToRight,
    this.duration = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// Controls the speed of the shimmer effect. The default value is 1500 milliseconds.
  final Duration duration;

  /// Controls the direction of the shimmer effect. The default value is GFShimmerDirection.leftToRight.
  final GFShimmerDirection direction;

  /// Controls the [child]'s shades of color.
  final Gradient gradient;

  /// Controls the animation loop. The default value is '0', that makes animation forever.
  final int loop;

  /// Controls animation effect, defaults true state that makes animation active.
  final bool enabled;

  @override
  _GFShimmerState createState() => _GFShimmerState();
}

class _GFShimmerState extends State<GFShimmer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _count++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0);
        }
      });
    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(GFShimmer oldWidget) {
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (BuildContext context, Widget child) => Transform.rotate(
          angle: _controller.value * 2.0 * 22 / 7,
          child: child,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
