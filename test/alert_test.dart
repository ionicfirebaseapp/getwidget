import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final childWidget = Container(
    width: 100,
    height: 100,
  );
  final bgcolor = Colors.teal;
  const contentchild = Icon(Icons.umbrella);
  const child = Text('Get Widget');

  testWidgets('GF Alert can be created.', (tester) async {
    final GFAlert alert = GFAlert(
        backgroundColor: bgcolor,
        contentChild: contentchild,
        child: childWidget);

    final TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.backgroundColor, bgcolor);
    expect(app.alert.contentChild, contentchild);
    expect(app.alert.child, childWidget);
  });

  testWidgets('Basic GF Alert.', (tester) async {
    const basicType = GFAlertType.basic;

    final GFAlert alert = GFAlert(
        backgroundColor: bgcolor,
        contentChild: contentchild,
        type: basicType,
        child: child);

    final TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.backgroundColor, bgcolor);
    expect(app.alert.contentChild, contentchild);
    expect(app.alert.type, basicType);
    expect(app.alert.child, child);
  });

  testWidgets('Rounded GF Alert.', (tester) async {
    const roundedType = GFAlertType.rounded;

    const GFAlert alert =
        GFAlert(contentChild: contentchild, type: roundedType, child: child);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.contentChild, contentchild);
    expect(app.alert.type, roundedType);
    expect(app.alert.child, child);
  });

  testWidgets('Fullwidth GF Alert.', (tester) async {
    const basicType = GFAlertType.basic;
    const fullWidth = 400.0;

    const GFAlert alert = GFAlert(
        width: fullWidth,
        contentChild: contentchild,
        type: basicType,
        child: child);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.width, fullWidth);
    expect(app.alert.contentChild, contentchild);
    expect(app.alert.type, basicType);
    expect(app.alert.child, child);
  });

  testWidgets('Customized GF Alert.', (tester) async {
    const basicType = GFAlertType.basic;
    final customBottombar = Row(
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
    final GFAlert alert = GFAlert(
        contentChild: contentchild,
        type: basicType,
        bottombar: customBottombar,
        child: child);

    final TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.contentChild, contentchild);
    expect(app.alert.type, basicType);
    expect(app.alert.child, child);
  });

  testWidgets('GF Alert with alignment.', (tester) async {
    const alignment = Alignment.bottomRight;

    const GFAlert alert =
        GFAlert(contentChild: contentchild, alignment: alignment, child: child);

    const TestApp app = TestApp(alert);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.alert.contentChild, contentchild);
    expect(app.alert.alignment, alignment);
    expect(app.alert.child, child);
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
