import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

class GFIntroSlide extends StatelessWidget {
  const GFIntroSlide({
    Key key,
    this.child,
    this.image,
    this.title,
    this.subTitle,
    this.titleStyle = const TextStyle(fontSize: 20, color: GFColors.DARK),
    this.subTitleStyle = const TextStyle(fontSize: 16, color: GFColors.DARK),
    this.backgroundColor = GFColors.PRIMARY,
  }) : super(key: key);

  final Widget child;
  final Image image;
  final String title;
  final TextStyle titleStyle;
  final String subTitle;
  final TextStyle subTitleStyle;
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
            title != null ? Text(
              title,
              style: titleStyle,
            ) : Container(),
            const SizedBox(
              height: 40,
            ),
            subTitle != null ? Text(
              subTitle,
              style: subTitleStyle,
            ) : Container()
          ],
        ),
      );
}
