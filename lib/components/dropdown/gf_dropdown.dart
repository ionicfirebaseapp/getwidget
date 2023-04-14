import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFDropdown<T> extends StatefulWidget {
  /// GF Dropdown let user to select from the number of items and display selected
  /// item in the button. It displays list of items in the overlay dropdown fashion.
  const GFDropdown(
      {Key? key,
      required this.items,
      this.icon,
      this.selectedItemBuilder,
      this.value,
      this.hint,
      this.disabledHint,
      required this.onChanged,
      this.onTap,
      this.elevation = 8,
      this.style,
      this.underline,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconSize = 24.0,
      this.isDense = true,
      this.isExpanded = false,
      this.itemHeight = 40,
      this.focusColor,
      this.focusNode,
      this.autofocus = false,
      this.dropdownColor,
      this.validator,
      this.padding = const EdgeInsets.all(8),
      this.borderRadius = const BorderRadius.all(Radius.circular(4)),
      this.border = const BorderSide(
          color: Colors.transparent, width: 1, style: BorderStyle.solid),
      this.dropdownButtonColor = GFColors.WHITE})
      : super(key: key);

  final DropdownButtonBuilder? selectedItemBuilder;
  final List<DropdownMenuItem<T>>? items;

  /// The widget to use for the drop-down button's icon.
  /// Defaults to an [Icon] with the [Icons.arrow_drop_down] glyph.
  final Widget? icon;

  /// The z-coordinate at which to place the menu when open.
  final int elevation;

  /// The value of the currently selected [DropdownMenuItem].
  final T? value;

  /// Defines the border of dropdown button
  final BorderSide border;

  /// Defines the padding given inside the dropdown
  final EdgeInsets padding;

  /// A placeholder widget that is displayed by the dropdown button.
  final Widget? hint;

  /// A message to show when the dropdown is disabled.
  final Widget? disabledHint;

  /// Called when the user selects an item.
  /// If the [onChanged] callback is null or the list of [DropdownButton.items]
  /// is null then the dropdown button will be disabled,
  final ValueChanged<T?>? onChanged;

  /// Called when the dropdown button is tapped.
  final VoidCallback? onTap;

  /// Defaults to the [TextTheme.titleMedium] value of the current
  /// [ThemeData.textTheme] of the current [Theme].
  final TextStyle? style;

  /// The widget to use for drawing the drop-down button's underline.
  final Widget? underline;

  /// The color of any [Icon] descendant of [icon] if this button is disabled,
  /// i.e. if [onChanged] is null.
  final Color? iconDisabledColor;

  /// The color of any [Icon] descendant of [icon] if this button is enabled,
  /// i.e. if [onChanged] is defined.
  final Color? iconEnabledColor;

  /// The size to use for the drop-down button's down arrow icon button.
  final double iconSize;

  /// Reduce the button's height.
  final bool isDense;

  /// Set the dropdown's inner contents to horizontally fill its parent.
  final bool isExpanded;

  /// Defines the height of the menu items
  final double? itemHeight;

  /// The color for the button's [Material] when it has the input focus.
  final Color? focusColor;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  /// Defines the background color of the dropdown.
  final Color? dropdownColor;

  /// Defines the border radius  of the dropdown.
  final BorderRadius borderRadius;

  /// Defines the background color of the dropdownButton.
  final dynamic dropdownButtonColor;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  final FormFieldValidator<T>? validator;

  @override
  State<GFDropdown<T>> createState() => _GFDropdownState<T>();
}

class _GFDropdownState<T> extends State<GFDropdown<T>> {
  @override
  Widget build(BuildContext context) => FormField<T>(
        validator: widget.validator,
        builder: (state) => Material(
            color: widget.dropdownButtonColor,
            shape: RoundedRectangleBorder(
              side: widget.border,
              borderRadius: widget.borderRadius,
            ),
            child: Column(
              children: [
                Container(
                  height: widget.itemHeight,
                  padding: widget.padding,
                  child: DropdownButton<T>(
                    items: widget.items,
                    selectedItemBuilder: widget.selectedItemBuilder,
                    value: widget.value,
                    hint: widget.hint,
                    disabledHint: widget.disabledHint,
                    onChanged: widget.onChanged != null
                        ? (val) {
                            widget.onChanged!(val);
                            state.didChange(val);
                          }
                        : null,

                    onTap: widget.onTap,
                    elevation: widget.elevation,
                    style: widget.style,
                    icon: widget.icon,
                    iconDisabledColor: widget.iconDisabledColor,
                    iconEnabledColor: widget.iconEnabledColor,
                    iconSize: widget.iconSize,
                    isDense: widget.isDense,
                    isExpanded: widget.isExpanded,
                    // itemHeight: widget.itemHeight,
                    focusColor: widget.focusColor,
                    focusNode: widget.focusNode,
                    autofocus: widget.autofocus,
                    dropdownColor: widget.dropdownColor,
                  ),
                ),
                state.hasError
                    ? Text(
                        state.errorText!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      )
                    : Container(),
              ],
            )),
      );
}
