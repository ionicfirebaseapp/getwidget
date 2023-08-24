import 'package:flutter/material.dart';

class CheckboxData {
  CheckboxData({required this.text, required this.selected});
  String text;
  bool selected;
}

class GfMultiCheckboxData extends ChangeNotifier {
  GfMultiCheckboxData(
      {required this.values,
      this.lableStyle,
      this.selectedColor,
      this.unselectedColor,
      this.preselected}) {
    if (preselected != null) {
      for (int xb = 0; xb < values.length; xb++) {
        if (preselected!.contains(xb)) {
          checkboxdata.add(CheckboxData(text: values[xb], selected: true));
        } else {
          checkboxdata.add(CheckboxData(text: values[xb], selected: false));
        }
      }
    } else {
      checkboxdata =
          values.map((e) => CheckboxData(text: e, selected: false)).toList();
    }
  }
  final List<String> values;
  List<CheckboxData> checkboxdata = [];
  TextStyle? lableStyle;
  Color? selectedColor;
  Color? unselectedColor;
  List<int>? preselected;

  List<CheckboxData> getlist() => checkboxdata;
  List<String> getlistselected() {
    final List<String> checked = [];
    final List<CheckboxData> xt =
        checkboxdata.where((element) => element.selected).toList();
    for (var element in xt) {
      checked.add(element.text);
    }
    return checked;
  }

  // list.asMap().forEach((index, item)
  List<int> getlistselectedindx() {
    final List<int> checked = [];
    checkboxdata.asMap().forEach((index, item) {
      if (item.selected) {
        checked.add(index);
      }
    });
    return checked;
  }

  Future<void> onSelected({required int index, required bool value}) async {
    checkboxdata[index].selected = value;
    notifyListeners();
  }
}
