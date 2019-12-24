import 'package:flutter/material.dart';


class GFToast extends StatelessWidget {

  ///
  GFToast({Key key,
    this.child,
    this.button,
    this.bgColor,
    this.text,
    this.textStyle =  const TextStyle(color: Colors.white70, height: 1.5),
  }) :super(key: key);

  /// child of  type [Widget]is alternative to text key. text will get priority over child
  final Widget child;

  /// button of type [Widget],or you can use [GFButton] for easy implementation with [GFToast]
  final  Widget button;

  ///pass color of type [Color] or [GFColor] for background of [GFToast]
  final Color bgColor;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// textStyle will be applicable to text only and not for the child
  final TextStyle textStyle;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: bgColor ?? Color(0xff323232),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: text!=null ? Text(text , style: textStyle):(child??Container()),),
          SizedBox(
            width: 10,
          ),
          button!=null?Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: button):Container()
        ],
      ),
    );
  }
}