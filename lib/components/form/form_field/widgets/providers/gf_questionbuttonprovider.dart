import 'package:flutter/material.dart';

class GfQuestionButtonData extends ChangeNotifier {
  GfQuestionButtonData({required this.selectedValue});

  String selectedValue;

  String getValue() => selectedValue;

  void setValue(String valuenew) {
    selectedValue = valuenew;
    notifyListeners();
  }
}
