import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GFTextField extends FormField<String>{

  GFTextField({
    Key? key,
    this.controller,
    this.initialValue='',
    this.focusNode,
    this.decoration=const InputDecoration(),
    this.keyboardType=TextInputType.text,
    this.textCapitalization=TextCapitalization.none,
    this.textInputAction,
    this.style=const TextStyle(),
    this.strutStyle=const StrutStyle(),
    this.textDirection=TextDirection.ltr,
    this.textAlign=TextAlign.start,
    this.textAlignVertical=TextAlignVertical.center,
    this.autofocus=false,
    this.readOnly=false,
    this.toolbarOptions=const ToolbarOptions(copy: true,cut: true,paste: true,selectAll: true),
    this.showCursor,
    this.obscuringCharacter='.',
    this.obscureText=false,
    this.autocorrect=true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions=true,
    this.autovalidate=true,
    this.maxLengthEnforced=MaxLengthEnforcement.none,
    this.maxLines=1,
    this.minLines=1,
    this.expands=true,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled=true,
    this.cursorWidth=2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.color,
    this.borderradius,
    this.keyboardAppearance,
    this.scrollPadding=const EdgeInsets.all(20),
    this.enableInteractiveSelection=true,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode=AutovalidateMode.disabled
  }) : super(key:key,builder: (FormFieldState<String> field){
    final InputDecoration effectiveDecoration = (decoration ??
        const InputDecoration())
        .applyDefaults(Theme.of(field.context).inputDecorationTheme);
    void onChangedHandler(String value) {
      if (onChanged != null) {
        onChanged(value);
      }
      field.didChange(value);
    }
    return _GfTextFieldState(
        state: field,
           controller: controller,
          focusNode: focusNode,
          decoration:effectiveDecoration,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign??TextAlign.start,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          textCapitalization: textCapitalization,
          autofocus: autofocus,
          toolbarOptions: toolbarOptions,
          readOnly: readOnly??false,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType ??
              (obscureText
                  ? SmartDashesType.disabled
                  : SmartDashesType.enabled),
          smartQuotesType: smartQuotesType ??
              (obscureText
                  ? SmartQuotesType.disabled
                  : SmartQuotesType.enabled),
          enableSuggestions: enableSuggestions,
          maxLengthEnforced: maxLengthEnforced,
          maxLines: maxLines,
          minLines: minLines,
          expands: (maxLines!=null && minLines!=null)?false:true,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth??1,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          scrollPadding: scrollPadding,
          scrollPhysics: scrollPhysics,
          keyboardAppearance: keyboardAppearance,
          enableInteractiveSelection: enableInteractiveSelection,
          buildCounter: buildCounter,
          autofillHints: autofillHints,

    );
      });


  final TextEditingController? controller;
  final String initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization ;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign ;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus ;
  final bool? readOnly ;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final bool? autovalidate;
  final MaxLengthEnforcement maxLengthEnforced;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth ;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? color;
  final Radius? borderradius;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding ;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;


}

class _GfTextFieldState extends StatelessWidget{
  FormFieldState<String> state;
  TextEditingController? _controller;
  TextEditingController? controller;
  final String initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization ;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign ;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus ;
  final bool? readOnly ;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final bool? autovalidate;
  final MaxLengthEnforcement maxLengthEnforced;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth ;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? color;
  final Radius? borderradius;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding ;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;
  _GfTextFieldState({
    required this.state,
    this.controller,
    this.initialValue = '',
    this.focusNode,
    this.decoration = const InputDecoration(hintText: 'Default style'),
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style = const TextStyle(),
    this.strutStyle = const StrutStyle(),
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions = const ToolbarOptions(
        copy: true, cut: true, paste: true, selectAll: true),
    this.showCursor,
    this.obscuringCharacter = '.',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.autovalidate = true,
    this.maxLengthEnforced = MaxLengthEnforcement.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.expands = true,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.color,
    this.borderradius,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.enableInteractiveSelection = true,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.disabled
  }){
    _controller=controller;
    if(_controller==null){
      _controller=TextEditingController(text: state.value.toString());
    }
  }

        @override
        Widget build(BuildContext context)=>Container(
            child: TextField(
            controller: _controller,
            focusNode: focusNode,
            decoration:decoration,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign??TextAlign.start,
            textAlignVertical: textAlignVertical,
            textDirection: textDirection,
            textCapitalization: textCapitalization,
            autofocus: autofocus,
            toolbarOptions: toolbarOptions,
            readOnly: readOnly??false,
            showCursor: showCursor,
            obscuringCharacter: obscuringCharacter,
            obscureText: obscureText,
            autocorrect: autocorrect,
            smartDashesType: smartDashesType ??
            (obscureText
            ? SmartDashesType.disabled
                : SmartDashesType.enabled),
            smartQuotesType: smartQuotesType ??
            (obscureText
            ? SmartQuotesType.disabled
                : SmartQuotesType.enabled),
            enableSuggestions: enableSuggestions,
            maxLengthEnforcement: maxLengthEnforced,
            maxLines: maxLines,
            minLines: minLines,
            expands: (maxLines!=null && minLines!=null)?false:true,
            maxLength: maxLength,
            onChanged: onChanged,
            onTap: onTap,
            onEditingComplete: onEditingComplete,
            onSubmitted: onFieldSubmitted,
            inputFormatters: inputFormatters,
            enabled: enabled ,
            cursorWidth: cursorWidth??1,
            cursorHeight: cursorHeight,
            cursorRadius: cursorRadius,
            cursorColor: cursorColor,
            scrollPadding: scrollPadding,
            scrollPhysics: scrollPhysics,
            keyboardAppearance: keyboardAppearance,
            enableInteractiveSelection: enableInteractiveSelection,
            buildCounter: buildCounter,
            autofillHints: autofillHints,
            ),
            );
    }
