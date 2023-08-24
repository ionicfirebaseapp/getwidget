import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/gf_formhandler_widget.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_timepickerprovider.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';

class GfTimePicker extends StatefulWidget {
  const GfTimePicker(
      {Key? key,
      this.errorText,
      this.cancelText,
      this.confirmText,
      this.helpText,
      this.hourLabelText,
      this.minuteLabelText,
      this.defaultTime,
      this.labelText,
      this.borderColor,
      this.headingText,
      this.borderWidth,
      this.buttonText,
      this.buttonIcon,
      this.margin,
      this.padding})
      : super(key: key);
  @override
  State<GfTimePicker> createState() => _GfTimePickerState();

  final String? errorText;
  final String? confirmText;
  final String? cancelText;
  final String? helpText;
  final String? hourLabelText;
  final String? minuteLabelText;
  final TimeOfDay? defaultTime;
  final Color? borderColor;
  final String? headingText;
  final String? labelText;
  final double? borderWidth;
  final String? buttonText;
  final Icon? buttonIcon;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
}

class _GfTimePickerState extends State<GfTimePicker> {
  late final GfFormHandler gfFormHandler;
  TimeOfDay selectedTime = TimeOfDay.now();
  late final GfTimePickerData dataModel;

  @override
  void initState() {
    selectedTime = widget.defaultTime ?? TimeOfDay.now();
    dataModel = GfTimePickerData(selectedTime: selectedTime);

    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      helpText: widget.helpText,
      errorInvalidText: widget.errorText,
      cancelText: widget.cancelText,
      confirmText: widget.confirmText,
      hourLabelText: widget.hourLabelText,
      minuteLabelText: widget.minuteLabelText,
    );
    if (picked != null && picked != selectedTime) {
      dataModel.setTime(picked);
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
            selectedTime = dataModel.getTime();
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
                          widget.labelText ?? 'Selected Time',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          selectedTime.format(context).toString(),
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
                                Icons.punch_clock_outlined,
                                color: Colors.black,
                                size: 16,
                              ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.buttonText ?? 'Pick Time',
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
