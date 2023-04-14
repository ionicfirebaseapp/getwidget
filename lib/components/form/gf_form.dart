import 'package:flutter/material.dart';
import 'package:getwidget/components/form/form_field/gf_formhandler_widget.dart';
import 'package:getwidget/components/form/gf_form_provider.dart';
import 'package:getwidget/getwidget.dart';

class GfForm extends StatefulWidget {
  const GfForm(
      {Key? key,
      required this.onFormSubmitted,
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
  final Function(List<dynamic>) onFormSubmitted;
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
  late final GfFormHandler gfFormHandler;
  @override
  void initState() {
    formskey = widget.formkey ?? GlobalKey<FormState>();
    gfFormHandler = GfFormHandler(formsKey: formskey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GfFormHandlerWidget(
        gfFormHandler: gfFormHandler,
        child: Container(
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: widget.height ?? MediaQuery.of(context).size.height,
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
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
                AnimatedBuilder(
                  animation: gfFormHandler,
                  builder: (context, child) => Expanded(
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
                ),
                (!widget.defaultSubmitButtonEnabled &&
                        widget.customSubmitButton != null)
                    ? (widget.customSubmitButton ?? Container())
                    : Container(),
                (widget.defaultSubmitButtonEnabled)
                    ? GFButton(
                        text: widget.defaultSubmitButtontext,
                        onPressed: () async {
                          if (formskey.currentState!.validate()) {
                            if (widget.validatesuccess != null) {
                              final List<dynamic> formValues =
                                  await gfFormHandler.getFormValues();
                              widget.onFormSubmitted(formValues);
                              widget.validatesuccess!();
                            } else {
                              final List<dynamic> formValues =
                                  await gfFormHandler.getFormValues();
                              widget.onFormSubmitted(formValues);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Validation Success')),
                              );
                            }
                          } else {
                            if (widget.validatefailed != null) {
                              widget.validatefailed!();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Validation Failed')),
                              );
                            }
                          }
                        })
                    : Container(),
              ],
            )));
  }

  @override
  bool get wantKeepAlive => true;
}
