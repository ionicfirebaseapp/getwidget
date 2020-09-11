import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getwidget/types/gf_border_type.dart';

typedef PathBuilder = Path Function(Size);

class DashedType extends CustomPainter {
  DashedType({
    this.strokeWidth = 2,
    this.dashedLine = const <double>[3, 1],
    this.color = Colors.black,
    this.type = GFBorderType.Rect,
    this.radius = const Radius.circular(0),
    this.customPath,
  }) : assert(dashedLine.isNotEmpty, 'dash line cannot be empty');

  /// storkeWidth of type [double] which is used to define the thickness of the border
  final double strokeWidth;

  /// dashedLine of type [List<double>] which is used for the linear and simple dashed line of border
  final List<double> dashedLine;

  /// color of type [Color] or GFColor which is used to change the color of the border type
  final Color color;

  /// type of [GFBorderType] which is used to define the different types of borders ie, circle, Rect, RRect and oval
  final GFBorderType type;

  /// radius of type [Radius] used to give a curved border only when the border type is RRect, in other cases radius will not work
  final Radius radius;

  /// customPath of type [PathBuilder] used for the drawing the paths
  final PathBuilder customPath;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    Path _path;
    if (customPath != null) {
      _path = dashPath(
        customPath(size),
        dashedarray: CircularIntervalList(dashedLine),
      );
    } else {
      _path = _getPath(size);
    }

    canvas.drawPath(_path, paint);
  }

  /// Returns a [Path] based on the the borderType parameter
  Path _getPath(Size size) {
    Path path;
    switch (type) {
      case GFBorderType.Circle:
        path = _getCirclePath(size);
        break;
      case GFBorderType.RRect:
        path = _getRRectPath(size, radius);
        break;
      case GFBorderType.Rect:
        path = _getRectPath(size);
        break;
      case GFBorderType.Oval:
        path = _getOvalPath(size);
        break;
    }

    return dashPath(path, dashedarray: CircularIntervalList(dashedLine));
  }

  ///  gives a circular path og borderType
  Path _getCirclePath(Size size) {
    final double width = size.width;
    final double height = size.height;
    final double sizes = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            width > sizes ? (width - sizes) / 2 : 0,
            height > sizes ? (height - sizes / 2) : 0,
            sizes,
            sizes,
          ),
          Radius.circular(sizes / 2),
        ),
      );
  }

  ///  gives a Rounded Rectangular Path with [radius] of [size] for borderType

  Path _getRRectPath(Size size, Radius radius) => Path()
    ..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
        radius,
      ),
    );

  /// gives a  Rectangular Path with [size] for borderType
  Path _getRectPath(Size size) => Path()
    ..addRect(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

  /// gives an oval path of [size] for borderType
  Path _getOvalPath(Size size) => Path()
    ..addOval(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

  @override
  bool shouldRepaint(DashedType oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.color != color ||
      oldDelegate.dashedLine != dashedLine ||
      oldDelegate.type != type;
}

class CircularIntervalList<T> {
  CircularIntervalList(this.values);

  final List<T> values;
  int index = 0;

  T get next {
    if (index >= values.length) {
      index = 0;
    }
    return values[index++];
  }
}

Path dashPath(Path source,
    {@required CircularIntervalList<double> dashedarray,
    DashOffset dashOffset = const DashOffset.absolute(0)}) {
  assert(dashedarray != null);
  if (source == null) {
    return null;
  }

  final Path dest = Path();
  for (final PathMetric metric in source.computeMetrics()) {
    double distance = dashOffset._calculate(metric.length);
    bool draw = true;
    while (distance < metric.length) {
      final double len = dashedarray.next;
      if (draw) {
        dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
      }
      distance += len;
      draw = !draw;
    }
  }

  return dest;
}

/// Specifies the starting position of a dashed array or line  on a path, either as a percentage or absolute
enum _DashOffsetType { Absolute, Percentage }

class DashOffset {
  ///gives offset of the dashed path that will be measured as a percentage which ranges from 0.0 to 1.0
  DashOffset.percentage(double percentage)
      : _value = percentage.clamp(0.0, 1.0) ?? 0.0,
        _dashOffsetType = _DashOffsetType.Percentage;

  ///gives offset of the dashed path that will be measured as a absolute value
  const DashOffset.absolute(double start)
      : _value = start ?? 0.0,
        _dashOffsetType = _DashOffsetType.Absolute;

  final double _value;
  final _DashOffsetType _dashOffsetType;

  double _calculate(double length) =>
      _dashOffsetType == _DashOffsetType.Absolute ? _value : length * _value;
}
