import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/gf_formhandler_widget.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_questionbuttonprovider.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';
import 'package:getwidget/getwidget.dart';

class GfFormQuestionWidget extends StatefulWidget {
  const GfFormQuestionWidget(
      {Key? key,
      required this.onChanged,
      this.initialSelectedValue,
      required this.question,
      this.accepttext,
      this.declinetext})
      : super(key: key);
  final Function(String?) onChanged;
  final String? initialSelectedValue;
  final String question;
  final String? accepttext;
  final String? declinetext;

  @override
  State<GfFormQuestionWidget> createState() => _GfFormQuestionWidgetState();
}

class _GfFormQuestionWidgetState extends State<GfFormQuestionWidget>
    with AutomaticKeepAliveClientMixin {
  String selectedValue = '';
  late final GfFormHandler gfFormHandler;
  late final GfQuestionButtonData dataModel;
  @override
  void initState() {
    selectedValue = widget.initialSelectedValue ?? 'Yes';
    dataModel = GfQuestionButtonData(selectedValue: selectedValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    try {
      final GfFormHandler gfFormHandler =
          GfFormHandlerWidget.of(context).gfFormHandler;
      gfFormHandler.setModel(dataModel);
    } on Exception catch (e) {
      print('Exception at attaching to handler : $e');
    }
    return Container(
        child: AnimatedBuilder(
            animation: dataModel,
            builder: (context, child) {
              selectedValue = dataModel.selectedValue;
              return Card(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(children: [
                  const SizedBox(
                    height: 8,
                  ),
                  GFTypography(
                    text: widget.question,
                    type: GFTypographyType.typo6,
                    showDivider: false,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          selectedValue = widget.accepttext ?? 'Yes';
                          widget.onChanged(selectedValue);
                          dataModel.setValue(selectedValue.toString());
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: widget.accepttext ?? 'Yes',
                                groupValue: selectedValue,
                                onChanged: (String? val) {
                                  setState(() {
                                    selectedValue = widget.accepttext ?? 'Yes';
                                    widget.onChanged(selectedValue);
                                    dataModel
                                        .setValue(selectedValue.toString());
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(widget.accepttext ?? 'Yes')
                            ]),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              selectedValue = widget.declinetext ?? 'No';
                              widget.onChanged(selectedValue);
                              dataModel.setValue(selectedValue.toString());
                            });
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: widget.declinetext ?? 'No',
                                  groupValue: selectedValue,
                                  onChanged: (String? val) {
                                    setState(() {
                                      selectedValue =
                                          widget.declinetext ?? 'No';
                                      widget.onChanged(selectedValue);
                                      dataModel
                                          .setValue(selectedValue.toString());
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(widget.declinetext ?? 'No')
                              ])),
                    ],
                  )
                ]),
              ));
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
