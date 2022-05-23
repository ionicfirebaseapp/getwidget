

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/text_field/gf_text_field.dart';

class GFTextFieldRounded extends StatefulWidget{

  const GFTextFieldRounded({
    Key? key,
    required this.normalbordercolor,
    this.focusedbordercolor=Colors.green,
    this.errorbordercolor=Colors.red,
    this.idlebordercolor=Colors.black,
    required this.borderwidth,
    required this.cornerradius,
    this.controller,
    this.initialValue='',
    this.focusNode,
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

  }) :super(key: key);

  final Color normalbordercolor;
  final Color focusedbordercolor;
  final Color errorbordercolor;
  final Color idlebordercolor;
  final double borderwidth;
  final double cornerradius;
  final TextEditingController? controller;
  final String initialValue;
  final FocusNode? focusNode;
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


  @override
  _GFTextFieldRoundedState createState()=> _GFTextFieldRoundedState();
}

class _GFTextFieldRoundedState extends State<GFTextFieldRounded>{

  @override
  Widget build(BuildContext context)=>
     GFTextField(
      decoration:  InputDecoration(
        border:  OutlineInputBorder(
          borderSide:  BorderSide(
            color: widget.normalbordercolor,
            width: widget.borderwidth,
          ),
          borderRadius: BorderRadius.circular(widget.cornerradius),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide:  BorderSide(
            color: widget.focusedbordercolor,
            width: widget.borderwidth,
          ),
          borderRadius: BorderRadius.circular(widget.cornerradius),
        ),
        disabledBorder:  OutlineInputBorder(
          borderSide:  BorderSide(
            color: widget.idlebordercolor,
            width: widget.borderwidth,
          ),
          borderRadius: BorderRadius.circular(widget.cornerradius),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide:  BorderSide(
            color: widget.errorbordercolor,
            width: widget.borderwidth,
          ),
          borderRadius: BorderRadius.circular(widget.cornerradius),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide:  BorderSide(
            color: widget.focusedbordercolor,
            width: widget.borderwidth,
          ),
          borderRadius: BorderRadius.circular(widget.cornerradius),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide:  BorderSide(
            color: widget.errorbordercolor,
            width: widget.borderwidth,
          ),
          borderRadius: BorderRadius.circular(widget.cornerradius),
        ),
      ),
         controller:widget.controller,
         initialValue:widget.initialValue,
         focusNode:widget.focusNode,
         keyboardType:widget.keyboardType,
         textCapitalization:widget.textCapitalization,
         textInputAction:widget.textInputAction,
         style:widget.style,
         strutStyle:widget.strutStyle,
         textDirection:widget.textDirection,
         textAlign:widget.textAlign,
         textAlignVertical:widget.textAlignVertical,
         autofocus:widget.autofocus,
         readOnly:widget.readOnly,
         toolbarOptions:widget.toolbarOptions,
         showCursor:widget.showCursor,
         obscuringCharacter:widget.obscuringCharacter,
         obscureText:widget.obscureText,
         autocorrect:widget.autocorrect,
         smartDashesType:widget.smartDashesType,
         smartQuotesType:widget.smartQuotesType,
         enableSuggestions:widget.enableSuggestions,
         autovalidate:widget.autovalidate,
         maxLengthEnforced:widget.maxLengthEnforced,
         maxLines:widget.maxLines,
         minLines:widget.minLines,
         expands:widget.expands,
         maxLength:widget.maxLength,
         onChanged:widget.onChanged,
         onTap:widget.onTap,
         onEditingComplete:widget.onEditingComplete,
         onFieldSubmitted:widget.onFieldSubmitted,
         onSaved:widget.onSaved,
         validator:widget.validator,
         inputFormatters:widget.inputFormatters,
         enabled:widget.enabled,
         cursorWidth:widget.cursorWidth,
         cursorHeight:widget.cursorHeight,
         cursorRadius:widget.cursorRadius,
         cursorColor:widget.cursorColor,
         color:widget.color,
         borderradius:widget.borderradius,
         keyboardAppearance:widget.keyboardAppearance,
         scrollPadding:widget.scrollPadding,
         enableInteractiveSelection:widget.enableInteractiveSelection,
         buildCounter:widget.buildCounter,
         scrollPhysics:widget.scrollPhysics,
         autofillHints:widget.autofillHints,
         autovalidateMode:widget.autovalidateMode
    );

}