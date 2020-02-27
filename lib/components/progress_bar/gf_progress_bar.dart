import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_progress_type.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class GFProgressBar extends StatefulWidget {
  GFProgressBar({
    Key key,
    this.percentage = 0.2,
    this.circleWidth = 5.0,
    this.circleStartAngle = 0.0,
    this.radius,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.progressBarColor = Colors.red,
    this.linearGradient,
    this.animation = false,
    this.animationDuration = 700,
    this.child,
    this.autoLive = true,
    this.animateFromLastPercentage = false,
    this.reverse = false,
    this.mask,
    this.type = GFProgressType.linear,
    this.progressHeadType,
    this.lineHeight = 5.0,
    this.width,
    this.fromRightToLeft = false,
    this.leading,
    this.trailing,
    this.padding,
    this.alignment = MainAxisAlignment.start,
    this.clipLinearGradient = false,
  }) : super(key: key) {
    if (linearGradient != null && progressBarColor != null) {
      throw ArgumentError(
          ' linearGradient and progressBarColor cannot be given');
    }

    assert(circleStartAngle >= 0.0);
    if (percentage < 0.0 || percentage > 1.0) {
      throw Exception('Percentage value must be between 0.0 and 1.0');
    }
  }

  /// width of the  Progress bar
  final double width;

  /// Height of the  Progress Bar
  final double lineHeight;

  /// type of [Color] or GFColors used to change the backgroundColor of the  progress bar
  final Color backgroundColor;

  /// type of Color , used to change the color of the active progress line
  final Color progressBarColor;

  /// type of bool which allows the progress line to animate when the percentage values are changed
  final bool animation;

  /// duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  /// type of Widget which comes before the progress bar
  final Widget leading;

  /// type of Widget which comes after the progress bar
  final Widget trailing;

  /// type of Widget which can be text , icon etc which is  generally used to show the percentage of progress complete
  final Widget child;

  /// type of MainAxisAlignment used to align the leading, trailing and the progress bar in a fashion
  final MainAxisAlignment alignment;

  /// type of EdgeInsets which gives padding to the GFProgressBar
  final EdgeInsets padding;

  /// set true if you want to animate the progress bar  from the last percentage value you set
  final bool animateFromLastPercentage;

  /// If present, this will make the progress bar colored by this gradient.
  /// This will override [progressBarColor]. It is an error to provide both.
  final LinearGradient linearGradient;

  /// set false if you don't want to preserve the state of the widget
  final bool autoLive;

  /// set true if you want to animate the linear bar from the right to left
  final bool fromRightToLeft;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter mask;

  /// Set true if you want to display only part of [linearGradient] based on progressPercent value
  ///  If no [linearGradient] is specified this option is ignored.
  final bool clipLinearGradient;

  /// type of [GFProgressType] which changes the shape of progress bar based on the type ie, circular and linear
  final GFProgressType type;

  /// type of [GFProgressHeadType] which changes the shape of progress head based on the type ie, circular and square
  final GFProgressHeadType progressHeadType;

  /// type of double which defines the thickness of the circle's arc in Circular Progress bar
  final double circleWidth;

  /// type of double in which the angle on the circle starts to progress (in degrees, eg: 0.0, 45.0, 90.0)
  final double circleStartAngle;

  /// type of bool used  to display the progress in reverse direction
  final bool reverse;

  /// type of double used to show the radius of Circular Progress Bar
  final double radius;

  /// type of double which should be from 0 to 1 to indicate the progress of the ProgressBars
  final double percentage;

  @override
  _GFProgressBarState createState() => _GFProgressBarState();
}

