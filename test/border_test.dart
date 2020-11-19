import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final childWidget = Container(
    width: 222,
    height: 333,
  );
  final color = Colors.teal;
  const padding = EdgeInsets.all(5);
  const type = GFBorderType.rect;
  const text = Text('Hello');

  testWidgets('GF Border can be created around diffrent components.',
      (tester) async {
    final GFBorder border = GFBorder(
        color: color,
        padding: padding,
        type: type,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [2, 0],
        child: childWidget);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.padding, padding);
    expect(app.border.type, type);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.child, childWidget);
  });

  testWidgets('Solid GF Border around image.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    final GFBorder border = GFBorder(
        color: color,
        type: type,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [2, 0],
        child: bgImage);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, type);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.child, bgImage);
  });

  testWidgets('Solid GF Border with radius.', (tester) async {
    const radius = Radius.circular(20);
    const typerRect = GFBorderType.rRect;

    final GFBorder border = GFBorder(
        color: color,
        type: typerRect,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [2, 0],
        radius: radius,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typerRect);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.child, text);
  });

  testWidgets('Oval GF Border.', (tester) async {
    const typeoval = GFBorderType.oval;
    const stroke = 2.0;

    final GFBorder border = GFBorder(
        color: color,
        type: typeoval,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [6, 0],
        strokeWidth: stroke,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typeoval);
    expect(app.border.dashedLine, [6, 0]);
    expect(app.border.strokeWidth, stroke);
    expect(app.border.child, text);
  });

  testWidgets('Circular GF Border.', (tester) async {
    const typeCircle = GFBorderType.circle;
    const stroke = 2.0;
    final GFBorder border = GFBorder(
        color: color,
        type: typeCircle,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [2, 0],
        strokeWidth: stroke,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typeCircle);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.strokeWidth, stroke);
    expect(app.border.child, text);
  });

  testWidgets('Dashed GF Border.', (tester) async {
    const typerRect = GFBorderType.rRect;

    final GFBorder border = GFBorder(
        color: color,
        type: typerRect,
        // ignore: prefer_const_literals_to_create_immutables
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typerRect);
    expect(app.border.child, text);
  });

  testWidgets('Dashed GF Border with radius.', (tester) async {
    const typerRect = GFBorderType.rRect;
    const radius = Radius.circular(20);

    final GFBorder border = GFBorder(
        color: color,
        type: typerRect,
        radius: radius,
        // ignore: prefer_const_literals_to_create_immutables
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typerRect);
    expect(app.border.radius, radius);
    expect(app.border.child, text);
  });

  testWidgets('Oval dashed GF Border.', (tester) async {
    const typeoval = GFBorderType.oval;
    const stroke = 2.0;

    final GFBorder border = GFBorder(
        color: color,
        type: typeoval,
        strokeWidth: stroke,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [3, 1],
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typeoval);
    expect(app.border.child, text);
  });

  testWidgets('Circular dashed GF Border.', (tester) async {
    const typecircular = GFBorderType.circle;
    const stroke = 2.0;

    final GFBorder border = GFBorder(
        color: color,
        type: typecircular,
        // ignore: prefer_const_literals_to_create_immutables
        dashedLine: [3, 1],
        strokeWidth: stroke,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, typecircular);
    expect(app.border.child, text);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.border);
  final GFBorder border;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.border,
            ],
          ),
        ),
      );
}
