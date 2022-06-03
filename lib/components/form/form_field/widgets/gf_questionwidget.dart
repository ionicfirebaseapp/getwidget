import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GfFormQuestionWidget extends StatefulWidget {
  const GfFormQuestionWidget(
      {Key? key,
      required this.onChanged,
      required this.initialSelectedValue,
      required this.question,
      this.accepttext,
      this.declinetext})
      : super(key: key);
  final Function(String?) onChanged;
  final String initialSelectedValue;
  final String question;
  final String? accepttext;
  final String? declinetext;

  @override
  State<GfFormQuestionWidget> createState() => _GfFormQuestionWidgetState();
}

class _GfFormQuestionWidgetState extends State<GfFormQuestionWidget>
    with AutomaticKeepAliveClientMixin {
  String selectedValue = '';
  @override
  void initState() {
    selectedValue = widget.initialSelectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        child: Card(
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
                setState(() {
                  selectedValue = widget.accepttext ?? 'Yes';
                  widget.onChanged(selectedValue);
                });
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Radio(
                  value: widget.accepttext ?? 'Yes',
                  groupValue: selectedValue,
                  onChanged: (String? val) {
                    setState(() {
                      selectedValue = widget.accepttext ?? 'Yes';
                      widget.onChanged(selectedValue);
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
                  });
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Radio(
                    value: widget.declinetext ?? 'No',
                    groupValue: selectedValue,
                    onChanged: (String? val) {
                      setState(() {
                        selectedValue = widget.declinetext ?? 'No';
                        widget.onChanged(selectedValue);
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
    )));
  }

  @override
  bool get wantKeepAlive => true;
}
