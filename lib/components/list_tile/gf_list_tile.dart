import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/colors/gf_color.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';

class GFListTile extends StatelessWidget {
  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  ///type of [String] used to pass text, alternative to subtitle property and gets higher priority than subtitle
  final String subtitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColor]
  final dynamic color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  final EdgeInsets padding;

  /// Creates ListTile with leading, title, trailing, image widget for almost every type of ListTile design.
  const GFListTile({
    Key key,
    this.titleText,
    this.subtitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.icon,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      padding: EdgeInsets.all(8.0),
//      margin: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          avatar != null ? avatar : Container(),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      titleText != null
                          ? Text(
                              titleText,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: GFColors.getGFColor(GFColor.dark)),
                            )
                          : title ?? Container(),
                      subtitleText != null
                          ? Text(
                              subtitleText,
                              style: TextStyle(
                                  fontSize: 14.5, color: Colors.black54),
                            )
                          : subTitle ?? Container(),
                      description ?? Container()
                    ],
                  ))),
          icon != null ? icon : Container(),
        ],
      ),
    );
  }
}
