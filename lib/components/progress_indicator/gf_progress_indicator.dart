//import 'package:flutter/material.dart';
//import 'package:getflutter/getflutter.dart';
//
//class GFProgressBar extends StatefulWidget {
//  @override
//  _GFProgressBarState createState() => _GFProgressBarState();
//}
//
//class _GFProgressBarState extends State<GFProgressBar> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}


import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_progress_type.dart';
import 'package:vector_math/vector_math_64.dart' as math;

enum LinearStrokeCap { butt, round, roundAll , circular}

enum CircularStrokeCap { butt, round, square }

enum ArcType {
  HALF,
  FULL,
}

class GFProgressBar extends StatefulWidget {
  ///Percent value between 0.0 and 1.0
  final double progressPercent;
  final double width;

  ///Height of the line
  final double lineHeight;


  ///First color applied to the complete line
  final Color backgroundColor;

  Color get progressColor => _progressColor;

  Color _progressColor;

  ///true if you want the Line to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget at the left of the Line
  final Widget leading;

  ///widget at the right of the Line
  final Widget trailing;

  ///widget inside the Line
  final Widget center;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, roundAll
  final LinearStrokeCap linearStrokeCap;

  ///alignment of the Row (leading-widget-center-trailing)
  final MainAxisAlignment alignment;

  ///padding to the GFProgressBar
  final EdgeInsets padding;

  /// set true if you want to animate the linear from the last progressPercent value you set
  final bool animateFromLastPercent;

  /// If present, this will make the progress bar colored by this gradient.
  ///
  /// This will override [progressColor]. It is an error to provide both.
  final LinearGradient linearGradient;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set true if you want to animate the linear from the right to left (RTL)
  final bool isRTL;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter maskFilter;

  /// Set true if you want to display only part of [linearGradient] based on progressPercent value
  /// (ie. create 'VU effect'). If no [linearGradient] is specified this option is ignored.
  final bool clipLinearGradient;

  final GFProgressType type ;

  ///Width of the line of the Circle
  final double lineWidth;


  ///widget at the top of the circle
  final Widget header;

  ///widget at the bottom of the circle
  final Widget footer;



  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, square
  final CircularStrokeCap circularStrokeCap;

  ///the angle which the circle will start the progress (in degrees, eg: 0.0, 45.0, 90.0)
  final double startAngle;


  /// set the arc type
  final ArcType arcType;

  /// set a circular background color when use the arcType property
  final Color arcBackgroundColor;

  /// set true when you want to display the progress in reverse mode
  final bool reverse;
  final double radius;



  GFProgressBar({
    Key key,
    this.type,
    this.lineWidth,
    this.progressPercent = 0.0,
    this.lineHeight = 5.0,
    this.width,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.linearGradient,
    Color progressColor,
    this.animation = false,
    this.animationDuration = 500,
    this.animateFromLastPercent = false,
    this.isRTL = false,
    this.leading,
    this.trailing,
    this.center,
    this.addAutomaticKeepAlive = true,
    this.linearStrokeCap,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.alignment = MainAxisAlignment.start,
    this.maskFilter,
    this.clipLinearGradient = false,
    this.startAngle = 0.0,
    @required this.radius,
    this.circularStrokeCap,
    this.header,
    this.footer,

    this.arcBackgroundColor,
    this.arcType,
    this.reverse = false,



  }) : super(key: key) {
    if (linearGradient != null && progressColor != null) {
      throw ArgumentError(
          'Cannot provide both linearGradient and progressColor');
    }
    _progressColor = progressColor ?? Colors.red;

    if (progressPercent < 0.0 || progressPercent > 1.0) {
      throw new Exception("Percent value must be a double between 0.0 and 1.0");
    }
  }

  @override
  _GFProgressBarState createState() => _GFProgressBarState();
}

class _GFProgressBarState extends State<GFProgressBar>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {



