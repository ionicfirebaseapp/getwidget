import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/colors/gf_color.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';

class GFListTile extends StatelessWidget {
  /// The GFListTile's background color. Can be given [Colors] or [GFColor]
  final dynamic color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget trailing;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  ///type of [bool] corresponds to true or false to show or hide the divider
  final bool showDivider;

  /// The empty space that surrounds the card. Defines the card's outer [Container.padding]..
  final EdgeInsetsGeometry padding;

  /// The divider's height extent.
  ///
  /// The divider itself is always drawn as a horizontal line that is centered
  /// within the height specified by this value.
  ///
  /// If this is null, then the [DividerThemeData.space] is used. If that is
  /// also null, then this defaults to 16.0.
  final double dividerHeight;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// height of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.dividerThickness] is used. If
  /// that is also null, then this defaults to 0.0.
  final double dividerThickness;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double dividerIndent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double dividerEndIndent;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  final Color dividerColor;

  /// Creates ListTile with leading, title, trailing, image widget for almost every type of ListTile design.
  const GFListTile(
      {Key key,
      this.color,
      this.avatar,
      this.title,
      this.subTitle,
      this.description,
      this.icon,
      this.showDivider = true,
      this.padding,
      this.trailing,
      this.dividerEndIndent,
      this.dividerHeight,
      this.dividerIndent,
      this.dividerThickness,
      this.dividerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: padding,
          color: color,
          child: ListTile(
            leading: avatar,
            title: title,
            subtitle: subTitle != null || description != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      subTitle ?? Container(),
                      description ?? Container()
                    ],
                  )
                : Container(),
            trailing: Padding(padding: EdgeInsets.only(top: 16.0), child: icon),
          ),
        ),
        showDivider == true
            ? Divider(
                height: dividerHeight == null ? 16.0 : dividerHeight,
                thickness: dividerThickness == null ? 1.0 : dividerThickness,
                color: dividerColor == null
                    ? Theme.of(context).dividerColor
                    : dividerColor,
                indent: dividerIndent == null ? 0.0 : dividerIndent,
                endIndent: dividerEndIndent == null ? 0.0 : dividerEndIndent,
              )
            : Container(
                height: 10.0,
              )
      ],
    );
  }
}
