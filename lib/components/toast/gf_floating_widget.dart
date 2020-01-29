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
      this.color,
      this.blur = false,
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

  final dynamic color;

  final bool blur;

  @override
  _GFFloatingWidgetState createState() => _GFFloatingWidgetState();
}

class _GFFloatingWidgetState extends State<GFFloatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: widget.body ?? Container(),
        ),
        Container(
//          color: widget.child!=null? widget.color: null,
            child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
                    alignment: Alignment.topLeft,
//                    color: widget.child!=null? widget.color: null,
                    color: widget.blur ? Colors.black38 : null,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: widget.verticalPosition != null
                              ? widget.verticalPosition
                              : 0.0,
                          left: widget.horizontalPosition != null
                              ? widget.horizontalPosition
                              : 0.0,
                          right: widget.horizontalPosition != null
                              ? widget.horizontalPosition
                              : 0.0,
                          child: widget.child ?? Container(),
                        )
                      ],
                    ))),
          ],
        ))
      ],
    );
  }
}
