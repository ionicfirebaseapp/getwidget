import 'package:flutter/material.dart';

class GFList extends StatefulWidget {

  const GFList(
      {Key key,
        this.child,
        this.text = 'Lorem ipsum',
        this.icon = const Icon(Icons.keyboard_arrow_right),
        this.textStyle,
        this.showDivider= true

      })
      : super(key: key);



  final Widget child;

  final String text;

  final Widget icon;

  final TextStyle textStyle;

  final bool showDivider;


  @override
  _GFListState createState() => _GFListState();
}

class _GFListState extends State<GFList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(right: 5, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                flex: 7,
                fit: FlexFit.tight,
                child: widget.text != null
                    ? Text(widget.text, style: widget.textStyle)
                    : (widget.child ?? Container()),
              ),
              SizedBox(
                width: 10,
              ),
              widget.icon != null
                  ? Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: widget.icon,
                  ))
                  : Container()
            ],
          ),
         widget.showDivider? Divider(): Container(),
        ],
      )

    );
  }
}
