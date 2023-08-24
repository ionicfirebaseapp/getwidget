import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_datepickerprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_formdropdownprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_formfieldprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_multicheckboxselectionprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_multichipselectionprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_questionbuttonprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_radioprovider.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_timepickerprovider.dart';

class GfFormHandler extends ChangeNotifier {
  GfFormHandler({
    required this.formsKey,
  });
  final GlobalKey<FormState> formsKey;
  List<ChangeNotifier> models = [];
  void getModels() => models;

  void setModel(ChangeNotifier modelx) {
    print('Adding Model ::${modelx.runtimeType}');
    models.add(modelx);
    print('Model List ${models.length}');
  }

  Future<bool> validateForm() async {
    if (formsKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getFormValues() async {
    final List<dynamic> values = [];
    if (formsKey.currentState!.validate()) {
      for (ChangeNotifier xt in models) {
        switch (xt.runtimeType) {
          case GfFormFieldData:
            final GfFormFieldData jx = xt as GfFormFieldData;
            values.add(jx.getData());
            break;
          case GfFormDropdownData:
            final GfFormDropdownData jx = xt as GfFormDropdownData;
            values.add(jx.getValue());
            break;
          case GfGenderButtonData:
            final GfGenderButtonData jx = xt as GfGenderButtonData;
            values.add(jx.getValue());
            break;
          case GfQuestionButtonData:
            final GfQuestionButtonData jx = xt as GfQuestionButtonData;
            values.add(jx.getValue());
            break;
          case GfMultiCheckboxData:
            final GfMultiCheckboxData jx = xt as GfMultiCheckboxData;
            values.add(jx.getlistselectedindx());
            break;
          case GfMultiChipSelectData:
            final GfMultiChipSelectData jx = xt as GfMultiChipSelectData;
            values.add(jx.getlistselectedindx());
            break;
          case GfDatePickerData:
            final GfDatePickerData jx = xt as GfDatePickerData;
            values.add(jx.getDate());
            break;
          case GfTimePickerData:
            final GfTimePickerData jx = xt as GfTimePickerData;
            values.add(jx.getTime());
            break;
        }
      }
    }
    return values;
  }
}
