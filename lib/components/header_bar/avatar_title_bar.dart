import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';

class GFAvatarTitleBar extends StatelessWidget {

  const GFAvatarTitleBar({
    Key key,
    this.color,
    this.padding,
    this.margin,
    this.avatar,
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
  final GFAvatar avatar;

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
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            avatar,
            const SizedBox(width: 12.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title,
                subTitle,
              ],
            )
          ],
        ),
      ),
    );
  }
}



