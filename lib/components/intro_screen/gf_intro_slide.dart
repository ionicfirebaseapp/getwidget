import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFIntroSlide extends StatelessWidget {
  const GFIntroSlide({
    Key key,
    this.child,
    this.image,
    this.title,
    this.subTitle,
    this.subTitleText,
    this.titleText,
    this.titleStyle = const TextStyle(fontSize: 20, color: GFColors.DARK),
    this.subTitleStyle = const TextStyle(fontSize: 16, color: GFColors.DARK),
    this.backgroundColor,
  }) : super(key: key);

  /// defines [GFIntroSlide] [child], it takes nay widget
  final Widget child;

  /// defines [GFIntroSlide] [image]
  final Image image;

  /// defines [title]'s text string
  final String titleText;

  /// defines [subTitle]'s text string
  final String subTitleText;

  /// defines [title]'s text string
  final Text title;

  /// defines [title]'s textStyle
  final TextStyle titleStyle;

  /// defines [subTitle]'s text
  final Text subTitle;

  /// defines [subTitle]'s textStyle
  final TextStyle subTitleStyle;

  /// defines [GFIntroSlide] backgroundColor
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            image != null ? image : Container(),
            child != null ? child : Container(),
            const SizedBox(
              height: 20,
            ),
            titleText != null ? Text(
              titleText,
              style: titleStyle,
            ) : title != null ? title : Container(),
            const SizedBox(
              height: 40,
            ),
            subTitleText != null ? Text(
              subTitleText,
              style: subTitleStyle,
            ) : subTitle != null ? subTitle : Container()
          ],
        ),
      );
}
