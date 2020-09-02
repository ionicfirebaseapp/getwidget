import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFRadioListTile<T> extends StatelessWidget {
  const GFRadioListTile({
    Key key,
  @required this.value,
  @required this.groupValue,
  @required this.onChanged,
  this.size = GFSize.SMALL,
  this.type = GFRadioType.basic,
  this.radioColor = GFColors.SUCCESS,
  this.activebgColor = GFColors.WHITE,
  this.inactivebgColor = GFColors.WHITE,
  this.activeBorderColor = GFColors.DARK,
  this.inactiveBorderColor = GFColors.DARK,
  this.activeIcon = const Icon(
  Icons.check,
  size: 20,
  color: GFColors.DARK,
  ),
  this.inactiveIcon = const Icon(
  Icons.close,
  size: 20,
  color: GFColors.DARK,
  ),
  this.custombgColor = GFColors.SUCCESS,
  this.autofocus = false,
  this.focusNode,
  this.toggleable = false
  })
      : assert(autofocus != null),
  assert(toggleable != null),
  super(key: key);



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
