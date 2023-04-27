import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFAlert extends StatefulWidget {
  /// Alert has to be wrap inside the body like [GFFloatingWidget]. See [GFFloatingWidget]

  const GFAlert({
    Key? key,
    this.title,
    this.titleTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    this.titleAlignment,
    this.subtitle,
    this.subtitleTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    this.subtitleAlignment,
    this.bottomBar,
    this.bottomBarAlignment,
    this.content,
    this.contentAlignment,
    this.backgroundColor,
    this.width,
    this.type = GFAlertType.rounded,
    this.alignment,
    this.padding,
    this.shadow,
    this.borderRadius,
    this.okButtonText,
    this.cancelButtonText,
    this.okButtonTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.lightBlue,
    ),
    this.cancelButtonTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.lightBlue,
    ),
    this.onTapCancel,
    this.onTapOk,
  }) : super(key: key);

  /// title of type [String] used to describe the title of the [GFAlert]
  final String? title;

  ///type of [TextStyle] to change the style of the title
  final TextStyle titleTextStyle;

  /// type of [Alignment] used to align the title text inside the [GFAlert]
  final Alignment? titleAlignment;

  /// title of type [String] used to describe the subtitle of the [GFAlert]
  final String? subtitle;

  ///type of [TextStyle] to change the style of the subtitle
  final TextStyle subtitleTextStyle;

  /// type of [Alignment] used to align the subtitle text inside the [GFAlert]
  final Alignment? subtitleAlignment;

  ///ContentChild of type [Widget] can be used to show a widget with contents in the [GFAlert]
  final Widget? content;

  /// type of [Alignment] used to align the content widget [GFAlert]
  final Alignment? contentAlignment;

  /// bottomBar of  type [Widget] can be used to show a widget at the bottom of subtitle.
  final Widget? bottomBar;

  /// type of [Alignment] used to align the bottom widget [GFAlert]
  final Alignment? bottomBarAlignment;

  /// type of [List] of type [BoxShadow] to give shadow to [GFAlert]
  final List<BoxShadow>? shadow;

  /// type of [EdgeInsetsGeometry] to give padding inside [GFAlert]
  final EdgeInsetsGeometry? padding;

  /// type of [double] to give circular radius to [GFAlert]
  final double? borderRadius;

  ///pass color of type [Color] or [GFColors] for background of [GFAlert]
  final Color? backgroundColor;

  /// width of type [double] used to control the width of the [GFAlert]
  final double? width;

  ///type of [GFAlertType] which takes the type ie, basic, rounded and fullWidth for the [GFAlert]
  final GFAlertType type;

  /// type of [Alignment] used to align the [GFAlert]
  final Alignment? alignment;

  /// type of [String] used to replace the text of cancel button in [GFAlert]
  final String? cancelButtonText;

  ///type of [TextStyle] to change the style of the cancel button text
  final TextStyle cancelButtonTextStyle;

  ///type of [TextStyle] to change the style of the ok button text
  final TextStyle okButtonTextStyle;

  /// type of [String] used to replace the text of ok button in [GFAlert]
  final String? okButtonText;

  /// type of [Function] used for tap on ok button in [GFAlert]
  final void Function()? onTapOk;

  /// type of [Function] used for tap on cancel button in [GFAlert]
  final void Function()? onTapCancel;

  @override
  _GFAlertState createState() => _GFAlertState();
}

class _GFAlertState extends State<GFAlert> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

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
            Align(
              alignment: widget.alignment ?? Alignment.center,
              child: Container(
                width: widget.type == GFAlertType.fullWidth
                    ? MediaQuery.of(context).size.width
                    : widget.width ?? MediaQuery.of(context).size.width * 0.885,
                constraints: const BoxConstraints(
                  minHeight: 50,
                ),
                margin: widget.type == GFAlertType.fullWidth
                    ? const EdgeInsets.only(
                        left: 0,
                        right: 0,
                      )
                    : const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 20,
                      ),
                padding: widget.padding ??
                    const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 10,
                    ),
                decoration: BoxDecoration(
                  borderRadius: widget.type == GFAlertType.basic
                      ? BorderRadius.circular(3)
                      : widget.type == GFAlertType.rounded
                          ? BorderRadius.circular(
                              widget.borderRadius ?? 10,
                            )
                          : BorderRadius.zero,
                  color: widget.backgroundColor ?? GFColors.WHITE,
                  boxShadow: widget.shadow ??
                      [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.1),
                          offset: const Offset(0, 1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                ),
                child: ClipRRect(
                  borderRadius: widget.type == GFAlertType.rounded
                      ? BorderRadius.circular(
                          widget.borderRadius ?? 10,
                        )
                      : BorderRadius.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (widget.title != null) ...[
                        Align(
                          alignment: widget.titleAlignment ?? Alignment.topLeft,
                          child: Text(
                            widget.title!,
                            style: widget.titleTextStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                      if (widget.subtitle != null) ...[
                        Align(
                            alignment:
                                widget.subtitleAlignment ?? Alignment.topLeft,
                            child: Text(
                              widget.subtitle!,
                              style: widget.subtitleTextStyle,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                      if (widget.content != null) ...[
                        Align(
                          alignment:
                              widget.contentAlignment ?? Alignment.centerLeft,
                          child: widget.content,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                      Align(
                        alignment:
                            widget.bottomBarAlignment ?? Alignment.bottomRight,
                        child: widget.bottomBar ??
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: Text(
                                      widget.cancelButtonText ?? 'CANCEL',
                                      style: widget.cancelButtonTextStyle,
                                    ),
                                    onPressed: widget.onTapCancel,
                                  ),
                                  TextButton(
                                      child: Text(
                                        widget.okButtonText ?? 'OK',
                                        style: widget.okButtonTextStyle,
                                      ),
                                      onPressed: widget.onTapOk),
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
