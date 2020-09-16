import 'package:flutter/material.dart';

class GFDropdown<T> extends StatefulWidget {
  GFDropdown(
      {Key key,
      @required this.items,
      this.menuitems,
      this.icon,
      this.selectedItemBuilder,
      this.value,
      this.hint,
      this.disabledHint,
      @required this.onChanged,
      this.onTap,
      this.elevation = 8,
      this.style,
      this.underline,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconSize = 24.0,
      this.isDense = false,
      this.isExpanded = false,
      this.itemHeight = kMinInteractiveDimension,
      this.focusColor,
      this.focusNode,
      this.autofocus = false,
      this.dropdownColor,
      this.padding = const EdgeInsets.all(5),
      this.borderRadius = const BorderRadius.all(Radius.circular(4)),
      this.borderColor});

  DropdownButtonBuilder selectedItemBuilder;
  final List<DropdownMenuItem<T>> items;
  final List<DropdownMenuItem<T>> menuitems;

  final Widget icon;
  final int elevation;
  final T value;
  final Color borderColor;
  final EdgeInsets padding;

  final Widget hint;
  final Widget disabledHint;
  final ValueChanged<T> onChanged;

  final VoidCallback onTap;
  final TextStyle style;

  final Widget underline;

  final Color iconDisabledColor;

  final Color iconEnabledColor;

  final double iconSize;

  final bool isDense;

  final bool isExpanded;

  final double itemHeight;

  final Color focusColor;

  final FocusNode focusNode;

  final bool autofocus;

  final Color dropdownColor;

  final BorderRadius borderRadius;

  @override
  _GFDropdownState createState() => _GFDropdownState();
}

class _GFDropdownState extends State<GFDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            border: Border.all(
                color: widget.borderColor != null
                    ? widget.borderColor
                    : Colors.white)),
        child: DropdownButton(
          items: widget.items,
          selectedItemBuilder: widget.selectedItemBuilder,
          value: widget.value,
          hint: widget.hint,
          disabledHint: widget.disabledHint,
          onChanged: widget.onChanged == null ? null : widget.onChanged,
          onTap: widget.onTap,
          elevation: widget.elevation,
          style: widget.style,
          icon: widget.icon,
          iconDisabledColor: widget.iconDisabledColor,
          iconEnabledColor: widget.iconEnabledColor,
          iconSize: widget.iconSize,
          isDense: widget.isDense,
          isExpanded: widget.isExpanded,
          itemHeight: widget.itemHeight,
          focusColor: widget.focusColor,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          dropdownColor: widget.dropdownColor,
        ));
  }

  // Widget menuitem() {
  //   final List<ListItem> items;

  //   List:['bcdncjs', 'cniskdcmdk'];
  //   return Container(
  //    child:Text('j')

  // }
}
