import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFFloatingWidget extends StatefulWidget {
  /// Creates a Floating body can be used to display the quick messages, warning and erros.
  /// Inside floating widget [GFToast] can be used as body. See [GFToast]
  const GFFloatingWidget(
      {Key key,
        this.child,
        this.horizontalPosition,
        this.verticalPosition,
        this.blurnessColor,
        this.showBlurness = false,
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
  final bool showBlurness;

  @override
  _GFFloatingWidgetState createState() => _GFFloatingWidgetState();
}

class _GFFloatingWidgetState extends State<GFFloatingWidget> {
  Widget child;

  @override
  void initState() {
    child = widget.child;
    super.initState();
  }

  @override
  void didUpdateWidget(GFFloatingWidget oldWidget) {
    child = widget.child;
    super.didUpdateWidget(oldWidget);
  }

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
          color: widget.showBlurness
              ? widget.blurnessColor ?? Colors.black54
              : null,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: widget.verticalPosition ?? 0.0,
                left: widget.horizontalPosition ?? 0.0,
                child: widget.child ?? Container(),
              )
            ],
          ),
        ),
      )
    ],
  );
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
//
// class GFFloatingWidget extends StatefulWidget {
//   /// Creates a Floating body can be used to display the quick messages, warning and erros.
//   /// Inside floating widget [GFToast] can be used as body. See [GFToast]
//   const GFFloatingWidget(
//       {Key key,
//       this.child,
//       this.horizontalPosition,
//       this.verticalPosition,
//       this.blurnessColor,
//       this.showBlurness = false,
//       this.body,
//         this.autoDismiss = true,
//         this.animationDuration = const Duration(milliseconds: 300),
//         this.duration = const Duration(milliseconds: 300),
//       })
//       : super(key: key);
//
//   ///child of  type [Widget] which floats across the body based on horizontal and vertical position
//   final Widget child;
//
//   ///body of type [Widget] which is same as Scaffold's body
//   final Widget body;
//
//   /// horizontalPosition of type [double] which  aligns the child horizontally across the body
//   final double horizontalPosition;
//
//   /// verticalPosition of type [double] which  aligns the child vertically across the body
//   final double verticalPosition;
//
//   ///blurnessColor of tye [Color] or [GFColors] which is used to blur the backgroundColor when ever the [child] is used in [GFFloatingWidget]
//   final Color blurnessColor;
//
//   ///type of bool which allows to show or hide the blurness of the backgroundColor whenever the [child]  is used in [GFFloatingWidget]
//   final bool showBlurness;
//
//   ///type of [bool] which takes bool values ie, true or false to automatically hide the [GFToast] message
//   final bool autoDismiss;
//
//   ///type of [Duration] which takes the duration of the fade in animation
//   final Duration animationDuration;
//
//   ///type of [Duration] which takes the duration of the animation
//   final Duration duration;
//
//   @override
//   _GFFloatingWidgetState createState() => _GFFloatingWidgetState();
// }
//
// class _GFFloatingWidgetState extends State<GFFloatingWidget> {
//   Widget child;
//   Color bgColor;
//   bool showBackgroundOverlay = false;
//
//   @override
//   void initState() {
//     child = widget.child;
//     showBackgroundOverlay = widget.showBlurness;
//     print('before $showBackgroundOverlay ${widget.showBlurness}');
//     if(widget.autoDismiss == true && widget.showBlurness == true) {
//       print('first $showBackgroundOverlay ${widget.showBlurness}');
//       setState(() {
//         showBackgroundOverlay = !showBackgroundOverlay;
//       });
//       print('last $showBackgroundOverlay ${widget.showBlurness}');
//     }
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(GFFloatingWidget oldWidget) {
//     child = widget.child;
//     super.didUpdateWidget(oldWidget);
//   }
//
//   Color fadeBackgroundOverlay() {
//     print('in $showBackgroundOverlay ${widget.showBlurness}');
//       Timer(widget.duration, () {
//         if(mounted) {
//           setState(() {
//             bgColor = widget.blurnessColor != null ? widget.blurnessColor : Colors.black38;
//           });
//         }
//
//       });
//     return bgColor;
//   }
//
//   @override
//   Widget build(BuildContext context) => Stack(
//         alignment: Alignment.center,
//         fit: StackFit.loose,
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height,
//             child: widget.body ?? Container(),
//           ),
//           Positioned(
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: showBackgroundOverlay ? fadeBackgroundOverlay() : null,
//               child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                     top: widget.verticalPosition ?? 0.0,
//                     left: widget.horizontalPosition ?? 0.0,
//                     child: widget.child ?? Container(),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       );
// }
