import 'package:flutter/material.dart';

class ChipData {
  ChipData({required this.text, required this.selected});
  String text;
  bool selected;
}

class GfMultiChipSelectData extends ChangeNotifier {
  GfMultiChipSelectData(
      {required this.values,
      this.lableStyle,
      this.selectedColor,
      this.unselectedColor,
      this.preselected}) {
    if (preselected != null) {
      for (int xb = 0; xb < values.length; xb++) {
        if (preselected!.contains(xb)) {
          chipsdata.add(ChipData(text: values[xb], selected: true));
        } else {
          chipsdata.add(ChipData(text: values[xb], selected: false));
        }
      }
    } else {
      chipsdata =
          values.map((e) => ChipData(text: e, selected: false)).toList();
    }
  }
  final List<String> values;
  List<ChipData> chipsdata = [];
  TextStyle? lableStyle;
  Color? selectedColor;
  Color? unselectedColor;
  List<int>? preselected;

  List<ChipData> getlist() => chipsdata;

  Future<void> onSelected({required int index, required bool value}) async {
    chipsdata[index].selected = value;
    notifyListeners();
  }

  List<String> getlistselected() {
    final List<String> checked = [];
    final List<ChipData> xt =
        chipsdata.where((element) => element.selected).toList();
    for (var element in xt) {
      checked.add(element.text);
    }
    return checked;
  }

  // list.asMap().forEach((index, item)
  List<int> getlistselectedindx() {
    final List<int> checked = [];
    chipsdata.asMap().forEach((index, item) {
      if (item.selected) {
        checked.add(index);
      }
    });
    return checked;
  }
}
