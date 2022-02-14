import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const text = 'click me';
  const textStyle = TextStyle(fontSize: 14, color: Colors.black);
  const size = GFSize.SMALL;
  const childWidget = Text('tap me');

  testWidgets('Disabled GF Button can be constructed', (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: null,
      text: text,
      size: size,
      disabledColor: Colors.teal.shade300,
      disabledElevation: 3,
      disabledTextColor: GFColors.LIGHT,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.onPressed, null);
    expect(app.button.disabledColor, Colors.teal.shade300);
    expect(app.button.disabledElevation, 3);
    expect(app.button.disabledTextColor, GFColors.LIGHT);

    await tester.tap(find.byKey(buttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GF Button can be constructed', (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      color: GFColors.ALT,
      textStyle: textStyle,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.textStyle, textStyle);
    expect(app.button.size, size);
    expect(app.button.color, GFColors.ALT);

    await tester.tap(find.byKey(buttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GF Button can be constructed with child for custom text',
      (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      child: childWidget,
      color: Colors.amber,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(app.button.child, childWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.color, Colors.amber);

    await tester.tap(find.byKey(buttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets(
      'GF Button can be constructed with standard type and shape i.e default',
      (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      textColor: GFColors.DARK,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.textColor, GFColors.DARK);
    expect(app.button.size, size);

    await tester.tap(find.byKey(buttonKey));
    await tester.pump();
    await tester.press(find.byKey(buttonKey));
    await tester.pump();
    await tester.longPress(find.byKey(buttonKey));
    await tester.pump();

    // await expectLater(() => tester.tap(find.byKey(buttonKey)), prints('onHighlight changed'));

    await tester.pumpWidget(app);
  });

  testWidgets(
      'GF Button with icon and icon position'
      'and with Block Button', (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      child: childWidget,
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      position: GFPosition.start,
      blockButton: true,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.position, GFPosition.start);
    expect(app.button.blockButton, isTrue);
  });

  testWidgets(
      'GF Button with solid type and pills shape '
      'and Full Width Button', (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      child: childWidget,
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      position: GFPosition.start,
      type: GFButtonType.solid,
      shape: GFButtonShape.pills,
      fullWidthButton: true,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.position, GFPosition.start);
    expect(app.button.type, GFButtonType.solid);
    expect(app.button.shape, GFButtonShape.pills);
    expect(app.button.fullWidthButton, isTrue);
  });

  testWidgets('GF Button with type outline and square shape ', (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      child: childWidget,
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      position: GFPosition.start,
      type: GFButtonType.outline,
      shape: GFButtonShape.square,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.position, GFPosition.start);
    expect(app.button.type, GFButtonType.outline);
    expect(app.button.shape, GFButtonShape.square);
  });

  testWidgets('GF Button with custom border and shape ', (tester) async {
    const buttonKey = Key('header');

    const border = BorderSide(
        color: Colors.tealAccent, width: 1, style: BorderStyle.solid);
    const shape = RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.zero);

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      borderShape: shape,
      borderSide: border,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.borderShape, shape);
    expect(app.button.borderSide, border);
  });

  testWidgets('GF Button with boxshadow ', (tester) async {
    const buttonKey = Key('header');

    const boxshadow = BoxShadow(
      color: Colors.pink,
      blurRadius: 2,
      spreadRadius: 1,
      offset: Offset.zero,
    );

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      buttonBoxShadow: true,
      boxShadow: boxshadow,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.buttonBoxShadow, isTrue);
    expect(app.button.boxShadow, boxshadow);
  });

  testWidgets(
      'GF Button with hover, focus, highlight and splash color. Works only in web',
      (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      hoverColor: Colors.tealAccent,
      focusColor: Colors.teal,
      highlightColor: Colors.amber,
      splashColor: Colors.red,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.hoverColor, Colors.tealAccent);
    expect(app.button.focusColor, Colors.teal);
    expect(app.button.highlightColor, Colors.amber);
    expect(app.button.splashColor, Colors.red);
  });

  testWidgets(
      'GF Button with hover, focus, highlight and splash color. Works only in web',
      (tester) async {
    const buttonKey = Key('header');

    final GFSocialButton button = GFSocialButton(
      key: buttonKey,
      onPressed: () {},
      text: text,
      size: size,
      elevation: 3,
      focusElevation: 2,
      hoverElevation: 2,
      highlightElevation: 4,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);

    expect(app.button.text, text);
    expect(app.button.size, size);
    expect(app.button.elevation, 3);
    expect(app.button.focusElevation, 2);
    expect(app.button.hoverElevation, 2);
    expect(app.button.highlightElevation, 4);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.button);

  final GFSocialButton button;

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
