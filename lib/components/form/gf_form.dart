import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GfForm extends StatefulWidget {
  const GfForm(
      {Key? key,
      this.height,
      this.width,
      this.radius,
      this.formHeading,
      this.formkey,
      this.validatesuccess,
      this.validatefailed,
      this.formAlignment = CrossAxisAlignment.center,
      required this.formfields,
      this.customSubmitButton,
      required this.defaultSubmitButtonEnabled,
      this.defaultSubmitButtontext = 'SUBMIT',
      this.formBorderColor = Colors.black,
      this.headingtype = GFTypographyType.typo5})
      : super(key: key);

  final double? height;
  final double? width;
  final double? radius;
  final String? formHeading;
  final GlobalKey<FormState>? formkey;
  final Function? validatesuccess;
  final Function? validatefailed;
  final List<Widget> formfields;
  final Widget? customSubmitButton;
  final bool defaultSubmitButtonEnabled;
  final String defaultSubmitButtontext;
  final CrossAxisAlignment formAlignment;
  final Color formBorderColor;
  final GFTypographyType headingtype;

  @override
  State<GfForm> createState() => _GfFormState();
}

class _GfFormState extends State<GfForm> with AutomaticKeepAliveClientMixin {
  late final GlobalKey<FormState> formskey;
  @override
  void initState() {
    formskey = widget.formkey ?? GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        // height: widget.height??MediaQuery.of(context).size.height,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: widget.formBorderColor, width: 2.5),
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
        ),
        child: Column(
          crossAxisAlignment: widget.formAlignment,
          children: [
            widget.formHeading != null
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: GFTypography(
                      text: widget.formHeading.toString(),
                      type: widget.headingtype,
                    ))
                : Container(),
            widget.formHeading != null
                ? const SizedBox(
                    height: 8,
                  )
                : Container(),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formskey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...widget.formfields,
                    ],
                  ),
                ),
              ),
            ),
            (!widget.defaultSubmitButtonEnabled &&
                    widget.customSubmitButton != null)
                ? (widget.customSubmitButton ?? Container())
                : Container(),
            (widget.defaultSubmitButtonEnabled)
                ? GFButton(
                    text: widget.defaultSubmitButtontext,
                    onPressed: () {
                      if (formskey.currentState!.validate()) {
                        if (widget.validatesuccess != null) {
                          widget.validatesuccess!();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Validation Success')),
                          );
                        }
                      } else {
                        if (widget.validatefailed != null) {
                          widget.validatefailed!();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Validation Failed')),
                          );
                        }
                      }
                    })
                : Container(),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
