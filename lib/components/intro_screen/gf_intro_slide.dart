import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

class GFIntroSlide extends StatelessWidget {
  const GFIntroSlide({
    Key key,
    @required this.image,
    this.imageHeight = 100,
    this.imageWidth = 100,
    this.title,
    this.subTitle,
    this.titleStyle = const TextStyle(fontSize: 20, color: GFColors.DARK),
    this.subTitleStyle = const TextStyle(fontSize: 16, color: GFColors.DARK),
    this.backgroundColor = GFColors.PRIMARY,
  }) : super(key: key);
  final double imageHeight;
  final double imageWidth;
  final ImageProvider image;
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
            GFImageOverlay(
                height: imageHeight,
                colorFilter: const ColorFilter.mode(null, null),
                width: imageWidth,
                image: image),
            const SizedBox(
              height: 20,
            ),
            Text(
              title ?? 'Title',
              style: titleStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              subTitle ?? 'Sub Title',
              style: subTitleStyle,
            )
          ],
        ),
      );
}
