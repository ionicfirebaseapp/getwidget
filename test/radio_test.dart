import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final UniqueKey radioKey = UniqueKey();
  const int groupValue = 0;
  testWidgets('Radio button can be constructed Function call Null',
      (tester) async {
    final GFRadio radio = GFRadio(
      key: radioKey,
      onChanged: null,
      value: 2,
      groupValue: groupValue,
      toggleable: false,
    );

    final TestApp app = TestApp(radio);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(radioKey), findsOneWidget);
    expect(app.radio.onChanged, null);
    expect(
      app.radio.value,
      2,
    );
  });

  testWidgets('Radio control test', (tester) async {
    final List<int> log = <int>[];
    const value = 2;
    final radiobutton = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFRadio(
                  key: radioKey,
                  size: GFSize.SMALL,
                  value: value,
                  groupValue: groupValue,
                  onChanged: log.add,
                  //  (value) {
                  //   setState(() {
                  //     log.add(value);
                  //   });
                  // },
                  inactiveIcon: null,
                  activeBorderColor: GFColors.SUCCESS,
                  radioColor: GFColors.SUCCESS,
                ),
              )),
    );
    await tester.pumpWidget(radiobutton);
    expect(find.byKey(radioKey), findsOneWidget);

    await tester.tap(find.byKey(radioKey));
    expect(groupValue, 0);
    print(log);
    expect(log, equals(<int>[2]));
    log.clear();

    print(log);
    expect(log, isEmpty);

    await tester.tap(find.byKey(radioKey));
    await tester.pumpAndSettle();
    print(log);
    expect(log, equals(<int>[2]));
    log.clear();
  });

  testWidgets('Radio can be toggled when toggleable is set', (tester) async {
    final List<int> log = <int>[];
    const value = 1;
    const groupValue = 2;
    final radiobutton = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFRadio(
                  key: radioKey,
                  size: GFSize.SMALL,
                  value: value,
                  groupValue: groupValue,
                  onChanged: log.add,
                  //  (value) {
                  //   setState(() {
                  //     log.add(value);
                  //   });
                  // },
                  toggleable: true,
                ),
              )),
    );

    await tester.pumpWidget(radiobutton);
    expect(find.byKey(radioKey), findsOneWidget);
    expect(groupValue, 2);
    await tester.tap(find.byKey(radioKey));
    await tester.tap(find.byKey(radioKey));
    print(log[0]);
    print(log[1]);
    expect(log, equals(<int>[1, 1]));
    log.clear();

    await tester.pumpAndSettle();
    log.insert(0, 5);
    print(log[0]);
    expect(log, equals(<int>[5]));
    log.clear();

    expect(log, isEmpty);
  });

  testWidgets('Radio size is configurable by themeData',
      (WidgetTester tester) async {
    final Key key1 = UniqueKey();
    await tester.pumpWidget(
      Theme(
        data: ThemeData(materialTapTargetSize: MaterialTapTargetSize.padded),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Material(
            child: Center(
              child: GFRadio<bool>(
                key: key1,
                groupValue: true,
                value: true,
                onChanged: (bool newValue) {},
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byKey(key1)), const Size(20, 20));

    final Key key2 = UniqueKey();
    await tester.pumpWidget(
      Theme(
        data:
            ThemeData(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Material(
            child: Center(
              child: GFRadio<bool>(
                  key: key2,
                  groupValue: true,
                  value: true,
                  onChanged: (bool newValue) {},
                  size: 40),
            ),
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byKey(key2)), const Size(40, 40));
  });

  testWidgets('Radio changes mouse cursor when hovered Default click',
      (WidgetTester tester) async {
    const Key key = ValueKey<int>(1);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: MouseRegion(
                cursor: SystemMouseCursors.forbidden,
                child: GFRadio<int>(
                  key: key,
                  value: 1,
                  onChanged: (int? v) {},
                  groupValue: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final TestGesture gesture =
        await tester.createGesture(kind: PointerDeviceKind.mouse, pointer: 1);
    await gesture.addPointer(location: tester.getCenter(find.byKey(key)));
    addTearDown(gesture.removePointer);

    await tester.pump();
    expect(RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.click);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.radio);

  final GFRadio radio;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.radio,
            ],
          ),
        ),
      );
}
