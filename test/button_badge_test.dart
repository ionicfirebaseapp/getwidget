import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const badge = GFBadge(
    child: Text('12'),
  );
  const text = 'click me';
  const textStyle = TextStyle(fontSize: 14, color: Colors.black);
  const size = GFSize.SMALL;

  testWidgets('Disabled GF ButtonBadge can be constructed', (tester) async {
    const buttonBadgeKey = Key('header');

    const GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: null,
      text: text,
      size: size,
      icon: badge,
      disabledColor: Colors.teal,
      disabledElevation: 3,
      disabledTextColor: GFColors.LIGHT,
    );

    const TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.onPressed, null);
    expect(app.buttonBadge.disabledColor, Colors.teal);
    expect(app.buttonBadge.disabledElevation, 3);
    expect(app.buttonBadge.disabledTextColor, GFColors.LIGHT);

    await tester.tap(find.byKey(buttonBadgeKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GF ButtonBadge can be constructed', (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      icon: badge,
      size: size,
      color: GFColors.ALT,
      textStyle: textStyle,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.textStyle, textStyle);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.color, GFColors.ALT);

    await tester.tap(find.byKey(buttonBadgeKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets(
      'GF ButtonBadge can be constructed with standard type and shape i.e default',
      (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      icon: badge,
      size: size,
      textColor: GFColors.DARK,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.textColor, GFColors.DARK);
    expect(app.buttonBadge.size, size);

    await tester.tap(find.byKey(buttonBadgeKey));
    await tester.pump();
    await tester.press(find.byKey(buttonBadgeKey));
    await tester.pump();
    await tester.longPress(find.byKey(buttonBadgeKey));
    await tester.pump();

    // await expectLater(() => tester.tap(find.byKey(buttonBadgeKey)), prints('onHighlight changed'));

    await tester.pumpWidget(app);
  });

  testWidgets('GF ButtonBadge with Block Button and badge position',
      (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      size: size,
      icon: badge,
      position: GFPosition.start,
      blockButton: true,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.position, GFPosition.start);
    expect(app.buttonBadge.blockButton, isTrue);
  });

  testWidgets(
      'GF ButtonBadge with solid type and pills shape '
      'and Full Width Button', (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      size: size,
      icon: badge,
      position: GFPosition.start,
      type: GFButtonType.solid,
      shape: GFButtonShape.pills,
      fullWidthButton: true,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.position, GFPosition.start);
    expect(app.buttonBadge.type, GFButtonType.solid);
    expect(app.buttonBadge.shape, GFButtonShape.pills);
    expect(app.buttonBadge.fullWidthButton, isTrue);
  });

  testWidgets('GF ButtonBadge with type outline and square shape ',
      (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      size: size,
      icon: badge,
      position: GFPosition.start,
      type: GFButtonType.outline,
      shape: GFButtonShape.square,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.position, GFPosition.start);
    expect(app.buttonBadge.type, GFButtonType.outline);
    expect(app.buttonBadge.shape, GFButtonShape.square);
  });

  testWidgets('GF ButtonBadge with custom border and shape ', (tester) async {
    const buttonBadgeKey = Key('header');

    const border = BorderSide(
        color: Colors.tealAccent, width: 1, style: BorderStyle.solid);
    const shape = RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.zero);

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      icon: badge,
      size: size,
      borderShape: shape,
      borderSide: border,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.borderShape, shape);
    expect(app.buttonBadge.borderSide, border);
  });

  testWidgets('GF ButtonBadge with boxshadow ', (tester) async {
    const buttonBadgeKey = Key('header');

    const boxshadow = BoxShadow(
      color: Colors.pink,
      blurRadius: 2,
      spreadRadius: 1,
      offset: Offset.zero,
    );

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      icon: badge,
      size: size,
      badgeBoxShadow: true,
      boxShadow: boxshadow,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.badgeBoxShadow, isTrue);
    expect(app.buttonBadge.boxShadow, boxshadow);
  });

  testWidgets(
      'GF ButtonBadge with hover, focus, highlight and splash color. Works only in web',
      (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      icon: badge,
      size: size,
      hoverColor: Colors.tealAccent,
      focusColor: Colors.teal,
      highlightColor: Colors.amber,
      splashColor: Colors.red,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.hoverColor, Colors.tealAccent);
    expect(app.buttonBadge.focusColor, Colors.teal);
    expect(app.buttonBadge.highlightColor, Colors.amber);
    expect(app.buttonBadge.splashColor, Colors.red);
  });

  testWidgets(
      'GF ButtonBadge with hover, focus, highlight and splash color. Works only in web',
      (tester) async {
    const buttonBadgeKey = Key('header');

    final GFButtonBadge buttonBadge = GFButtonBadge(
      key: buttonBadgeKey,
      onPressed: () {},
      text: text,
      icon: badge,
      size: size,
      elevation: 3,
      focusElevation: 2,
      hoverElevation: 2,
      highlightElevation: 4,
    );

    final TestApp app = TestApp(buttonBadge);

    await tester.pumpWidget(app);

    expect(find.text('click me'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    expect(app.buttonBadge.icon, badge);
    expect(app.buttonBadge.text, text);
    expect(app.buttonBadge.size, size);
    expect(app.buttonBadge.elevation, 3);
    expect(app.buttonBadge.focusElevation, 2);
    expect(app.buttonBadge.hoverElevation, 2);
    expect(app.buttonBadge.highlightElevation, 4);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.buttonBadge);

  final GFButtonBadge buttonBadge;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.buttonBadge,
            ],
          ),
        ),
      );
}
