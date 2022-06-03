import 'package:flutter/material.dart';

class GfFormRadiobutton extends StatefulWidget {
  const GfFormRadiobutton(
      {Key? key, required this.onChanged, required this.initialSelectedValue})
      : super(key: key);
  final Function(String?) onChanged;
  final String initialSelectedValue;
  @override
  State<GfFormRadiobutton> createState() => _GfFormRadiobuttonState();
}

class _GfFormRadiobuttonState extends State<GfFormRadiobutton>
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
            child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              selectedValue = 'Male';
              widget.onChanged(selectedValue);
            });
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Radio(
              value: 'Male',
              groupValue: selectedValue,
              onChanged: (String? val) {
                setState(() {
                  selectedValue = val.toString();
                  widget.onChanged(selectedValue);
                });
              },
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('Male')
          ]),
        ),
        InkWell(
            onTap: () {
              setState(() {
                selectedValue = 'Female';
                widget.onChanged(selectedValue);
              });
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Radio(
                value: 'Female',
                groupValue: selectedValue,
                onChanged: (String? val) {
                  setState(() {
                    selectedValue = val.toString();
                    widget.onChanged(selectedValue);
                  });
                },
              ),
              const SizedBox(
                width: 8,
              ),
              const Text('Female')
            ])),
      ],
    )));
  }

  @override
  bool get wantKeepAlive => true;
}
