import 'package:flutter/material.dart';


class GFToast extends StatelessWidget {
  GFToast({Key key,
    this.child,
    this.button,
    this.bgColor,
    this.text,
    this.textStyle =  const TextStyle(color: Colors.white70, height: 1.5),
  }) :super(key: key);

  ///type child in the [toast] dailogue which is optionally over text
  final Widget child;

  ///button type of the [toast] dailogue
  final  button;

  ///  background color of the [toast]  dailogue
  final Color bgColor;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// textStyle type for the [text] declared in the [toast] dialogue
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