  AnimationController _animationController;
  Animation _animation;
  double _progressPercent = 0.0;
  double _percent = 0.0;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animation) {
      _animationController = new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation =
      Tween(begin: 0.0, end: widget.progressPercent).animate(_animationController)
        ..addListener(() {
          setState(() {
            _progressPercent = _animation.value;
          });
        });
      _animationController.forward();
    } else {
      _updateProgress();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(GFProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressPercent != widget.progressPercent) {
      if (_animationController != null) {
        _animationController.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
            begin: widget.animateFromLastPercent ? oldWidget.progressPercent : 0.0,
            end: widget.progressPercent)
            .animate(_animationController);
        _animationController.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
  }

  _updateProgress() {
    setState(() {
      _progressPercent = widget.progressPercent;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = List<Widget>();
    if (widget.leading != null) {
      items.add(widget.leading);
    }
    final hasSetWidth = widget.width != null;
    var containerWidget = widget.type == GFProgressType.linear?Container(
      width: hasSetWidth ? widget.width : double.infinity,
      decoration: BoxDecoration(
          shape: widget.type == GFProgressType.round?BoxShape.circle?? widget.type==GFProgressType.square:BoxShape.rectangle
      ),
      height: widget.lineHeight,
      padding: widget.padding,
      child: CustomPaint(
        painter: LinearPainter(
          isRTL: widget.isRTL,
          progress: _progressPercent,
          center: widget.center,
          progressColor: widget.progressColor,
          linearGradient: widget.linearGradient,
          backgroundColor: widget.backgroundColor,
          linearStrokeCap: widget.linearStrokeCap,
          lineWidth: widget.lineHeight,
          maskFilter: widget.maskFilter,
          clipLinearGradient: widget.clipLinearGradient,
        ),
        child: (widget.center != null)
            ?  widget.center
            : Container(),
      ),
    ): CircularPercentIndicator(radius: 20.0);

    if (hasSetWidth) {
      items.add(containerWidget);
    } else {
      items.add(Expanded(
        child: containerWidget,
      ));
    }
    if (widget.trailing != null) {
      items.add(widget.trailing);
    }

    return Material(
      color: Colors.transparent,
      child: new Container(
          child: Row(
            mainAxisAlignment: widget.alignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items,
          )),
    );
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

class LinearPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintLine = new Paint();
  final lineWidth;
  final progress;
  final center;
  final isRTL;
  final Color progressColor;
  final Color backgroundColor;
  final LinearStrokeCap linearStrokeCap;
  final LinearGradient linearGradient;
  final MaskFilter maskFilter;
  final bool clipLinearGradient;

  LinearPainter({
    this.lineWidth,
    this.progress,
    this.center,
    this.isRTL,
    this.progressColor,
    this.backgroundColor,
    this.linearStrokeCap = LinearStrokeCap.butt,
    this.linearGradient,
    this.maskFilter,
    this.clipLinearGradient,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;

    _paintLine.color = progress.toString() == "0.0"
        ? progressColor.withOpacity(0.0)
        : progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;

    if (linearStrokeCap == LinearStrokeCap.round) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (linearStrokeCap == LinearStrokeCap.butt) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.round;
      _paintBackground.strokeCap = StrokeCap.round;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);

    if (maskFilter != null) {
      _paintLine.maskFilter = maskFilter;
    }

    if (isRTL) {
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
    Offset shaderEndPoint =
    clipLinearGradient ? Offset.zero : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset(size.width, size.height),
        shaderEndPoint,
      ),
    );
  }

  Shader _createGradientShaderLeftToRight(Size size, double xProgress) {
    Offset shaderEndPoint = clipLinearGradient
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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}




class CircularPercentIndicator extends StatefulWidget {
  ///Percent value between 0.0 and 1.0
  final double percent;
  final double radius;

  ///Width of the line of the Circle
  final double lineWidth;

  ///Color of the background of the circle , default = transparent
  final Color fillColor;

  ///First color applied to the complete circle
  final Color backgroundColor;

  Color get progressColor => _progressColor;

  Color _progressColor;

  ///true if you want the circle to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget at the top of the circle
  final Widget header;

  ///widget at the bottom of the circle
  final Widget footer;

  ///widget inside the circle
  final Widget center;

  final LinearGradient linearGradient;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, square
  final CircularStrokeCap circularStrokeCap;

  ///the angle which the circle will start the progress (in degrees, eg: 0.0, 45.0, 90.0)
  final double startAngle;

  /// set true if you want to animate the linear from the last percent value you set
  final bool animateFromLastPercent;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set the arc type
  final ArcType arcType;

  /// set a circular background color when use the arcType property
  final Color arcBackgroundColor;

  /// set true when you want to display the progress in reverse mode
  final bool reverse;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter maskFilter;

  CircularPercentIndicator(
      {Key key,
        this.percent = 0.0,
        this.lineWidth = 5.0,
        this.startAngle = 0.0,
        @required this.radius,
        this.fillColor = Colors.transparent,
        this.backgroundColor = const Color(0xFFB8C7CB),
        Color progressColor,
        this.linearGradient,
        this.animation = false,
        this.animationDuration = 500,
        this.header,
        this.footer,
        this.center,
        this.addAutomaticKeepAlive = true,
        this.circularStrokeCap,
        this.arcBackgroundColor,
        this.arcType,
        this.animateFromLastPercent = false,
        this.reverse = false,
        this.maskFilter})
      : super(key: key) {
    if (linearGradient != null && progressColor != null) {
      throw ArgumentError(
          'Cannot provide both linearGradient and progressColor');
    }
    _progressColor = progressColor ?? Colors.red;

    assert(startAngle >= 0.0);
    if (percent < 0.0 || percent > 1.0) {
      throw Exception("Percent value must be a double between 0.0 and 1.0");
    }

    if (arcType == null && arcBackgroundColor != null) {
      throw ArgumentError('arcType is required when you arcBackgroundColor');
    }
  }

  @override
  _CircularPercentIndicatorState createState() =>
      _CircularPercentIndicatorState();
}

class _CircularPercentIndicatorState extends State<CircularPercentIndicator>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation _animation;
  double _percent = 0.0;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animation) {
      _animationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation =
      Tween(begin: 0.0, end: widget.percent).animate(_animationController)
        ..addListener(() {
          setState(() {
            _percent = _animation.value;
          });
        });
      _animationController.forward();
    } else {
      _updateProgress();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(CircularPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent ||
        oldWidget.startAngle != widget.startAngle) {
      if (_animationController != null) {
        _animationController.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
            begin: widget.animateFromLastPercent ? oldWidget.percent : 0.0,
            end: widget.percent)
            .animate(_animationController);
        _animationController.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = List<Widget>();
    if (widget.header != null) {
      items.add(widget.header);
    }
    items.add(
        Container(
            height: widget.radius + widget.lineWidth,
            width: widget.radius,
            child: CustomPaint(
              painter: CirclePainter(
                  progress: _percent * 360,
                  progressColor: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                  startAngle: widget.startAngle,
                  circularStrokeCap: widget.circularStrokeCap,
                  radius: (widget.radius / 2) - widget.lineWidth / 2,
                  lineWidth: widget.lineWidth,
                  arcBackgroundColor: widget.arcBackgroundColor,
                  arcType: widget.arcType,
                  reverse: widget.reverse,
                  linearGradient: widget.linearGradient,
                  maskFilter: widget.maskFilter),
              child: (widget.center != null)
                  ? Center(child: widget.center)
                  : Container(),
            )));

    if (widget.footer != null) {
      items.add(widget.footer);
    }

    return Material(
      color: widget.fillColor,
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: items,
          )),
    );
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

class CirclePainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final Paint _paintBackgroundStartAngle = Paint();
  final double lineWidth;
  final double progress;
  final double radius;
  final Color progressColor;
  final Color backgroundColor;
  final CircularStrokeCap circularStrokeCap;
  final double startAngle;
  final LinearGradient linearGradient;
  final Color arcBackgroundColor;
  final ArcType arcType;
  final bool reverse;
  final MaskFilter maskFilter;

  CirclePainter(
      {this.lineWidth,
        this.progress,
        @required this.radius,
        this.progressColor,
        this.backgroundColor,
        this.startAngle = 0.0,
        this.circularStrokeCap = CircularStrokeCap.round,
        this.linearGradient,
        this.reverse,
        this.arcBackgroundColor,
        this.arcType,
        this.maskFilter}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;

    if (arcBackgroundColor != null) {
      _paintBackgroundStartAngle.color = arcBackgroundColor;
      _paintBackgroundStartAngle.style = PaintingStyle.stroke;
      _paintBackgroundStartAngle.strokeWidth = lineWidth;
    }

    _paintLine.color = progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;
    if (circularStrokeCap == CircularStrokeCap.round) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (circularStrokeCap == CircularStrokeCap.butt) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.square;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, _paintBackground);

    if (maskFilter != null) {
      _paintLine.maskFilter = maskFilter;
    }
    if (linearGradient != null) {
      _paintLine.shader = linearGradient.createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      );
    }

    double fixedStartAngle = startAngle;

    double startAngleFixedMargin = 1.0;
    if (arcType != null) {
      if (arcType == ArcType.FULL) {
        fixedStartAngle = 220;
        startAngleFixedMargin = 172 / fixedStartAngle;
      } else {
        fixedStartAngle = 270;
        startAngleFixedMargin = 135 / fixedStartAngle;
      }
    }

    if (arcBackgroundColor != null) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.radians(-90.0 + fixedStartAngle),
        math.radians(360 * startAngleFixedMargin),
        false,
        _paintBackgroundStartAngle,
      );
    }

    if (reverse) {
      final start =
      math.radians(360 * startAngleFixedMargin - 90.0 + fixedStartAngle);
      final end = math.radians(-progress * startAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    } else {
      final start = math.radians(-90.0 + fixedStartAngle);
      final end = math.radians(progress * startAngleFixedMargin);
      canvas.drawArc(
        Rect.fromCircle(
          center: center,
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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}