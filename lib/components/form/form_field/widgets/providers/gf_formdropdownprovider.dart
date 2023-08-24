import 'package:flutter/material.dart';

class GfFormDropdownData extends ChangeNotifier {
  GfFormDropdownData({required this.selectedValue});

  String selectedValue;

  String getValue() => selectedValue;

  void setValue(String valuenew) {
    selectedValue = valuenew;
    notifyListeners();
  }
}
