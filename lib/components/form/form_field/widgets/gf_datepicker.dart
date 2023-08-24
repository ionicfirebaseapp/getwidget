import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/gf_formhandler_widget.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_datepickerprovider.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';

class GfDatePicker extends StatefulWidget {
  GfDatePicker(
      {Key? key,
      this.errorText,
      this.cancelText,
      this.confirmText,
      this.helpText,
      this.hourLabelText,
      this.minuteLabelText,
      this.defaultDate,
      this.initialDate,
      this.lastDate,
      this.labelText,
      this.borderColor,
      this.headingText,
      this.borderWidth,
      this.buttonText,
      this.buttonIcon,
      this.margin,
      this.padding})
      : super(key: key) {
    if ((initialDate != null || lastDate != null) && defaultDate == null) {
      throw Exception(
          'Provide a default date while intializing with initial date or final date.');
    }
  }

  @override
  State<GfDatePicker> createState() => _GfDatePickerState();

  final String? errorText;
  final String? confirmText;
  final String? cancelText;
  final String? helpText;
  final String? hourLabelText;
  final String? minuteLabelText;
  final DateTime? defaultDate;
  final DateTime? initialDate;
  final DateTime? lastDate;
  final Color? borderColor;
  final String? headingText;
  final String? labelText;
  final double? borderWidth;
  final String? buttonText;
  final Icon? buttonIcon;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
}

class _GfDatePickerState extends State<GfDatePicker> {
  late final GfFormHandler gfFormHandler;
  DateTime selectedDate = DateTime.now();
  late final GfDatePickerData dataModel;

  @override
  void initState() {
    selectedDate = widget.defaultDate ?? DateTime.now();
    dataModel = GfDatePickerData(selectedDate: selectedDate);
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: widget.initialDate ?? DateTime(1950),
      lastDate: widget.lastDate ?? DateTime.now(),
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      errorInvalidText: widget.errorText,
      helpText: widget.helpText,
    );
    if (picked != null && picked != selectedDate) {
      dataModel.setDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final GfFormHandler gfFormHandler =
          GfFormHandlerWidget.of(context).gfFormHandler;
      gfFormHandler.setModel(dataModel);
    } on Exception catch (e) {
      print('Exception at attaching to handler : $e');
    }
    return Container(
      margin: widget.margin ??
          const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: AnimatedBuilder(
          animation: dataModel,
          builder: (context, child) {
            selectedDate = dataModel.getDate();
            return InputDecorator(
              decoration: InputDecoration(
                label: widget.headingText != null
                    ? Text(widget.headingText.toString())
                    : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.black,
                        width: widget.borderWidth ?? 1.5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.black,
                        width: widget.borderWidth ?? 1.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.labelText ?? 'Selected Date',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          selectedDate.toString().substring(0, 10),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    constraints: const BoxConstraints(minWidth: 64),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.grey,
                    ),
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: Row(
                        children: [
                          widget.buttonIcon ??
                              const Icon(
                                Icons.date_range_sharp,
                                color: Colors.black,
                                size: 16,
                              ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.buttonText ?? 'Pick date',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
