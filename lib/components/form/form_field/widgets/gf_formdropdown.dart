import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/decorations/gf_formfield_decoration.dart';
import 'package:getwidget/components/form/form_field/gf_formhandler_widget.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_formdropdownprovider.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';
import 'package:getwidget/shape/gf_textfield_shape.dart';

class GfFormDropDown extends StatefulWidget {
  const GfFormDropDown(
      {Key? key,
      required this.values,
      this.initialValue,
      this.padding,
      this.margin,
      this.borderradius,
      this.editingbordercolor,
      this.idlebordercolor,
      this.iconPrefix,
      this.backgroundcolor,
      this.hintText})
      : super(key: key);
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final List<String> values;
  final String? initialValue;
  final double? borderradius;
  final Color? editingbordercolor;
  final Color? idlebordercolor;
  final Icon? iconPrefix;
  final Color? backgroundcolor;
  final String? hintText;

  @override
  State<GfFormDropDown> createState() => _GfFormDropDownState();
}

class _GfFormDropDownState extends State<GfFormDropDown> {
  String selectedValue = '';
  late final GfFormHandler gfFormHandler;
  late final GfFormDropdownData dataModel;

  @override
  void initState() {
    selectedValue = widget.initialValue ?? widget.values[0];
    dataModel = GfFormDropdownData(selectedValue: selectedValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      final GfFormHandler gfFormHandler =
          GfFormHandlerWidget.of(context).gfFormHandler;
      gfFormHandler.setModel(dataModel);
    } on Exception catch (e) {
      print('Exception at attaching to handler : $e');
    }
    return AnimatedBuilder(
        animation: dataModel,
        builder: (context, child) {
          selectedValue = dataModel.selectedValue;
          return Container(
            margin: widget.margin ??
                const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            padding: widget.padding ??
                const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: DropdownButtonFormField<String>(
                value: selectedValue,
                decoration: GfFormFieldDecoration(
                  context: context,
                  shape: GFTextFieldShape.roundedsquare,
                  borderRadius: widget.borderradius ?? 6.0,
                  editingBorderColor: widget.editingbordercolor,
                  idleBorderColor: widget.idlebordercolor,
                  gfprefixIcon: widget.iconPrefix,
                  bgfilled: true,
                  bgcolor: widget.backgroundcolor,
                  hinttext: widget.hintText != null ? widget.hintText : 'Name',
                ),
                validator: (value) => null,
                items: widget.values
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                onChanged: (String? textx) {
                  selectedValue = textx.toString();
                  dataModel.setValue(selectedValue);
                }),
          );
        });
  }
}
