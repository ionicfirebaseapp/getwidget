import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GFAvatarTitleBar extends StatelessWidget {

  const GFAvatarTitleBar({
    Key key,
    this.color,
    this.padding,
    this.margin,
    this.image,
    this.title,
    this.subTitle,
  }) : super(key: key);

  /// The card's background color.
  final Color color;

  /// The empty space that surrounds the card. Defines the card's outer [Container.margin].
  final EdgeInsetsGeometry margin;

  /// The empty space that surrounds the card. Defines the card's outer [Container.margin]..
  final EdgeInsetsGeometry padding;

  /// gfAvatar used to create rounded user profile
  final Image image;

  /// any widget can be used as title
  final Widget title;

  /// any widget can be used as subTitle
  final Widget subTitle;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin ?? const EdgeInsets.all(16.0),
      padding: padding ?? const EdgeInsets.all(12.0),
      child: Container(
        child: Center(child: Text('test'),),
        height: 190.0,
        width: MediaQuery.of(context).size.width - 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
            image: DecorationImage(
                image: new NetworkImage(
                    "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"
                ),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}



