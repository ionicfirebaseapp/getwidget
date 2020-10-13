import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFMultiSelect<T> extends StatefulWidget {
  ///
  const GFMultiSelect({
    @required this.items,
    @required this.titleText,
    this.selectedTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    this.color,
    this.avatar,
    this.padding = const EdgeInsets.all(5),
    this.margin = const EdgeInsets.all(5),
    this.size = GFSize.SMALL,
    this.type = GFCheckboxType.basic,
    this.checkColor = GFColors.WHITE,
    this.activebgColor = GFColors.WHITE,
    this.inactivebgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.WHITE,
    this.submitbutton,
    this.expandedicon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black87,
      size: 30,
    ),
    this.collapsedicon = const Icon(
      Icons.keyboard_arrow_up,
      color: Colors.black87,
      size: 30,
    ),
    this.dropdownbgColor = Colors.white,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.DARK,
    ),
    this.inactiveIcon,
    this.custombgColor = GFColors.SUCCESS,
    this.selected = false,
    this.dropdownTitleTileBorder,
    this.dropdownTitleTileBorderRadius = const BorderRadius.all(Radius.circular(4)),
    this.dropdownTitleTileColor = GFColors.WHITE,
    this.hideDropdownUnderline = false,
    this.dropdownUnderlineColor = Colors.black12,
    this.dropdownTitleTileMargin = const EdgeInsets.all(16),
    this.dropdownTitleTilePadding = const EdgeInsets.all(12),
    this.onSelect,
    Key key,
  })  : assert(selected != null),
        super(key: key);

  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

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

  /// Called when the user checks or unchecks the checkbox.
  // final ValueChanged<bool> onChanged;

  ///Used to set the current state of the checkbox
  // final bool value;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color custombgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  final List items;

  final Widget submitbutton;

  final Color dropdownbgColor;

  final TextStyle selectedTextStyle;

  final Widget expandedicon;

  final Widget collapsedicon;

  /// The border radius  of the dropdown.
  final BorderRadius dropdownTitleTileBorderRadius;

  /// The border radius  of the dropdown.
  final Border dropdownTitleTileBorder;

  /// The border radius  of the dropdown.
  final dynamic dropdownTitleTileColor;

  final bool hideDropdownUnderline;

  final dynamic dropdownUnderlineColor;

  final EdgeInsets dropdownTitleTileMargin;

  final EdgeInsets dropdownTitleTilePadding;

  final ValueChanged<T> onSelect;

  @override
  _GFMultiSelectState createState() => _GFMultiSelectState();
}

class _GFMultiSelectState<T> extends State<GFMultiSelect<T>> {
  bool check = true;
  bool isdrop = false;
  bool check1 = false;

  final _controller = TextEditingController();

  final List _selectedTitles = [];

  void _onItemSelect(bool selected, String title) {
    if (selected == true) {
      setState(() {
        _selectedTitles.add(title);
      });
    } else {
      setState(() {
        _selectedTitles.remove(title);
      });
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  isdrop = !isdrop;
                });
              },
              child: Container(
                  margin: widget.dropdownTitleTileMargin,
                  padding: widget.dropdownTitleTilePadding,
                  decoration: BoxDecoration(
                      color: widget.dropdownTitleTileColor,
                    border: widget.dropdownTitleTileBorder,
                    borderRadius: widget.dropdownTitleTileBorderRadius
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        border: widget.hideDropdownUnderline ? const Border(bottom: BorderSide(color: Colors.white))
                      : Border(bottom: BorderSide(color: widget.dropdownUnderlineColor)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _selectedTitles.isEmpty ?
                        Expanded(child: Text(widget.titleText, style: widget.selectedTextStyle)) :
                        Expanded(child: Text(_selectedTitles.join(',  ').toString(), style: widget.selectedTextStyle)),
                        !isdrop ? widget.expandedicon : widget.collapsedicon,
                      ],
                    ),
                  ))),
          isdrop
              ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: widget.dropdownbgColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                            children: List.generate(
                                widget.items.length,
                                (index) => GFCheckboxListTile(
                                      value: _selectedTitles
                                          .contains(widget.items[index]),
                                      onChanged: widget.onSelect != null ? widget.onSelect : (bool selected) {
                                        _controller.text;
                                        print('index $index');
                                        _onItemSelect(
                                            selected, widget.items[index]);
                                      },
                                      selected: widget.selected,
                                      avatar: widget.avatar,
                                      titleText: widget.items[index],
                                      color: widget.color,
                                      padding: widget.padding,
                                      margin: widget.margin,
                                      size: widget.size,
                                      activebgColor: widget.activebgColor,
                                      inactiveIcon: widget.inactiveIcon,
                                      activeBorderColor:
                                          widget.activeBorderColor,
                                      inactivebgColor: widget.inactivebgColor,
                                      activeIcon: widget.activeIcon,
                                      inactiveBorderColor:
                                          widget.inactiveBorderColor,
                                      custombgColor: widget.custombgColor,
                                      checkColor: widget.checkColor,
                                      type: widget.type,
                                    ))),
                        GFButton(
                          onPressed: () {
                            setState(() {
                              isdrop = !isdrop;
                            });
                          },
                          child: widget.submitbutton ?? const Text('OK'),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      );
}
