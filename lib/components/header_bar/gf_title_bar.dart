import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';

class GFTitleBar extends StatelessWidget {

  const GFTitleBar({
    Key key,
    this.color,
    this.padding,
    this.margin,
    this.avatar,
    this.title,
    this.subTitle,
    this.icon
  }) : super(key: key);

  /// The card's background color.
  final Color color;

  /// The empty space that surrounds the card. Defines the card's outer [Container.margin].
  final EdgeInsetsGeometry margin;

  /// The empty space that surrounds the card. Defines the card's outer [Container.padding].
  final EdgeInsetsGeometry padding;

  /// [GFAvatar] used to create rounded user profile
  final GFAvatar avatar;

  /// The title to display inside the [GFTitleBar]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFTitleBar]. see [Text]
  final Widget subTitle;

  /// The icon to display inside the [GFTitleBar]. see [Icon]
  final Widget icon;

  @override
  Widget build(BuildContext context) {

    return Container(
//      margin: margin ?? const EdgeInsets.all(16.0),
//      padding: padding ?? const EdgeInsets.all(12.0),
      child: ListTile(
          leading: avatar,
          title: title,
          subtitle: subTitle,
          trailing: icon,
      ),
    );
  }
}



