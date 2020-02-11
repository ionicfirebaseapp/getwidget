import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class GFFloatingWidget extends StatefulWidget {
  /// Creates a Floating body can be used to display the quick messages, warning and erros.
  /// Inside floating widget [GFToast] can be used as body. See [GFToast]
  const GFFloatingWidget(
      {Key key,
      this.child,
      this.horizontalPosition,
      this.verticalPosition,
      this.blurnessColor,
      this.showblurness = false,
      this.body})
      : super(key: key);

  ///child of  type [Widget] which floats across the body based on horizontal and vertical position
  final Widget child;

  ///body of type [Widget] which is same as Scaffold's body
  final Widget body;

  /// horizontalPosition of type [double] which  aligns the child horizontally across the body
  final double horizontalPosition;

  /// verticalPosition of type [double] which  aligns the child vertically across the body
  final double verticalPosition;

  ///blurnessColor of tye [Color] or [GFColors] which is used to blur the backgroundColor when ever the [child] is used in [GFFloatingWidget]
  final Color blurnessColor;

  ///type of bool which allows to show or hide the blurness of the backgroundColor whenever the [child]  is used in [GFFloatingWidget]
  final bool showblurness;

  @override
  _GFFloatingWidgetState createState() => _GFFloatingWidgetState();
}

class _GFFloatingWidgetState extends State<GFFloatingWidget> {
  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: widget.body ?? Container(),
          ),
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: widget.showblurness
                ? widget.blurnessColor ?? Colors.black54
                : null,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: widget.verticalPosition != null
                      ? widget.verticalPosition
                      : 0.0,
                  left: widget.horizontalPosition != null
                      ? widget.horizontalPosition
                      : 0.0,
                  child: widget.child ?? Container(),
                )
              ],
            ),
          ))
        ],
      );
}
