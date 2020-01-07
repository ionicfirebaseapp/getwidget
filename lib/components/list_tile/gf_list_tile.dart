import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';

class GFListTile extends StatelessWidget {
  /// The card's background color.
  final Color color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The descriprion to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  ///type of [bool] corresponds to true or false to show or hide the divider
  final bool showDivider;

  ///type of [double] , the height corresponds to the height of the [GFListTile] which should not be less than the [minHeight]
  final double height;

  ///type of [double], the minHeight corresponds to the minimun height of the [GFListTile]
  final double minHeight;

  const GFListTile(
      {Key key,
      this.color,
      this.avatar,
      this.title,
      this.subTitle ,
      this.description ,
      this.icon,
        this.height,
        this.minHeight,
      this.showDivider = true
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: color !=null? color: getGFColor(GFColor.white),
        constraints: BoxConstraints(minHeight: minHeight !=null ? minHeight: 60),
         height: height,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
              leading: avatar,
              title: title,
              subtitle:  subTitle != null || description != null ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  subTitle ?? Container(),
                  description ?? Container()
                ],
              ): null,
              trailing: icon != null ?  Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: title != null ? 15.0 : 0.0), child:
                  icon )
                ],
              ): null
          ),
          showDivider ? Divider() : Container()
        ],
    ),
      );
  }
}