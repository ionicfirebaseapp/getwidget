import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFToast extends StatelessWidget {
  ///
  GFToast({
    Key key,
    this.child,
    this.button,
    this.backgroundColor,
    this.text,
    this.textStyle = const TextStyle(color: Colors.white70),
  }) : super(key: key);

  /// child of  type [Widget]is alternative to text key. text will get priority over child
  final Widget child;

  /// button of type [Widget],or you can use [GFButton] for easy implementation with [GFToast]
  final Widget button;

  ///pass color of type [Color] or [GFColor] for background of [GFToast]
  final dynamic backgroundColor;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// textStyle will be applicable to text only and not for the child
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50.0,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: backgroundColor != null
              ? getGFColor(backgroundColor)
              : Color(0xff323232),
        ),
        child: Row(
//        mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: text != null
                  ? Text(text, style: textStyle)
                  : (child ?? Container()),
            ),
            SizedBox(
              width: 10,
            ),
            button != null
                ? Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: button,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
