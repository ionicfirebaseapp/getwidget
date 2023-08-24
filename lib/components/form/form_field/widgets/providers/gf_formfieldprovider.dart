import 'package:flutter/material.dart';

class GfFormFieldData extends ChangeNotifier {
  GfFormFieldData({required this.gfFormFieldController});
  TextEditingController gfFormFieldController;

  void setText(String x) {
    gfFormFieldController.text = x;
    notifyListeners();
  }

  String getData() => gfFormFieldController.value.text;
}
