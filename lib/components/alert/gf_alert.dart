import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';

class GFAlert extends StatefulWidget {
  /// Alert has to be wrap inside the body like [GFFloatingWidget]. See [GFFloatingWidget]
  const GFAlert(
      {Key key,
      this.child,
      this.backgroundColor,
      this.content,
      this.width,
      this.type = GFAlertType.basic,
      this.alignment,
      this.contentChild,
      this.title,
      this.bottombar,
      this.contentTextStyle = const TextStyle(color: Colors.black87),
      this.titleTextStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      )})
      : super(key: key);

  /// child of  type [Widget]is alternative to title key. title will get priority over child
  final Widget child;

  /// title of type [String] used to describe the title of the [GFAlert]
  final String title;

  /// child of  type [Widget]is alternative to title key. title will get priority over contentchild
  final Widget contentChild;

  /// title of type [String] used to describe the content of the [GFAlert]
  final String content;

  ///type of [TextStyle] to change the style of the title not for the child
  final TextStyle titleTextStyle;

  ///pass color of type [Color] or [GFColors] for background of [GFAlert]
  final Color backgroundColor;

  ///type of [TextStyle] to change the style of the content not for the contentchild
  final TextStyle contentTextStyle;

  /// width of type [double] used to control the width of the [GFAlert]
  final double width;

  ///type of [GFAlertType] which takes the type ie, basic, rounded and fullWidth for the [GFAlert]
  final GFAlertType type;

  /// type of [Alignment] used to align the text inside the [GFAlert]
  final Alignment alignment;

  ///type of [Widget] used for the buttons ie, OK, Cancel for the action in [GFAlert]
  final Widget bottombar;

  @override
  _GFAlertState createState() => _GFAlertState();
}

class _GFAlertState extends State<GFAlert> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: animation,
        child: Column(
          children: <Widget>[
            Container(
              width: widget.type == GFAlertType.fullWidth
                  ? MediaQuery.of(context).size.width
                  : widget.width ?? MediaQuery.of(context).size.width * 0.885,
              constraints: const BoxConstraints(minHeight: 50),
              margin: widget.type == GFAlertType.fullWidth
                  ? const EdgeInsets.only(left: 0, right: 0)
                  : const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: widget.type == GFAlertType.basic
                      ? BorderRadius.circular(3)
                      : widget.type == GFAlertType.rounded
                          ? BorderRadius.circular(10)
                          : BorderRadius.zero,
                  color: widget.backgroundColor != null
                      ? widget.backgroundColor
                      : GFColors.WHITE,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.40), blurRadius: 3)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: widget.alignment ?? Alignment.topLeft,
                    child: widget.title != null
                        ? Text(widget.title, style: widget.titleTextStyle)
                        : (widget.child ?? Container()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: widget.alignment ?? Alignment.topLeft,
                    child: widget.content != null
                        ? Text(widget.content, style: widget.contentTextStyle)
                        : (widget.contentChild ?? Container()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.bottombar ?? Container(),
                ],
              ),
            ),
          ],
        ),
      );
}