class _GFProgressBarState extends State<GFProgressBar>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController, circularAnimationController;
  Animation _animation, circularAnimation;
  double _progressPercent = 0;
  double _percentage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.animation) {
      _animationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation =
          Tween(begin: 0, end: widget.percentage).animate(_animationController)
            ..addListener(() {
              setState(() {
                _progressPercent = _animation.value;
              });
            });
      _animationController.forward();
    } else {
      _updateprogressPercent();
    }

    if (widget.animation) {
      circularAnimationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      circularAnimation = Tween(begin: 0, end: widget.percentage)
          .animate(circularAnimationController)
            ..addListener(() {
              setState(() {
                _percentage = circularAnimation.value;
              });
            });
      circularAnimationController.forward();
    } else {
      _updateProgress();
    }
  }

  void _updateProgress() {
    setState(() {
      _percentage = widget.percentage;
    });
  }

  void _updateprogressPercent() {
    setState(() {
      _progressPercent = widget.percentage;
    });
  }

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    if (circularAnimationController != null) {
      circularAnimationController.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(GFProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      if (_animationController != null) {
        _animationController.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
                begin: widget.animateFromLastPercentage
                    ? oldWidget.percentage
                    : 0.0,
                end: widget.percentage)
            .animate(_animationController);
        _animationController.forward(from: 0);
      } else {
        _updateprogressPercent();
      }
    }
    if (oldWidget.percentage != widget.percentage ||
        oldWidget.circleStartAngle != widget.circleStartAngle) {
      if (circularAnimationController != null) {
        circularAnimationController.duration =
            Duration(milliseconds: widget.animationDuration);
        circularAnimation = Tween(
                begin: widget.animateFromLastPercentage
                    ? oldWidget.percentage
                    : 0.0,
                end: widget.percentage)
            .animate(circularAnimationController);
        circularAnimationController.forward(from: 0);
      } else {
        _updateProgress();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final item = <Widget>[];
    if (widget.leading != null) {
      item.add(widget.leading);
    }
    final hasSetWidth = widget.width != null;
    final containerWidget = Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: hasSetWidth ? widget.width : MediaQuery.of(context).size.width,
        height: widget.lineHeight,
        padding: widget.padding,
        child: widget.type == GFProgressType.linear
            ? CustomPaint(
                painter: LinearPainter(
                  progressHeadType: widget.progressHeadType,
                  fromRightToLeft: widget.fromRightToLeft,
                  progress: _progressPercent,
                  child: widget.child,
                  progressBarColor: widget.progressBarColor,
                  linearGradient: widget.linearGradient,
                  backgroundColor: widget.backgroundColor,
                  circleWidth: widget.lineHeight,
                  mask: widget.mask,
                  clipLinearGradient: widget.clipLinearGradient,
                ),
                child: (widget.child != null) ? widget.child : Container(),
              )
            : CustomPaint(
                painter: CirclePainter(
                    progressHeadType: widget.progressHeadType,
                    progress: _percentage * 360,
                    progressBarColor: widget.progressBarColor,
                    backgroundColor: widget.backgroundColor,
                    circleStartAngle: widget.circleStartAngle,
                    radius: (widget.radius / 2) - widget.circleWidth / 2,
                    circleWidth: widget.circleWidth,
                    reverse: widget.reverse,
                    linearGradient: widget.linearGradient,
                    mask: widget.mask),
                child: (widget.child != null)
                    ? Center(child: widget.child)
                    : Container(),
              ));

    if (hasSetWidth) {
      item.add(containerWidget);
    } else {
      item.add(Expanded(
        child: containerWidget,
      ));
    }
    if (widget.trailing != null) {
      item.add(widget.trailing);
    }

    return widget.type == GFProgressType.linear
        ? Material(
            color: Colors.transparent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: widget.alignment,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: item,
                )),
          )
        : Material(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: item,
                )),
          );
  }

  @override
  bool get wantKeepAlive => widget.autoLive;
}

class LinearPainter extends CustomPainter {
  LinearPainter({
    this.circleWidth,
    this.progress,
    this.child,
    this.fromRightToLeft,
    this.progressBarColor,
    this.backgroundColor,
    this.progressHeadType,
    this.linearGradient,
    this.mask,
    this.clipLinearGradient,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = circleWidth;

    _paintLine.color = progress.toString() == '0.0'
        ? progressBarColor.withOpacity(0)
        : progressBarColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = circleWidth;

    if (progressHeadType == GFProgressHeadType.square) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.round;
      _paintBackground.strokeCap = StrokeCap.round;
    }
  }

  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double circleWidth;
  final double progress;
  final Widget child;
  final bool fromRightToLeft;
  final Color progressBarColor;
  final Color backgroundColor;
  final LinearGradient linearGradient;
  final MaskFilter mask;
  final bool clipLinearGradient;
  GFProgressHeadType progressHeadType;

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);

    if (mask != null) {
      _paintLine.maskFilter = mask;
    }

    if (fromRightToLeft) {
      final xProgress = size.width - size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderRightToLeft(size, xProgress);
      }
      canvas.drawLine(end, Offset(xProgress, size.height / 2), _paintLine);
    } else {
      final xProgress = size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderLeftToRight(size, xProgress);
      }
      canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
    }
  }

  Shader _createGradientShaderRightToLeft(Size size, double xProgress) {
    final Offset shaderEndPoint =
        clipLinearGradient ? Offset.zero : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset(size.width, size.height),
        shaderEndPoint,
      ),
    );
  }

  Shader _createGradientShaderLeftToRight(Size size, double xProgress) {
    final Offset shaderEndPoint = clipLinearGradient
        ? Offset(size.width, size.height)
        : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset.zero,
        shaderEndPoint,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CirclePainter extends CustomPainter {
  CirclePainter(
      {this.circleWidth,
      this.progress,
      @required this.radius,
      this.progressHeadType,
      this.progressBarColor,
      this.backgroundColor,
      this.circleStartAngle = 0.0,
      this.linearGradient,
      this.reverse,
      this.arcBackgroundColor,
      this.mask}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = circleWidth;

    _paintLine.color = progressBarColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = circleWidth;
    if (progressHeadType == GFProgressHeadType.circular) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (progressHeadType == GFProgressHeadType.square) {
      _paintLine.strokeCap = StrokeCap.square;
    }
  }
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double circleWidth;
  final double progress;
  final double radius;
  final Color progressBarColor;
  final Color backgroundColor;
  final double circleStartAngle;
  final LinearGradient linearGradient;
  final Color arcBackgroundColor;
  final bool reverse;
  final MaskFilter mask;
  final GFProgressHeadType progressHeadType;

  @override
  void paint(Canvas canvas, Size size) {
    final child = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(child, radius, _paintBackground);

    if (mask != null) {
      _paintLine.maskFilter = mask;
    }
    if (linearGradient != null) {
      _paintLine.shader = linearGradient.createShader(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
      );
    }

    final double fixedStartAngle = circleStartAngle;

    const double circleStartAngleFixedMargin = 1;

    if (reverse) {
      final start = math
          .radians(360 * circleStartAngleFixedMargin - 90.0 + fixedStartAngle);
      final end = math.radians(-progress * circleStartAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    } else {
      final start = math.radians(-90.0 + fixedStartAngle);
      final end = math.radians(progress * circleStartAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: child,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
