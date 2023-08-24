import 'package:flutter/material.dart';

class GfGenderButtonData extends ChangeNotifier {
  GfGenderButtonData({required this.selectedValue});

  String selectedValue;

  String getValue() => selectedValue;
  void setValue(String valuenew) {
    selectedValue = valuenew;
    notifyListeners();
  }
}
