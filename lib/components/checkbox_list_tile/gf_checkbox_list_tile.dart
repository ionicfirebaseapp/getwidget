import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFCheckboxListTile extends StatelessWidget {
  /// [GFCheckboxListTile] is a tile with small box at right (as in a checklist)
  /// in which to place a check mark to make a selection with various customization options.
  const GFCheckboxListTile({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.titleText,
    this.subtitleText,
    this.color,
    this.avatar,
    this.title,
    this.subtitle,
    this.icon,
    this.description,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.size = GFSize.MEDIUM,
    this.type = GFCheckboxType.basic,
    this.activeBgColor = GFColors.PRIMARY,
    this.inactiveBgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.DARK,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.WHITE,
    ),
    this.inactiveIcon,
    this.customBgColor = GFColors.SUCCESS,
    this.position = GFPosition.end,
    this.selected = false,
    this.autofocus = false,
  })  : assert(value != null),
        assert(selected != null),
        assert(autofocus != null),
        super(key: key);

  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  ///type of [String] used to pass text, alternative to subtitle property and gets higher priority than subtitle
  final String subtitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color color;

  /// If position is start Checkbox will come instead of avatar,
  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subtitle to display inside the [GFListTile]. see [Text]
  final Widget subtitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// defines the margin of GFListTile
  final EdgeInsets margin;

  /// defines the padding of GFListTile
  final EdgeInsets padding;

  /// type of [GFCheckboxType] which is of four type is basic, sqaure, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// Position allows user to set position of [GFCheckbox] based on given [GFPosition]
  final GFPosition position;

  /// type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  /// type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  /// If position is end Checkbox will come instead of icon, The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final GFCheckbox checkbox = GFCheckbox(
        autofocus: autofocus,
        onChanged: onChanged,
        value: value,
        size: size,
        activeBgColor: activeBgColor,
        inactiveIcon: inactiveIcon,
        activeBorderColor: activeBorderColor,
        inactiveBgColor: inactiveBgColor,
        activeIcon: activeIcon,
        inactiveBorderColor: inactiveBorderColor,
        customBgColor: customBgColor,
        // checkColor: checkColor,
        type: type);
    return MergeSemantics(
      child: GFListTile(
        autofocus: autofocus,
        enabled: onChanged != null,
        onTap: onChanged != null
            ? () {
                onChanged(!value);
              }
            : null,
        selected: selected,
        avatar: position == GFPosition.start ? checkbox : avatar,
        titleText: titleText,
        subtitle: subtitle,
        subtitleText: subtitleText,
        description: description,
        color: color,
        padding: padding,
        margin: margin,
        title: title,
        icon: position == GFPosition.end ? checkbox : icon,
      ),
    );
  }
}
