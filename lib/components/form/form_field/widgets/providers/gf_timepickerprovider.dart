import 'package:flutter/material.dart';

class GfTimePickerData extends ChangeNotifier {
  GfTimePickerData({required this.selectedTime});
  TimeOfDay selectedTime;

  void setTime(TimeOfDay x) {
    selectedTime = x;
    notifyListeners();
  }

  TimeOfDay getTime() => selectedTime;
}
