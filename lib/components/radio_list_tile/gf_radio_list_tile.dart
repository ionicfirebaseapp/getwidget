import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFRadioListTile<T> extends StatelessWidget {
  const GFRadioListTile({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.titleText,
    this.subtitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(16),
    this.size = GFSize.MEDIUM,
    this.type = GFCheckboxType.basic,
    this.checkColor = GFColors.WHITE,
    this.activebgColor = GFColors.PRIMARY,
    this.inactivebgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.DARK,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.WHITE,
    ),
    this.inactiveIcon = const Icon(Icons.close),
    this.custombgColor = GFColors.SUCCESS,
    this.selected = false,
    this.autofocus = false,
    this.toggleable
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

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

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

  /// type pf [Color] used to change the checkcolor when the checkbox is active
  final Color checkColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activebgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactivebgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color custombgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T groupValue;

  final bool toggleable;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<T> onChanged;

  /// Whether this radio button is checked.
  ///
  /// To control this value, set [value] and [groupValue] appropriately.
  bool get checked => value == groupValue;

  @override
  Widget build(BuildContext context) => MergeSemantics(
    child: GFListTile(
      autofocus: autofocus,
      enabled: onChanged != null,
      onTap: onChanged != null ? () {
        if (toggleable && checked) {
          onChanged(null);
          return;
        }
        if (!checked) {
          onChanged(value);
        }
      } : null,
      selected: selected,
      avatar: avatar,
      titleText: titleText,
      subTitle: subTitle,
      subtitleText: subtitleText,
      description: description,
      color: color,
      padding: padding,
      margin: margin,
      title: title,
      icon: GFRadio(
        autofocus: autofocus,
        onChanged: onChanged,
        value: value,
        groupValue: groupValue,
        size: size,
        activebgColor: activebgColor,
        inactiveIcon: inactiveIcon,
        activeBorderColor: activeBorderColor,
        inactivebgColor: inactivebgColor,
        activeIcon: activeIcon,
        inactiveBorderColor: inactiveBorderColor,
        custombgColor: custombgColor,
      ),
    ),
  );
}
