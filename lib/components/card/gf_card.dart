import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/components/button_bar/gf_button_bar.dart';
import 'package:ui_kit/components/header_bar/gf_title_bar.dart';

enum GFCardType { basic, social, image}

class GFCard extends StatelessWidget {

  const GFCard({
    Key key,
    this.color,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.padding = const EdgeInsets.all(12.0),
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer,
    this.avatar,
    this.title,
    this.subTitle,
    this.subTitleTextStyle,
    this.titleTextStyle,
    this.content,
    this.image,
    this.icon,
    this.buttonBar,
  }) : assert(elevation == null || elevation >= 0.0),
        assert(borderOnForeground != null),
        super(key: key);

  /// The card's background color.
  final Color color;

  /// The z-coordinate at which to place this card. This controls the size of the shadow below the card.
  final double elevation;

  /// The shape of the card's [Material].
  final ShapeBorder shape;

  /// Whether to paint the [shape] border in front of the [child].
  final bool borderOnForeground;

  /// If this property is null then [ThemeData.cardTheme.clipBehavior] is used.
  final Clip clipBehavior;

  /// The empty space that surrounds the card. Defines the card's outer [Container.margin].

  final EdgeInsetsGeometry margin;

  /// The empty space that surrounds the card. Defines the card's outer [Container.margin]..
  final EdgeInsetsGeometry padding;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  final bool semanticContainer;

  /// The widget below this widget in the tree.
  final Widget child;

  /// gfAvatar used to create rounded user profile
  final GFAvatar avatar;

  /// The title to display inside the [GFTitleBar]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFTitleBar]. see [Text]
  final Widget subTitle;

  /// The icon to display inside the [GFTitleBar]. see [Icon]
  final Widget icon;

  /// pass [style] as title's textStyle
  final TextStyle titleTextStyle;

  /// pass [style] as subTitle's textStyle
  final TextStyle subTitleTextStyle;

  /// widget can be used to define content
  final Widget content;

  /// image widget can be used
  final Image image;

  /// widget can be used to define buttons bar, see [GFButtonBar]
  final GFButtonBar buttonBar;

  static const double _defaultElevation = 1.0;
  static const Clip _defaultClipBehavior = Clip.none;

  @override
  Widget build(BuildContext context) {
    final CardTheme cardTheme = CardTheme.of(context);

//    Text gfTitle = Text(title,
//      style: titleTextStyle == null ? TextStyle(color: Colors.black87, fontSize: 18.0, fontWeight: FontWeight.w600) : titleTextStyle,
//    );
//    Text gfSubTitle = Text(subTitle,
//      style: subTitleTextStyle == null ? TextStyle(color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w400) : subTitleTextStyle,
//    );

    return Container(
      margin: margin ?? cardTheme.margin ?? const EdgeInsets.all(16.0),
      child: Material(
        type: MaterialType.card,
        color: color ?? cardTheme.color ?? Theme.of(context).cardColor,
        elevation: elevation ?? cardTheme.elevation ?? _defaultElevation,
        shape: shape ?? cardTheme.shape ?? const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior ?? cardTheme.clipBehavior ?? _defaultClipBehavior,
        child: Column(
          children: <Widget>[
            GFTitleBar(
              avatar: avatar,
              title: title,
              subTitle: subTitle,
              icon: icon,
            ),
            image,
            Padding(
              padding: padding,
              child: content,
            ),
            buttonBar,
          ],
        ),
      ),
    );
  }
}



