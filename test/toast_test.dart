import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final UniqueKey toastKey = UniqueKey();

  // testWidgets('Toast control test', (WidgetTester tester) async {
  //   const String text = 'This item already has the label “travel”';
  //   await tester.pumpWidget(MaterialApp(
  //     home: Scaffold(
  //       body: Builder(builder: (BuildContext context) {
  //         return GFToast(
  //           key: toastKey,
  //           text: text,
  //           textStyle: const TextStyle(color: Colors.black87),
  //           autoDismiss: false,
  //         );it
  //       }),
  //     ),
  //   ));
  // });

  // testWidgets('GFToast is autodismiss ',
  //     (tester) async {
  //   final GFToast toast = GFToast(
  //     key: toastKey,
  //     text: 'This item already has the label “travel”',
  //     textStyle: const TextStyle(color: Colors.black87),
  //     autoDismiss: false,
  //   );

  //   final TestApp app = TestApp(toast);
  //   await tester.pumpWidget(app);
  //   await tester.pump();
  // });
  testWidgets('GFToast can be constructed ', (tester) async {
    GFToast(
      backgroundColor: Colors.white,
      text: 'This item already has the label “travel”',
      textStyle: const TextStyle(color: Colors.black87),
      button: GFButton(
        onPressed: () {},
        text: 'OK',
        type: GFButtonType.transparent,
        color: GFColors.SUCCESS,
      ),
      autoDismiss: false,
    );
  });

  testWidgets('GFToast can be constructed with button', (tester) async {
    const String text = 'This item already has the label “travel”';
    bool showFloatingToast = false;
    final toast = StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => MaterialApp(
              home: Scaffold(
                  body: GFFloatingWidget(
                      key: toastKey,
                      showBlurness: showFloatingToast,
                      blurnessColor: Colors.black54,
                      child: showFloatingToast
                          ? GFToast(
                              key: toastKey,
                              backgroundColor: Colors.white,
                              text: text,
                              textStyle: const TextStyle(color: Colors.black87),
                              button: GFButton(
                                onPressed: () {
                                  setState(() {
                                    showFloatingToast = false;
                                  });
                                },
                                text: 'OK',
                                type: GFButtonType.transparent,
                                color: GFColors.SUCCESS,
                              ),
                              autoDismiss: false,
                            )
                          : Container(),
                      body: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 40, right: 40),
                            child: GFButton(
                              onPressed: () {
                                setState(() {
                                  showFloatingToast = !showFloatingToast;
                                });
                              },
                              text: 'View Floating Toast',
                            ),
                          ),
                        ],
                      ))),
            ));

    await tester.pumpWidget(toast);
    expect(find.byKey(toastKey), findsOneWidget);
    expect(showFloatingToast, isFalse);
    await tester.tap(find.byType(GFButton));
    print(showFloatingToast);
    expect(showFloatingToast, isTrue);
  });

  testWidgets('GFToast can be constructed Find the Text', (tester) async {
    const String text = 'This item already has the label “travel”';
    bool showFloatingToast = false;
    final toast = StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => MaterialApp(
              home: Scaffold(
                  body: GFFloatingWidget(
                showBlurness: showFloatingToast,
                blurnessColor: Colors.black54,
                child: showFloatingToast
                    ? GFToast(
                        key: toastKey,
                        backgroundColor: Colors.white,
                        text: text,
                        textStyle: const TextStyle(color: Colors.black87),
                        button: GFButton(
                          onPressed: () {
                            setState(() {
                              showFloatingToast = false;
                            });
                          },
                          text: 'OK',
                          type: GFButtonType.transparent,
                          color: GFColors.SUCCESS,
                        ),
                        autoDismiss: false,
                      )
                    : Container(),
              )),
            ));
    await tester.pumpWidget(toast);
    print(find.text(text));
    expect(find.text(text), findsNothing);
    await tester.pump();
    print(find.text(text));
    expect(find.text(text), findsNothing);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.toast);

  final GFToast toast;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.toast,
            ],
          ),
        ),
      );
}
