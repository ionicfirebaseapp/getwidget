import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFHeader extends StatelessWidget {
  const GFHeader(
      {Key key,
      this.child,
      this.text,
      this.icon,
      this.dividerBorderRadius,
      this.textColor,
      this.dividerAlignment,
      this.dividerColor,
      this.showDivider = true,
      this.dividerWidth,
      this.backgroundImage,
      this.backgroundImagecolorFilter})
      : super(key: key);


  /// child of  type [Widget] is alternative to text key. text will get priority over child
  final Widget child;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  ///icon of type [Widget] used to pass icon or image
  final Widget icon;

  /// Pass [GFColor] or [Color] for dividerColor
  final dynamic dividerColor;

  /// Pass [GFColor] or [Color] for textColor
  final dynamic textColor;

  /// dividerBorderRadius of type [BorderRadius] to alter the radius of the divider
  final BorderRadius dividerBorderRadius;

  ///dividerAlignment of type [Alignment] used for aligning the divider to required alignment
  final Alignment dividerAlignment;

  ///Pass [bool] value to show or hide the divider
  final bool showDivider;

  ///pass [double] type to increase or decrease the width of the divider
  final double dividerWidth;

  ///backgroundImage of type [ImageProvider] to set the background of [GFHeader]
  final ImageProvider backgroundImage;

  ///backgroundImagecolorFilter of type [ColorFilter] to set the background color of [GFHeader] only when backgroundImage is available
  final ColorFilter backgroundImagecolorFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(backgroundImage != null ? 10 : 0),
        decoration: BoxDecoration(
          image: backgroundImage != null
              ? DecorationImage(
                  image: backgroundImage,
                  fit: BoxFit.cover,
                  colorFilter: backgroundImagecolorFilter ??
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                icon != null ? icon : Container(),
                icon != null
                    ? Padding(padding: EdgeInsets.only(left: 10))
                    : Container(),
                text != null
                    ? Text(
                        text,
                        style: TextStyle(
                            color: textColor != null
                                ? getGFColor(textColor)
                                : backgroundImage != null
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 16,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500),
                      )
                    : child
              ],
            ),
            showDivider
                ? Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: dividerAlignment,
                    child: Container(
                      width: dividerWidth != null ? dividerWidth : 70,
                      height: 4,
                      decoration: BoxDecoration(
                          color: dividerColor != null
                              ? getGFColor(dividerColor)
                              : backgroundImage != null
                                  ? Colors.white
                                  : Colors.black,
                          borderRadius: dividerBorderRadius != null
                              ? dividerBorderRadius
                              : BorderRadius.all(Radius.circular(5))),
                    ))
                : Container()
          ],
        ));
  }
}
