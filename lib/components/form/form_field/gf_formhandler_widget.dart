import 'package:flutter/material.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';

class GfFormHandlerWidget extends InheritedWidget {
  const GfFormHandlerWidget(
      {required this.gfFormHandler, required Widget child})
      : super(child: child);

  final GfFormHandler gfFormHandler;

  static GfFormHandlerWidget of(BuildContext context) {
    final GfFormHandlerWidget? result =
        context.dependOnInheritedWidgetOfExactType<GfFormHandlerWidget>();
    assert(result != null, 'No GfFormHandlerWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
