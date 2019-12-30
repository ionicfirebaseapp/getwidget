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
//        widget.child != null? widget.child : MyHomePage(),
//       Container(
//        height: screenHeight,
//         width: screenWidth,
//         color: Colors.orange,
//       ),
      Container(
//        height: screenHeight,
//        width: screenWidth,
         child: widget.body ?? Container(),
      ),
        Positioned(
          top: widget.horizontalPosition != null ? widget.horizontalPosition : 0,
left: widget.verticalPosition  != null ? widget.verticalPosition : 0,

//            top:20,
            child: widget.child ?? Container()
        ),


//        Positioned(
//          top:MediaQuery.of(context).size.height * 0.3,
////            top:30,
//            child: GFToast(
//              text: 'hi',
//            )
//        )


      ],
    );
  }
}
