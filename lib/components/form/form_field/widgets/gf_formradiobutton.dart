import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/gf_formhandler_widget.dart';
import 'package:getwidget/components/form/form_field/widgets/providers/gf_radioprovider.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';

class GfFormGenderbutton extends StatefulWidget {
  const GfFormGenderbutton(
      {Key? key, required this.onChanged, required this.initialSelectedValue})
      : super(key: key);
  final Function(String?) onChanged;
  final String initialSelectedValue;
  @override
  State<GfFormGenderbutton> createState() => _GfFormGenderbuttonState();
}

class _GfFormGenderbuttonState extends State<GfFormGenderbutton>
    with AutomaticKeepAliveClientMixin {
  String selectedValue = '';
  late final GfFormHandler gfFormHandler;
  late final GfGenderButtonData dataModel;

  @override
  void initState() {
    selectedValue = widget.initialSelectedValue;
    dataModel = GfGenderButtonData(selectedValue: selectedValue);
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
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    selectedValue = 'Male';
                    widget.onChanged(selectedValue);
                    dataModel.setValue(selectedValue.toString());
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: selectedValue,
                          onChanged: (String? val) {
                            if (val != null && val.isNotEmpty) {
                              selectedValue = val.toString();
                              widget.onChanged(selectedValue);
                              dataModel.setValue(val.toString());
                            }
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
                      selectedValue = 'Female';
                      widget.onChanged(selectedValue);
                      dataModel.setValue(selectedValue.toString());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 'Female',
                            groupValue: selectedValue,
                            onChanged: (String? val) {
                              if (val != null && val.isNotEmpty) {
                                selectedValue = val.toString();
                                widget.onChanged(selectedValue);
                                dataModel.setValue(val.toString());
                              }
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text('Female')
                        ])),
              ],
            ));
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
