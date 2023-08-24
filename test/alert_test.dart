import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final childWidget = Container(
    width: 100,
    height: 100,
  );
  const bgColor = Colors.teal;
  const topBar = Icon(Icons.umbrella);
  const bottomBar = Text('Get Widget');

  testWidgets('GFAlert can be created.', (tester) async {
    const GFAlert alert = GFAlert(
        backgroundColor: bgColor, content: topBar, bottomBar: bottomBar);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.backgroundColor, bgColor);
    expect(app.alert.content, topBar);
    expect(app.alert.bottomBar, bottomBar);
  });

  testWidgets('Basic GFAlert.', (tester) async {
    const basicType = GFAlertType.basic;

    const GFAlert alert = GFAlert(
        backgroundColor: bgColor,
        content: topBar,
        type: basicType,
        bottomBar: bottomBar);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.backgroundColor, bgColor);
    expect(app.alert.content, topBar);
    expect(app.alert.type, basicType);
    expect(app.alert.bottomBar, bottomBar);
  });

  testWidgets('Rounded GFAlert.', (tester) async {
    const roundedType = GFAlertType.rounded;

    const GFAlert alert =
        GFAlert(content: topBar, type: roundedType, bottomBar: bottomBar);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.content, topBar);
    expect(app.alert.type, roundedType);
    expect(app.alert.bottomBar, bottomBar);
  });

  testWidgets('FullWidth GFAlert.', (tester) async {
    const basicType = GFAlertType.basic;
    const fullWidth = 400.0;

    const GFAlert alert = GFAlert(
        width: fullWidth,
        content: topBar,
        type: basicType,
        bottomBar: bottomBar);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.width, fullWidth);
    expect(app.alert.content, topBar);
    expect(app.alert.type, basicType);
    expect(app.alert.bottomBar, bottomBar);
  });

  testWidgets('Customized GFAlert.', (tester) async {
    const basicType = GFAlertType.basic;
    final bottomBar = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GFButton(
          shape: GFButtonShape.square,
          color: GFColors.LIGHT,
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GFButton(
          shape: GFButtonShape.square,
          type: GFButtonType.outline2x,
          icon: const Icon(
            Icons.keyboard_arrow_right,
            color: GFColors.PRIMARY,
          ),
          position: GFPosition.end,
          text: 'Learn More',
          onPressed: () {},
        )
      ],
    );
    final GFAlert alert =
        GFAlert(content: topBar, type: basicType, bottomBar: bottomBar);

    final TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.content, topBar);
    expect(app.alert.type, basicType);
    expect(app.alert.bottomBar, bottomBar);
  });

  testWidgets('GFAlert with alignment.', (tester) async {
    const alignment = Alignment.bottomRight;

    const GFAlert alert =
        GFAlert(content: topBar, alignment: alignment, bottomBar: bottomBar);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.content, topBar);
    expect(app.alert.alignment, alignment);
    expect(app.alert.bottomBar, bottomBar);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.alert);
  final GFAlert alert;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.alert,
            ],
          ),
        ),
      );
}
