import 'package:flutter/material.dart';
import 'package:getflutter/colors/gf_color.dart';

class GFAccordian extends StatefulWidget {
  const GFAccordian(
      {Key key,
      this.child,
      this.description,
      this.titlebackgroundColor,
      this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
      this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
      this.text,
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
      this.titlePadding,
      this.descriptionPadding,
      this.descriptionbackgroundColor,
      this.margin})
      : super(key: key);

  /// child of  type [Widget]is alternative to text key. text will get priority over child
  final Widget child;

  /// description of type[Widget] which shows the messages after the [GFAccordian] is expanded
  final Widget description;

  /// type of [Color] or [GFColor] which is used to change the background color of the [GFAccordian] title
  final dynamic titlebackgroundColor;

  ///collapsedIcon of type [Widget] which is used to show when the [GFAccordian] is collapsed
  final Widget collapsedIcon;

  ///expandedIcon of type[Widget] which is used when the [GFAccordian] is expanded
  final Widget expandedIcon;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  /// textStyle of type [textStyle] will be applicable to text only and not for the child
  final TextStyle textStyle;

  ///titlePadding of type [EdgeInsets] which is used to set the padding of the [GFAccordian] title
  final EdgeInsets titlePadding;

  ///descriptionPadding of type [EdgeInsets] which is used to set the padding of the [GFAccordian] description
  final EdgeInsets descriptionPadding;

  /// type of [Color] or [GFColor] which is used to change the background color of the [GFAccordian] description
  final dynamic descriptionbackgroundColor;

  ///margin of type [EdgeInsets] which is used to set the margin of the [GFAccordian]
  final EdgeInsets margin;

  @override
  _GFAccordianState createState() => _GFAccordianState();
}

class _GFAccordianState extends State<GFAccordian>
    with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    offset = Tween(begin: Offset(0.0, -0.06), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  bool showAccordian = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin != null ? widget.margin : EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                switch (controller.status) {
                  case AnimationStatus.completed:
                    controller.forward(from: 0);
                    break;
                  case AnimationStatus.dismissed:
                    controller.forward();
                    break;
                  default:
                }
                showAccordian = !showAccordian;
              });
            },
            child: Container(
              color: widget.titlebackgroundColor != null
                  ? widget.titlebackgroundColor
                  : Colors.white,
              padding: widget.titlePadding != null
                  ? widget.titlePadding
                  : EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: widget.text != null
                        ? Text(widget.text, style: widget.textStyle)
                        : (widget.child ?? Container()),
                  ),
                  showAccordian ? widget.expandedIcon : widget.collapsedIcon
                ],
              ),
            ),
          ),
          showAccordian
              ? Container(
                  color: widget.descriptionbackgroundColor != null
                      ? widget.descriptionbackgroundColor
                      : Colors.white70,
                  padding: widget.descriptionPadding != null
                      ? widget.descriptionPadding
                      : EdgeInsets.all(10),
                  child: SlideTransition(
                      position: offset,
                      child: widget.description != null
                          ? widget.description
                          : Container()))
              : Container()
        ],
      ),
    );
  }
}
