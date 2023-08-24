import 'package:flutter/material.dart';

class GfDatePickerData extends ChangeNotifier {
  GfDatePickerData({required this.selectedDate});
  DateTime selectedDate;

  void setDate(DateTime x) {
    selectedDate = x;
    notifyListeners();
  }

  DateTime getDate() => selectedDate;
}
