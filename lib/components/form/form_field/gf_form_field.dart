import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/form/form_field/decorations/gf_formfield_decoration.dart';
import 'package:getwidget/components/form/form_field/validators/validators.dart';
import 'package:getwidget/components/form/form_field/widgets/gf_formradiobutton.dart';
import 'package:getwidget/components/form/form_field/widgets/gf_questionwidget.dart';
import 'package:getwidget/components/text_field/gf_text_field.dart';
import 'package:getwidget/shape/gf_textfield_shape.dart';
import 'package:getwidget/types/gf_form_field_type.dart';

class GfFormField extends StatefulWidget {
  GfFormField(
      {Key? key,
      required this.gfFormFieldType,
      required this.editingbordercolor,
      required this.idlebordercolor,
      required this.borderwidth,
      required this.hintText,
      this.shape,
      this.backgroundcolor,
      this.normalbordercolor = Colors.grey,
      this.focusedbordercolor = Colors.green,
      this.errorbordercolor = Colors.red,
      this.disabledbordercolor = Colors.black,
      this.iconPrefix,
      this.paddingvertical = 3,
      this.paddinghorizontal = 4,
      this.marginvertical = 3,
      this.marginhorizontal = 4,
      this.controller,
      this.initialValue = '',
      this.focusNode,
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
      this.expands = false,
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
      this.autovalidateMode = AutovalidateMode.disabled,
      this.onGenderChanged,
      this.initialGender,
      this.question,
      this.acceptButtonText,
      this.declineButtonText,
      this.onQuestionWidgetChanged})
      : super(key: key) {
    if (gfFormFieldType == GfFormFieldType.question && question == null) {
      throw Exception('Question cannot be Null for question widget');
    }
  }
  final GfFormFieldType gfFormFieldType;
  final Color normalbordercolor;
  final Color editingbordercolor;
  final Color focusedbordercolor;
  final Color errorbordercolor;
  final Color idlebordercolor;
  final Color disabledbordercolor;
  final double borderwidth;
  final double? paddingvertical;
  final double? paddinghorizontal;
  final double? marginvertical;
  final double? marginhorizontal;
  final Color? backgroundcolor;
  final GFTextFieldShape? shape;
  final String hintText;
  final Widget? iconPrefix;
  final TextEditingController? controller;
  final String initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool? readOnly;
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
  final Function(String?)? onGenderChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? color;
  final double? borderradius;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;
  final String? initialGender;
  final String? question;
  final String? acceptButtonText;
  final String? declineButtonText;
  final Function(String?)? onQuestionWidgetChanged;

  @override
  _GfFormFieldState createState() => _GfFormFieldState();
}

