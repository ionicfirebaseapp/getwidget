import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum GFShimmerDirection { ltr, rtl, ttb, btt }

@immutable
class GFShimmer extends StatefulWidget {
  const GFShimmer({
    Key key,
    @required this.child,
    @required this.gradient,
    this.direction = GFShimmerDirection.ltr,
    this.duration = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final GFShimmerDirection direction;
  final Gradient gradient;
  final int loop;
  final bool enabled;

  GFShimmer.fromColors({
    Key key,
    @required this.child,
    @required Color baseColor,
    @required Color highlightColor,
    this.duration = const Duration(milliseconds: 1500),
    this.direction = GFShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  })  : gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        baseColor,
        baseColor,
        highlightColor,
        baseColor,
        baseColor
      ],
      stops: const <double>[
        0,
        0.35,
        0.5,
        0.65,
        1
      ]),
        super(key: key);

  @override
  _GFShimmerState createState() => _GFShimmerState();
}

class _GFShimmerState extends State<GFShimmer> with SingleTickerProviderStateMixin {
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
      builder: (BuildContext context, Widget child) => _GFShimmer(
        child: child,
        direction: widget.direction,
        gradient: widget.gradient,
        percent: _controller.value,
        enabled: widget.enabled,
      ),
    );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _GFShimmer extends SingleChildRenderObjectWidget {
  const _GFShimmer({
    Widget child,
    this.percent,
    this.direction,
    this.gradient,
    this.enabled,
  }) : super(child: child);

  final double percent;
  final GFShimmerDirection direction;
  final Gradient gradient;
  final bool enabled;

  @override
  _GFShimmerFilter createRenderObject(BuildContext context) => _GFShimmerFilter(percent, direction, gradient, enabled);

  @override
  void updateRenderObject(BuildContext context, _GFShimmerFilter shimmer) {
    shimmer.percent = percent;
    shimmer.enabled = enabled;
  }
}

class _GFShimmerFilter extends RenderProxyBox {

  _GFShimmerFilter(this._percent, this._direction, this._gradient, this.enabled)
      : _gradientPaint = Paint()..blendMode = BlendMode.srcIn;

  final Paint _clearPaint = Paint();
  final Paint _gradientPaint;
  final Gradient _gradient;
  final GFShimmerDirection _direction;
  bool enabled;
  double _percent;
  Rect _rect;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double newValue) {
    if (newValue == _percent) {
      return;
    }
    _percent = newValue;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    assert(needsCompositing);

    context.canvas.saveLayer(offset & child.size, _clearPaint);
    context.paintChild(child, offset);

    final double width = child.size.width;
    final double height = child.size.height;
    Rect rect;
    double dx, dy;
    if (_direction == GFShimmerDirection.rtl) {
      dx = _offset(width, -width, _percent);
      dy = 0.0;
      rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    } else if (_direction == GFShimmerDirection.ttb) {
      dx = 0.0;
      dy = _offset(-height, height, _percent);
      rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
    } else if (_direction == GFShimmerDirection.btt) {
      dx = 0.0;
      dy = _offset(height, -height, _percent);
      rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
    } else {
      dx = _offset(-width, width, _percent);
      dy = 0.0;
      rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    }
    if (_rect != rect) {
      _gradientPaint.shader = _gradient.createShader(rect);
      _rect = rect;
    }
    context.canvas.translate(dx, dy);
    context.canvas.drawRect(rect, _gradientPaint);
    context.canvas.restore();
  }

  double _offset(double start, double end, double percent) => start + (end - start) * percent;
}
