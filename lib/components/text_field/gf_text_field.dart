import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';



class GFTextField extends StatefulWidget {

    GFTextField({
   Key key,
    this.controller,
    String initialValue,
    FocusNode focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction,
    TextStyle style,
    StrutStyle strutStyle,
    TextDirection textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions toolbarOptions,
    bool showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType smartDashesType,
    SmartQuotesType smartQuotesType,
    bool enableSuggestions = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int minLines,
    bool expands = false,
    int maxLength,
    ValueChanged<String> onChanged,
    GestureTapCallback onTap,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    List<TextInputFormatter> inputFormatters,
    bool enabled,
    double cursorWidth = 2.0,
    double cursorHeight,
    Radius cursorRadius,
    Color cursorColor,
    Brightness keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder buildCounter,
    ScrollPhysics scrollPhysics,
    Iterable<String> autofillHints,
    AutovalidateMode autovalidateMode,
  })   : assert(initialValue == null || controller == null),
       assert(textAlign != null),
       assert(autofocus != null),
       assert(readOnly != null),
       assert(obscuringCharacter != null && obscuringCharacter.length == 1),
       assert(obscureText != null),
       assert(autocorrect != null),
       assert(enableSuggestions != null),
       assert(autovalidate != null),
       assert(
         autovalidate == false ||
         autovalidate == true && autovalidateMode == null,
         'autovalidate and autovalidateMode should not be used together.'
       ),
       assert(maxLengthEnforced != null),
       assert(scrollPadding != null),
       assert(maxLines == null || maxLines > 0),
       assert(minLines == null || minLines > 0),
       assert(
         (maxLines == null) || (minLines == null) || (maxLines >= minLines),
         "minLines can't be greater than maxLines",
       ),
       assert(expands != null),
       assert(
         !expands || (maxLines == null && minLines == null),
         'minLines and maxLines must be null when expands is true.',
       ),
       assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
       assert(maxLength == null || maxLength > 0),
       assert(enableInteractiveSelection != null),
       super(
       key: key,
       initialValue: controller != null ? controller.text : (initialValue ?? ''),
       onSaved: onSaved,
       validator: validator,
       enabled: enabled ?? decoration?.enabled ?? true,
       autovalidateMode: autovalidate
           ? AutovalidateMode.always
           : (autovalidateMode ?? AutovalidateMode.disabled),
       builder: (FormFieldState<String> field) {
         final _TextFormFieldState state = field as _TextFormFieldState;
         final InputDecoration effectiveDecoration = (decoration ?? const InputDecoration())
             .applyDefaults(Theme.of(field.context).inputDecorationTheme);});
  @override
  _GFTextFieldState createState() => _GFTextFieldState();
}

class _GFTextFieldState extends State<GFTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(),
    );
  }
}
