import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';

class GFListTile extends StatelessWidget {
  /// The card's background color.
  final Color color;

  /// [GFAvatar] used to create rounded user profile
  final GFAvatar avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The descriprion to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  const GFListTile(
      {Key key,
      this.color,
      this.avatar,
      this.title,
      this.subTitle,
        this.description,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: title,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          subTitle ?? Container(),
          description ?? Container()
          ],
      ),
      trailing: icon,
    );
  }
}