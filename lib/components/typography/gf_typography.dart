import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class GFTypography extends StatelessWidget {
  /// Creates simple title with underline. Style of title can be changed using [GFTypographyType]
  /// showDivider is default true, can be set false.
  const GFTypography({
    Key key,
    this.type = GFTypographyType.typo4,
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
    this.backgroundImagecolorFilter,
  }) : super(key: key);

  /// child of  type [Widget] is alternative to text key. text will get priority over child
  final Widget child;

  /// text of type [String] is alternative to child. text will get priority over child
  final String text;

  ///icon of type [Widget] used to pass icon or image
  final Widget icon;

  /// Pass [GFColors] or [Color] for dividerColor
  final Color dividerColor;

  /// Pass [GFColors] or [Color] for textColor
  final Color textColor;

  /// dividerBorderRadius of type [BorderRadius] to alter the radius of the divider
  final BorderRadius dividerBorderRadius;

  ///dividerAlignment of type [Alignment] used for aligning the divider to required alignment
  final Alignment dividerAlignment;

  ///Pass [bool] value to show or hide the divider
  final bool showDivider;

  ///pass [double] type to increase or decrease the width of the divider
  final double dividerWidth;

  ///backgroundImage of type [ImageProvider] to set the background of [GFTypography]
  final ImageProvider backgroundImage;

  ///backgroundImagecolorFilter of type [ColorFilter] to set the
  ///background color of [GFTypography] only when backgroundImage is available
  final ColorFilter backgroundImagecolorFilter;

  /// header type of [GFTypographyType] i.e, typo1, typo2, typo3, typo4, typo5, typo6
  final GFTypographyType type;

  @override
  Widget build(BuildContext context) {
    double fontSize;

    if (type == GFTypographyType.typo1) {
      fontSize = 25.0;
    } else if (type == GFTypographyType.typo2) {
      fontSize = 22.0;
    } else if (type == GFTypographyType.typo3) {
      fontSize = 19.0;
    } else if (type == GFTypographyType.typo4) {
      fontSize = 17.0;
    } else if (type == GFTypographyType.typo5) {
      fontSize = 15.0;
    } else if (type == GFTypographyType.typo6) {
      fontSize = 13.0;
    }

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
              icon ?? Container(),
              icon != null
                  ? const Padding(padding: EdgeInsets.only(left: 10))
                  : Container(),
              text != null
                  ? Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                            color: textColor ??
                                (backgroundImage != null
                                    ? Colors.white
                                    : Colors.black),
                            fontSize: fontSize,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : child
            ],
          ),
          showDivider
              ? Container(
                  margin: const EdgeInsets.only(top: 3, bottom: 3),
                  alignment: dividerAlignment,
                  child: Container(
                    width: dividerWidth != null ? dividerWidth : 70,
                    height: fontSize / 5,
                    decoration: BoxDecoration(
                      color: dividerColor ??
                          (backgroundImage != null
                              ? Colors.white
                              : Colors.black),
                      borderRadius: dividerBorderRadius ??
                          const BorderRadius.all(
                            Radius.circular(5),
                          ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
