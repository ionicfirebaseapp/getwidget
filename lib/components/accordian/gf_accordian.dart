import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class GFAccordion extends StatefulWidget {
  const GFAccordion(
      {Key key,
      this.child,
      this.content,
      this.collapsedTitlebackgroundColor = GFColors.WHITE,
      this.expandedTitlebackgroundColor = const Color(0xFFE0E0E0),
      this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
      this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
      this.title,
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
      this.titlePadding = const EdgeInsets.all(10),
      this.contentbackgroundColor,
      this.contentPadding = const EdgeInsets.all(10),
      this.contentChild,
      this.titleborder = const Border(),
      this.contentBorder = const Border(),
      this.margin})
      : super(key: key);

  /// child of  type [Widget]is alternative to title key. title will get priority over child
  final Widget child;

  /// content of type[String] which shows the messages after the [GFAccordion] is expanded
  final String content;

  /// contentChild of  type [Widget]is alternative to content key. content will get priority over contentChild
  final Widget contentChild;

  /// type of [Color] or [GFColors] which is used to change the background color of the [GFAccordion] title when it is collapsed
  final Color collapsedTitlebackgroundColor;

  /// type of [Color] or [GFColors] which is used to change the background color of the [GFAccordion] title when it is expanded
  final Color expandedTitlebackgroundColor;

  ///collapsedIcon of type [Widget] which is used to show when the [GFAccordion] is collapsed
  final Widget collapsedIcon;

  ///expandedIcon of type[Widget] which is used when the [GFAccordion] is expanded
  final Widget expandedIcon;

  /// text of type [String] is alternative to child. text will get priority over child
  final String title;

  /// textStyle of type [textStyle] will be applicable to text only and not for the child
  final TextStyle textStyle;

  ///titlePadding of type [EdgeInsets] which is used to set the padding of the [GFAccordion] title
  final EdgeInsets titlePadding;

  ///descriptionPadding of type [EdgeInsets] which is used to set the padding of the [GFAccordion] description
  final EdgeInsets contentPadding;

  /// type of [Color] or [GFColors] which is used to change the background color of the [GFAccordion] description
  final Color contentbackgroundColor;

  ///margin of type [EdgeInsets] which is used to set the margin of the [GFAccordion]
  final EdgeInsets margin;

  ///titleborderColor of type  [Color] or [GFColors] which is used to change the border color of title
  final Border titleborder;

  ///contentBorderColor of type  [Color] or [GFColors] which is used to change the border color of content
  final Border contentBorder;

  @override
  _GFAccordionState createState() => _GFAccordionState();
}

class _GFAccordionState extends State<GFAccordion>
    with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController controller;
  Animation<Offset> offset;
  bool showAccordion = false;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    offset = Tween(
      begin: const Offset(0, -0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin ?? const EdgeInsets.all(10),
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
                  showAccordion = !showAccordion;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: widget.titleborder,
                  color: showAccordion
                      ? widget.expandedTitlebackgroundColor
                      : widget.collapsedTitlebackgroundColor,
                ),
                padding: widget.titlePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: widget.title != null
                          ? Text(widget.title, style: widget.textStyle)
                          : (widget.child ?? Container()),
                    ),
                    showAccordion ? widget.expandedIcon : widget.collapsedIcon
                  ],
                ),
              ),
            ),
            showAccordion
                ? Container(
                    decoration: BoxDecoration(
                      border: widget.contentBorder,
                      color: widget.contentbackgroundColor ?? Colors.white70,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: widget.contentPadding,
                    child: SlideTransition(
                      position: offset,
                      child: widget.content != null
                          ? Text(widget.content)
                          : (widget.contentChild ?? Container()),
                    ))
                : Container()
          ],
        ),
      );
}
