import 'package:flutter/material.dart';
import 'package:ui_kit/components/toast/gf_toast.dart';



class GFFloatingWidget extends StatefulWidget {

  const GFFloatingWidget({
    Key key,
    this.child,
    this.horizontalPosition,
    this.verticalPosition,
    this.body
  }) : super(key: key);


  final Widget child;

  final Widget body;

  final double horizontalPosition;


  final double verticalPosition;

  @override
  _GFFloatingWidgetState createState() => _GFFloatingWidgetState();
}

class _GFFloatingWidgetState extends State<GFFloatingWidget> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
      Container(
         child: widget.body ?? Container(),
      ),
        Positioned(
          top: widget.horizontalPosition != null ? widget.horizontalPosition : 0,
          left: widget.verticalPosition  != null ? widget.verticalPosition : 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child:  widget.child ?? Container(),
            )
        ),
      ],
    );
  }
}
