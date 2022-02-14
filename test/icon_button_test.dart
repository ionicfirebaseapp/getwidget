import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const size = GFSize.SMALL;

  testWidgets('Disabled GF IconButton can be constructed', (tester) async {
    const buttonKey = Key('header');

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: null,
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      size: size,
      disabledColor: Colors.teal.shade300,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);
    expect(app.button.size, size);
    expect(app.button.onPressed, null);
    expect(app.button.disabledColor, Colors.teal.shade300);

    await tester.tap(find.byKey(buttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GF IconButton can be constructed', (tester) async {
    const buttonKey = Key('header');

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      size: size,
      color: GFColors.ALT,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);
    expect(app.button.size, size);
    expect(app.button.color, GFColors.ALT);

    await tester.tap(find.byKey(buttonKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets(
      'GF IconButton can be constructed with standard type and shape i.e default',
      (tester) async {
    const buttonKey = Key('header');

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      size: size,
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);
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

  testWidgets('GF IconButton with solid type and pills shape ', (tester) async {
    const buttonKey = Key('header');

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      iconSize: 24,
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      type: GFButtonType.solid,
      shape: GFIconButtonShape.pills,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);

    expect(app.button.iconSize, 24);
    expect(app.button.type, GFButtonType.solid);
    expect(app.button.shape, GFIconButtonShape.pills);
  });

  testWidgets('GF IconButton with type outline and round shape ',
      (tester) async {
    const buttonKey = Key('header');

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      size: size,
      type: GFButtonType.outline,
      shape: GFIconButtonShape.circle,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);

    expect(app.button.size, size);
    expect(app.button.type, GFButtonType.outline);
    expect(app.button.shape, GFIconButtonShape.circle);
  });

  testWidgets('GF IconButton with custom border and shape ', (tester) async {
    const buttonKey = Key('header');

    const border = BorderSide(
        color: Colors.tealAccent, width: 1, style: BorderStyle.solid);
    const shape = RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.zero);

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      size: size,
      borderShape: shape,
      borderSide: border,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);
    expect(app.button.size, size);
    expect(app.button.borderShape, shape);
    expect(app.button.borderSide, border);
  });

  testWidgets('GF IconButton with boxshadow ', (tester) async {
    const buttonKey = Key('header');

    const boxshadow = BoxShadow(
      color: Colors.pink,
      blurRadius: 2,
      spreadRadius: 1,
      offset: Offset.zero,
    );

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      size: size,
      buttonBoxShadow: true,
      boxShadow: boxshadow,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(find.byIcon(Icons.directions_bike_sharp), findsOneWidget);
    expect(app.button.size, size);
    expect(app.button.buttonBoxShadow, isTrue);
    expect(app.button.boxShadow, boxshadow);
  });

  testWidgets(
      'GF IconButton with hover, focus, highlight and splash color. Works only in web',
      (tester) async {
    const buttonKey = Key('header');

    final GFIconButton button = GFIconButton(
      key: buttonKey,
      onPressed: () {},
      icon: const Icon(
        Icons.directions_bike_sharp,
      ),
      size: size,
      hoverColor: Colors.tealAccent,
      focusColor: Colors.teal,
      highlightColor: Colors.amber,
      splashColor: Colors.red,
    );

    final TestApp app = TestApp(button);

    await tester.pumpWidget(app);

    expect(app.button.size, size);
    expect(app.button.hoverColor, Colors.tealAccent);
    expect(app.button.focusColor, Colors.teal);
    expect(app.button.highlightColor, Colors.amber);
    expect(app.button.splashColor, Colors.red);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.button);

  final GFIconButton button;

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
