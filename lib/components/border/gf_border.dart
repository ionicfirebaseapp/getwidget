import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getwidget/components/border/gf_dashed_border.dart';
import 'package:getwidget/types/gf_border_type.dart';

class GFBorder extends StatelessWidget {
  GFBorder({
    @required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.type = GFBorderType.Rect,
    this.dashedLine = const <double>[3, 1],
    this.padding = const EdgeInsets.all(10),
    this.radius = const Radius.circular(0),
    this.customPath,
  })  : assert(child != null),
        assert(_isValidDashedLine(dashedLine), 'Invalid dash pattern');

  /// child of  type [Widget] which can be any component or text , etc
  final Widget child;

  /// padding of time [EdgeInsets] where in padding is given to the border types
  final EdgeInsets padding;

  /// storkeWidth of type [double] which is used to define the thickness of the border
  final double strokeWidth;

  /// color of type [Color] or GFColor which is used to change the color of the border type
  final Color color;

  /// dashedLine of type [List<double>] which is used for the linear and simple dashed line of border
  final List<double> dashedLine;

  /// type of [GFBorderType] which is used to define the different types of borders ie, circle, Rect, RRect and oval
  final GFBorderType type;

  /// radius of type [Radius] used to give a curved border only when the border type is RRect, in other cases radius will not work
  final Radius radius;

  /// customPath of type [PathBuilder] used for drawing the paths
  final PathBuilder customPath;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Positioned.fill(
            child: CustomPaint(
              painter: DashedType(
                strokeWidth: strokeWidth,
                radius: radius,
                color: color,
                type: type,
                dashedLine: dashedLine,
                customPath: customPath,
              ),
            ),
          ),
          Container(padding: padding, child: child),
        ],
      );
}

/// the value of dashedLine cannot be 0 or null, it should have some definite and proper value
bool _isValidDashedLine(List<double> dash) {
  final Set<double> _dashSet = dash.toSet();
  if (_dashSet == null) {
    return false;
  }
  if (_dashSet.length == 1 && _dashSet.elementAt(0) == 0.0) {
    return false;
  }
  if (_dashSet.isEmpty) {
    return false;
  }
  return true;
}
