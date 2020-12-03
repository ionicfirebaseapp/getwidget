import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final childWidget = Container(
    width: 222,
    height: 333,
  );
  const color = Colors.teal;
  const padding = EdgeInsets.all(5);
  const type = GFBorderType.rect;
  const text = Text('Hello');

  testWidgets('GFBorder can be created around different components.',
      (tester) async {
    final GFBorder border = GFBorder(
        color: color,
        padding: padding,
        type: type,
        dashedLine: const [2, 0],
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

  testWidgets('Solid GFBorder around image.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    final GFBorder border = GFBorder(
        color: color, type: type, dashedLine: const [2, 0], child: bgImage);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, type);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.child, bgImage);
  });

  testWidgets('Solid GFBorder with radius.', (tester) async {
    const radius = Radius.circular(20);

    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.rRect,
        dashedLine: const [2, 0],
        radius: radius,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.rRect);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.child, text);
  });

  testWidgets('Oval GFBorder.', (tester) async {
    const stroke = 2.0;

    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.oval,
        dashedLine: const [6, 0],
        strokeWidth: stroke,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.oval);
    expect(app.border.dashedLine, [6, 0]);
    expect(app.border.strokeWidth, stroke);
    expect(app.border.child, text);
  });

  testWidgets('Circular GFBorder.', (tester) async {
    const stroke = 2.0;
    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.circle,
        dashedLine: const [2, 0],
        strokeWidth: stroke,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.circle);
    expect(app.border.dashedLine, [2, 0]);
    expect(app.border.strokeWidth, stroke);
    expect(app.border.child, text);
  });

  testWidgets('Dashed GFBorder.', (tester) async {
    final GFBorder border =
        GFBorder(color: color, type: GFBorderType.rRect, child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.rRect);
    expect(app.border.child, text);
  });

  testWidgets('Dashed GFBorder with radius.', (tester) async {
    const radius = Radius.circular(20);

    final GFBorder border = GFBorder(
        color: color, type: GFBorderType.rRect, radius: radius, child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.rRect);
    expect(app.border.radius, radius);
    expect(app.border.child, text);
  });

  testWidgets('Oval dashed GFBorder.', (tester) async {
    const stroke = 2.0;

    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.oval,
        strokeWidth: stroke,
        dashedLine: const [3, 1],
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.oval);
    expect(app.border.strokeWidth, stroke);
    expect(app.border.dashedLine, [3, 1]);
    expect(app.border.child, text);
  });

  testWidgets('Circular dashed GFBorder.', (tester) async {
    const stroke = 2.0;

    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.circle,
        dashedLine: const [3, 1],
        strokeWidth: stroke,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.circle);
    expect(app.border.dashedLine, [3, 1]);
    expect(app.border.strokeWidth, stroke);
    expect(app.border.child, text);
  });

  testWidgets('Dotted GFBorder.', (tester) async {
    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.rect,
        dashedLine: const [2, 1],
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.rect);
    expect(app.border.dashedLine, [2, 1]);
    expect(app.border.child, text);
  });

  testWidgets('Dotted GFBorder with radius.', (tester) async {
    const radius = Radius.circular(20);

    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.rRect,
        dashedLine: const [2, 1],
        radius: radius,
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.rRect);
    expect(app.border.dashedLine, [2, 1]);
    expect(app.border.radius, radius);
    expect(app.border.child, text);
  });

  testWidgets('Oval dotted GFBorder.', (tester) async {
    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.oval,
        dashedLine: const [2, 1],
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.oval);
    expect(app.border.dashedLine, [2, 1]);
    expect(app.border.child, text);
  });

  testWidgets('Circular dotted GFBorder.', (tester) async {
    final GFBorder border = GFBorder(
        color: color,
        type: GFBorderType.circle,
        dashedLine: const [2, 1],
        child: text);

    final TestApp app = TestApp(border);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.border.color, color);
    expect(app.border.type, GFBorderType.circle);
    expect(app.border.dashedLine, [2, 1]);
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
