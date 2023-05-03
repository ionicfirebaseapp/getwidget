import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFListTile extends StatelessWidget {
  /// Creates ListTile with leading, title, trailing, image widget for almost every type of ListTile design.
  const GFListTile({
    Key? key,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.icon,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.listItemTextColor = GFColors.DARK,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
    this.firstButtonTitle,
    this.secondButtonTitle,
    this.onFirstButtonTap,
    this.onSecondButtonTap,
    this.firstButtonTextStyle,
    this.secondButtonTextStyle,
    this.radius,
    this.shadow,
  }) : super(key: key);

  /// type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String? titleText;

  /// type of [String] used to pass text, alternative to subTitle property and gets higher priority than subTitle
  final String? subTitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color? color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget? avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget? title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget? subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget? description;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget? icon;

  /// defines the margin of GFListTile
  final EdgeInsets margin;

  /// defines the padding of GFListTile
  final EdgeInsets padding;

  /// Whether this list tile is interactive.
  ///
  /// If false, this list tile is styled with the disabled color from the
  /// current [Theme] and the [onTap] and [onLongPress] callbacks are
  /// inoperative.
  final bool enabled;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback? onTap;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureLongPressCallback? onLongPress;

  /// If this tile is also [enabled] then icons and text are rendered with the same color.
  ///
  /// By default the selected color is the theme's primary color. The selected color
  /// can be overridden with a [ListTileTheme].
  final bool selected;

  /// The color for the tile's [Material] when it has the input focus.
  final Color? focusColor;

  /// The color for the color of the list item text.
  final Color? listItemTextColor;

  /// The color for the tile's [Material] when a pointer is hovering over it.
  final Color? hoverColor;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  /// The firstButtonTitle to display inside the [GFListTile]. see [Text]
  final String? firstButtonTitle;

  /// The secondButtonTitle to display inside the [GFListTile]. see [Text]
  final String? secondButtonTitle;

  /// The style for the firstButtonText.
  final TextStyle? firstButtonTextStyle;

  /// The style for the secondButtonText.
  final TextStyle? secondButtonTextStyle;

  /// Called when the user taps on the first button.
  final GestureTapCallback? onFirstButtonTap;

  /// Called when the user taps on the second button.
  final GestureTapCallback? onSecondButtonTap;

  /// the circular radius of [GFListTile]
  final double? radius;

  final BoxShadow? shadow;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        canRequestFocus: enabled,
        focusNode: focusNode,
        focusColor: focusColor,
        hoverColor: hoverColor,
        autofocus: autofocus,
        child: Semantics(
          selected: selected,
          enabled: enabled,
          child: Container(
            // constraints: const BoxConstraints(minHeight: 50),
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
              boxShadow: color != null
                  ? [
                      shadow ??
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),

                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: const Offset(
                                2, 4), // changes position of shadow
                          ),
                    ]
                  : [],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    avatar ?? Container(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            titleText != null
                                ? Text(
                                    titleText!,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: listItemTextColor),
                                  )
                                : title ?? Container(),
                            subTitleText != null
                                ? Text(
                                    subTitleText!,
                                    style: const TextStyle(
                                      fontSize: 14.5,
                                      color: Colors.black54,
                                    ),
                                  )
                                : subTitle ?? Container(),
                            description ?? Container()
                          ],
                        ),
                      ),
                    ),
                    icon ?? Container(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (firstButtonTitle?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: onFirstButtonTap,
                          child: Text(firstButtonTitle ?? '',
                              style: firstButtonTextStyle),
                        ),
                      ),
                    if (secondButtonTitle?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: onSecondButtonTap,
                          child: Text(
                            secondButtonTitle ?? '',
                            style: secondButtonTextStyle,
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
