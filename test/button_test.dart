import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const text = 'click me';
  const size = GFSize.SMALL;
  const childWidget = Text('tap me');

  testWidgets('GF Button without padding, shape', (tester) async {
    // `GFBUtton.shape` null.
    expect(
      () => GFButton(
        onPressed: null,
        shape: null,
        padding: null,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('GF Button can be constructed', (tester) async {
    const butttonKey = Key('header');

    const GFButton button = GFButton(
      key: butttonKey,
      onPressed: null,
      text: text,
      size: size,
      child: childWidget,
    );

    const TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);

    await tester.tap(find.byKey(butttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GF Button can be constructed', (tester) async {
    const butttonKey = Key('header');

    const GFButton button = GFButton(
      key: butttonKey,
      onPressed: null,
      text: text,
      size: size,
      child: childWidget,
    );

    const TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.child, childWidget);
    expect(app.button.text, text);
    expect(app.button.size, size);

    await tester.tap(find.byKey(butttonKey));
    await tester.press(find.byKey(butttonKey));
    await tester.longPress(find.byKey(butttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  // testWidgets('GF Button with custom shape',
  //         (WidgetTester tester) async {
  //
  //           const GFButton button = GFButton(
  //             onPressed: null,
  //             text: text,
  //             size: size,
  //             child: childWidget,
  //           );
  //
  //           const TestApp app = TestApp(button);
  //
  //           await tester.pumpWidget(app);
  //
  //       final roundedRectangleBorder = tester
  //           .widget<GFButton>(find.byType(Card))
  //           .borderShape as RoundedRectangleBorder;
  //       expect(roundedRectangleBorder.borderRadius, BorderRadius.circular(15));
  //     });
}

class TestApp extends StatefulWidget {
  const TestApp(this.button);

  final GFButton button;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.button,
            ],
          ),
        ),
      );
}