class _GfFormFieldState extends State<GfFormField>
    with AutomaticKeepAliveClientMixin {
  String value = 'India';
  final List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antigua &amp; Barbuda',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia',
    'Bosnia &amp; Herzegovina',
    'Botswana',
    'Brazil',
    'British Virgin Islands',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Cape Verde',
    'Cayman Islands',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Congo',
    'Cook Islands',
    'Costa Rica',
    'Cote D Ivoire',
    'Croatia',
    'Cruise Ship',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Estonia',
    'Ethiopia',
    'Falkland Islands',
    'Faroe Islands',
    'Fiji',
    'Finland',
    'France',
    'French Polynesia',
    'French West Indies',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guam',
    'Guatemala',
    'Guernsey',
    'Guinea',
    'Guinea Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Isle of Man',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jersey',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kuwait',
    'Kyrgyz Republic',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macau',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Namibia',
    'Nepal',
    'Netherlands',
    'Netherlands Antilles',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Norway',
    'Oman',
    'Pakistan',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Puerto Rico',
    'Qatar',
    'Reunion',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Pierre &amp; Miquelon',
    'Samoa',
    'San Marino',
    'Satellite',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'South Africa',
    'South Korea',
    'Spain',
    'Sri Lanka',
    'St Kitts &amp; Nevis',
    'St Lucia',
    'St Vincent',
    'St. Lucia',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor LEste',
    'Togo',
    'Tonga',
    'Trinidad &amp; Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Turks &amp; Caicos',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'Uruguay',
    'Uzbekistan',
    'Venezuela',
    'Vietnam',
    'Virgin Islands (US)',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getFormWidget(widget.gfFormFieldType);
  }

  Widget getFormWidget(GfFormFieldType type) {
    Widget retwidget = Container();
    switch (type) {
      case GfFormFieldType.name:
        retwidget = Container(
          margin: EdgeInsets.symmetric(
              vertical: widget.marginvertical ?? 2,
              horizontal: widget.marginhorizontal ?? 2),
          padding: EdgeInsets.symmetric(
              vertical: widget.paddingvertical ?? 2,
              horizontal: widget.paddinghorizontal ?? 2),
          child: GFTextField(
              decoration: GfFormFieldDecoration(
                context: context,
                shape: widget.shape ?? GFTextFieldShape.roundedsquare,
                borderRadius: widget.borderradius ?? 6.0,
                editingBorderColor: widget.editingbordercolor,
                idleBorderColor: widget.idlebordercolor,
                gfprefixIcon: widget.iconPrefix,
                bgfilled: true,
                bgcolor: widget.backgroundcolor,
                hinttext: widget.hintText.isNotEmpty ? widget.hintText : 'Name',
              ),
              controller: widget.controller,
              fieldinitialValue: widget.initialValue,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              textInputAction: widget.textInputAction,
              style: widget.style,
              strutStyle: widget.strutStyle,
              textDirection: widget.textDirection,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              enableSuggestions: widget.enableSuggestions,
              autovalidate: widget.autovalidate,
              maxLengthEnforced: widget.maxLengthEnforced,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onfieldSaved: widget.onSaved,
              validatornew:
                  widget.validator ?? GfFormValidators().getnamevalidator(),
              inputFormatters: widget.inputFormatters,
              fieldEnabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              color: widget.color,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              buildCounter: widget.buildCounter,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              autovalidateMode: widget.autovalidateMode),
        );
        break;
      case GfFormFieldType.password:
        retwidget = Container(
            margin: EdgeInsets.symmetric(
                vertical: widget.marginvertical ?? 2,
                horizontal: widget.marginhorizontal ?? 2),
            padding: EdgeInsets.symmetric(
                vertical: widget.paddingvertical ?? 2,
                horizontal: widget.paddinghorizontal ?? 2),
            child: GFTextField(
                decoration: GfFormFieldDecoration(
                  context: context,
                  shape: GFTextFieldShape.roundedsquare,
                  borderRadius: widget.borderradius ?? 6.0,
                  editingBorderColor: widget.editingbordercolor,
                  idleBorderColor: widget.idlebordercolor,
                  gfprefixIcon: widget.iconPrefix,
                  bgfilled: true,
                  bgcolor: widget.backgroundcolor,
                  hinttext:
                      widget.hintText.isNotEmpty ? widget.hintText : 'Name',
                ),
                controller: widget.controller,
                fieldinitialValue: widget.initialValue,
                focusNode: widget.focusNode,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
                textInputAction: widget.textInputAction,
                style: widget.style,
                strutStyle: widget.strutStyle,
                textDirection: widget.textDirection,
                textAlign: widget.textAlign,
                textAlignVertical: widget.textAlignVertical,
                autofocus: widget.autofocus,
                readOnly: widget.readOnly,
                toolbarOptions: widget.toolbarOptions,
                showCursor: widget.showCursor,
                obscuringCharacter: widget.obscuringCharacter,
                obscureText: true,
                autocorrect: widget.autocorrect,
                smartDashesType: widget.smartDashesType,
                smartQuotesType: widget.smartQuotesType,
                enableSuggestions: widget.enableSuggestions,
                autovalidate: widget.autovalidate,
                maxLengthEnforced: widget.maxLengthEnforced,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                expands: widget.expands,
                maxLength: widget.maxLength,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                onEditingComplete: widget.onEditingComplete,
                onFieldSubmitted: widget.onFieldSubmitted,
                onfieldSaved: widget.onSaved,
                validatornew: widget.validator ??
                    GfFormValidators().getpasswordvalidator(),
                inputFormatters: widget.inputFormatters,
                fieldEnabled: widget.enabled,
                cursorWidth: widget.cursorWidth,
                cursorHeight: widget.cursorHeight,
                cursorRadius: widget.cursorRadius,
                cursorColor: widget.cursorColor,
                color: widget.color,
                keyboardAppearance: widget.keyboardAppearance,
                scrollPadding: widget.scrollPadding,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                buildCounter: widget.buildCounter,
                scrollPhysics: widget.scrollPhysics,
                autofillHints: widget.autofillHints,
                autovalidateMode: widget.autovalidateMode));
        break;
      case GfFormFieldType.email:
        retwidget = Container(
            margin: EdgeInsets.symmetric(
                vertical: widget.marginvertical ?? 2,
                horizontal: widget.marginhorizontal ?? 2),
            padding: EdgeInsets.symmetric(
                vertical: widget.paddingvertical ?? 2,
                horizontal: widget.paddinghorizontal ?? 2),
            child: GFTextField(
                decoration: GfFormFieldDecoration(
                  context: context,
                  shape: GFTextFieldShape.roundedsquare,
                  borderRadius: widget.borderradius ?? 6.0,
                  editingBorderColor: widget.editingbordercolor,
                  idleBorderColor: widget.idlebordercolor,
                  gfprefixIcon: widget.iconPrefix,
                  bgfilled: true,
                  bgcolor: widget.backgroundcolor,
                  hinttext:
                      widget.hintText.isNotEmpty ? widget.hintText : 'Name',
                ),
                controller: widget.controller,
                fieldinitialValue: widget.initialValue,
                focusNode: widget.focusNode,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textInputAction: widget.textInputAction,
                style: widget.style,
                strutStyle: widget.strutStyle,
                textDirection: widget.textDirection,
                textAlign: widget.textAlign,
                textAlignVertical: widget.textAlignVertical,
                autofocus: widget.autofocus,
                readOnly: widget.readOnly,
                toolbarOptions: widget.toolbarOptions,
                showCursor: widget.showCursor,
                obscuringCharacter: widget.obscuringCharacter,
                obscureText: widget.obscureText,
                autocorrect: widget.autocorrect,
                smartDashesType: widget.smartDashesType,
                smartQuotesType: widget.smartQuotesType,
                enableSuggestions: widget.enableSuggestions,
                autovalidate: widget.autovalidate,
                maxLengthEnforced: widget.maxLengthEnforced,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                expands: widget.expands,
                maxLength: widget.maxLength,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                onEditingComplete: widget.onEditingComplete,
                onFieldSubmitted: widget.onFieldSubmitted,
                onfieldSaved: widget.onSaved,
                validatornew:
                    widget.validator ?? GfFormValidators().getemailvalidator(),
                inputFormatters: widget.inputFormatters,
                fieldEnabled: widget.enabled,
                cursorWidth: widget.cursorWidth,
                cursorHeight: widget.cursorHeight,
                cursorRadius: widget.cursorRadius,
                cursorColor: widget.cursorColor,
                color: widget.color,
                keyboardAppearance: widget.keyboardAppearance,
                scrollPadding: widget.scrollPadding,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                buildCounter: widget.buildCounter,
                scrollPhysics: widget.scrollPhysics,
                autofillHints: widget.autofillHints,
                autovalidateMode: widget.autovalidateMode));
        break;
      case GfFormFieldType.phone:
        retwidget = Container(
          margin: EdgeInsets.symmetric(
              vertical: widget.marginvertical ?? 2,
              horizontal: widget.marginhorizontal ?? 2),
          padding: EdgeInsets.symmetric(
              vertical: widget.paddingvertical ?? 2,
              horizontal: widget.paddinghorizontal ?? 2),
          child: GFTextField(
              decoration: GfFormFieldDecoration(
                context: context,
                shape: GFTextFieldShape.roundedsquare,
                borderRadius: widget.borderradius ?? 6.0,
                editingBorderColor: widget.editingbordercolor,
                idleBorderColor: widget.idlebordercolor,
                gfprefixIcon: widget.iconPrefix,
                bgfilled: true,
                bgcolor: widget.backgroundcolor,
                hinttext: widget.hintText.isNotEmpty ? widget.hintText : 'Name',
              ),
              controller: widget.controller,
              fieldinitialValue: widget.initialValue,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.phone,
              textCapitalization: TextCapitalization.none,
              textInputAction: widget.textInputAction,
              style: widget.style,
              strutStyle: widget.strutStyle,
              textDirection: widget.textDirection,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              enableSuggestions: widget.enableSuggestions,
              autovalidate: widget.autovalidate,
              maxLengthEnforced: widget.maxLengthEnforced,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onfieldSaved: widget.onSaved,
              validatornew:
                  widget.validator ?? GfFormValidators().getphonevalidator(),
              inputFormatters: widget.inputFormatters,
              fieldEnabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              color: widget.color,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              buildCounter: widget.buildCounter,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              autovalidateMode: widget.autovalidateMode),
        );
        break;
      case GfFormFieldType.country:
        retwidget = Container(
          margin: EdgeInsets.symmetric(
              vertical: widget.marginvertical ?? 2,
              horizontal: widget.marginhorizontal ?? 2),
          padding: EdgeInsets.symmetric(
              vertical: widget.paddingvertical ?? 2,
              horizontal: widget.paddinghorizontal ?? 2),
          child: DropdownButtonFormField(
              value: value,
              decoration: GfFormFieldDecoration(
                context: context,
                shape: GFTextFieldShape.roundedsquare,
                borderRadius: widget.borderradius ?? 6.0,
                editingBorderColor: widget.editingbordercolor,
                idleBorderColor: widget.idlebordercolor,
                gfprefixIcon: widget.iconPrefix,
                bgfilled: true,
                bgcolor: widget.backgroundcolor,
                hinttext: widget.hintText.isNotEmpty ? widget.hintText : 'Name',
              ),
              validator: (value) => null,
              items: countries
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                  .toList(),
              onChanged: (String? textx) {
                setState(() {
                  value = textx.toString();
                });
              }),
        );
        break;
      case GfFormFieldType.text:
        retwidget = Container(
          margin: EdgeInsets.symmetric(
              vertical: widget.marginvertical ?? 2,
              horizontal: widget.marginhorizontal ?? 2),
          padding: EdgeInsets.symmetric(
              vertical: widget.paddingvertical ?? 2,
              horizontal: widget.paddinghorizontal ?? 2),
          child: GFTextField(
              decoration: GfFormFieldDecoration(
                context: context,
                shape: widget.shape ?? GFTextFieldShape.roundedsquare,
                borderRadius: widget.borderradius ?? 6.0,
                editingBorderColor: widget.editingbordercolor,
                idleBorderColor: widget.idlebordercolor,
                gfprefixIcon: widget.iconPrefix,
                bgfilled: true,
                bgcolor: widget.backgroundcolor,
                hinttext:
                    widget.hintText.isNotEmpty ? widget.hintText : 'Value',
              ),
              controller: widget.controller,
              fieldinitialValue: widget.initialValue,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              textInputAction: widget.textInputAction,
              style: widget.style,
              strutStyle: widget.strutStyle,
              textDirection: widget.textDirection,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              enableSuggestions: widget.enableSuggestions,
              autovalidate: widget.autovalidate,
              maxLengthEnforced: widget.maxLengthEnforced,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onfieldSaved: widget.onSaved,
              validatornew:
                  widget.validator ?? GfFormValidators().gettextvalidator(),
              inputFormatters: widget.inputFormatters,
              fieldEnabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              color: widget.color,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              buildCounter: widget.buildCounter,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              autovalidateMode: widget.autovalidateMode),
        );
        break;
      case GfFormFieldType.number:
        retwidget = Container(
          margin: EdgeInsets.symmetric(
              vertical: widget.marginvertical ?? 2,
              horizontal: widget.marginhorizontal ?? 2),
          padding: EdgeInsets.symmetric(
              vertical: widget.paddingvertical ?? 2,
              horizontal: widget.paddinghorizontal ?? 2),
          child: GFTextField(
              decoration: GfFormFieldDecoration(
                context: context,
                shape: widget.shape ?? GFTextFieldShape.roundedsquare,
                borderRadius: widget.borderradius ?? 6.0,
                editingBorderColor: widget.editingbordercolor,
                idleBorderColor: widget.idlebordercolor,
                gfprefixIcon: widget.iconPrefix,
                bgfilled: true,
                bgcolor: widget.backgroundcolor,
                hinttext: widget.hintText.isNotEmpty ? widget.hintText : 'Name',
              ),
              controller: widget.controller,
              fieldinitialValue: widget.initialValue,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.words,
              textInputAction: widget.textInputAction,
              style: widget.style,
              strutStyle: widget.strutStyle,
              textDirection: widget.textDirection,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              enableSuggestions: widget.enableSuggestions,
              autovalidate: widget.autovalidate,
              maxLengthEnforced: widget.maxLengthEnforced,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onfieldSaved: widget.onSaved,
              validatornew:
                  widget.validator ?? GfFormValidators().getnumbervalidator(),
              inputFormatters: widget.inputFormatters,
              fieldEnabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              color: widget.color,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              buildCounter: widget.buildCounter,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              autovalidateMode: widget.autovalidateMode),
        );
        break;
      case GfFormFieldType.gender:
        retwidget = Container(
            margin: EdgeInsets.symmetric(
                vertical: widget.marginvertical ?? 2,
                horizontal: widget.marginhorizontal ?? 2),
            padding: EdgeInsets.symmetric(
                vertical: widget.paddingvertical ?? 2,
                horizontal: widget.paddinghorizontal ?? 2),
            child: GfFormRadiobutton(
              onChanged: widget.onGenderChanged ??
                  (value) {
                    print('Gender changed $value');
                  },
              initialSelectedValue: widget.initialGender ?? 'Male',
            ));
        break;
      case GfFormFieldType.question:
        retwidget = Container(
            margin: EdgeInsets.symmetric(
                vertical: widget.marginvertical ?? 2,
                horizontal: widget.marginhorizontal ?? 2),
            padding: EdgeInsets.symmetric(
                vertical: widget.paddingvertical ?? 2,
                horizontal: widget.paddinghorizontal ?? 2),
            child: GfFormQuestionWidget(
              onChanged: widget.onQuestionWidgetChanged ??
                  (value) {
                    print('Question changed $value');
                  },
              initialSelectedValue: 'Decline',
              question:
                  widget.question ?? 'Do you accept the Terms and Condition?',
              accepttext: widget.acceptButtonText ?? 'Accept',
              declinetext: widget.declineButtonText ?? 'Decline',
            ));
        break;
    }
    return retwidget;
  }

  @override
  bool get wantKeepAlive => true;
}
