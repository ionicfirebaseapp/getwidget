import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  final UniqueKey checkboxKey = UniqueKey();
  bool isChecked = false;
  testWidgets('Checkbox button can be constructed Function call Null',
      (tester) async {
    final GFCheckbox checkbox = GFCheckbox(
      key: checkboxKey,
      onChanged: null,
      value: isChecked,
    );

    final TestApp app = TestApp(checkbox);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(checkboxKey), findsOneWidget);
    expect(app.checkbox.onChanged, null);
    expect(
      app.checkbox.value,
      isChecked,
    );
  });

  testWidgets('Basic Checkbox can be constructed with Value ', (tester) async {
    final checkbox = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFCheckbox(
                  key: checkboxKey,
                  size: GFSize.SMALL,
                  activeBgColor: GFColors.DANGER,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                  value: isChecked,
                ),
              )),
    );
    await tester.pumpWidget(checkbox);
    expect(find.byKey(checkboxKey), findsOneWidget);
    expect(isChecked, isFalse);
  });

  testWidgets('Checkbox button set True and False Values',
      (WidgetTester tester) async {
    final checkbox = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFCheckbox(
                  key: checkboxKey,
                  size: GFSize.SMALL,
                  activeBgColor: GFColors.DANGER,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                  value: isChecked,
                ),
              )),
    );
    // find checkbox  key
    await tester.pumpWidget(checkbox);
    expect(find.byKey(checkboxKey), findsOneWidget);

    // finds value
    expect(isChecked, isFalse);
    expect(tester.widget<GFCheckbox>(find.byType(GFCheckbox)).value, isChecked);
    await tester.tap(find.byType(GFCheckbox));

    await tester.pumpAndSettle();
    print(isChecked);
    expect(isChecked, isTrue);

    await tester.tap(find.byType(GFCheckbox));
    await tester.pumpAndSettle();
    print(isChecked);
    expect(isChecked, isFalse);

    await tester.tap(find.byType(GFCheckbox));
    await tester.pumpAndSettle();
    print(isChecked);
    expect(isChecked, isTrue);

    isChecked = true;
    await tester.pumpAndSettle();
    expect(isChecked, true);
  });

  testWidgets('Checkbox is focusable and has correct focus color',
      (WidgetTester tester) async {
    final FocusNode focusNode = FocusNode(debugLabel: 'Checkbox');
    tester.binding.focusManager.highlightStrategy =
        FocusHighlightStrategy.alwaysTraditional;

    final checkbox = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Material(
            child: Center(
          child: GFCheckbox(
            key: checkboxKey,
            size: GFSize.SMALL,
            activeBgColor: GFColors.DANGER,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
            value: isChecked,
            autofocus: true,
            focusNode: focusNode,
          ),
        )),
      ),
    );

    await tester.pumpWidget(checkbox);
    expect(find.byKey(checkboxKey), findsOneWidget);
    await tester.pumpAndSettle();
    expect(focusNode.hasPrimaryFocus, isTrue);
  });

  testWidgets('Checkbox can be toggled by keyboard shortcuts',
      (WidgetTester tester) async {
    tester.binding.focusManager.highlightStrategy =
        FocusHighlightStrategy.alwaysTraditional;
    bool value = true;

    Widget buildApp({bool enabled = true}) => MaterialApp(
          home: Material(
            child: Center(
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) =>
                      GFCheckbox(
                        value: value,
                        onChanged: enabled
                            ? (bool newValue) {
                                setState(() {
                                  value = newValue;
                                });
                              }
                            : null,
                        autofocus: true,
                      )),
            ),
          ),
        );

    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect(value, isTrue);
  });

  testWidgets('Checkbox size is configurable by ThemeData',
      (WidgetTester tester) async {
    final checkbox = Theme(
      data: ThemeData(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Material(
                    child: Center(
                  child: GFCheckbox(
                    key: checkboxKey,
                    activeBgColor: GFColors.DANGER,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    size: 48,
                  ),
                ))),
      ),
    );
    await tester.pumpWidget(checkbox);
    expect(find.byKey(checkboxKey), findsOneWidget);
    expect(tester.getSize(find.byKey(checkboxKey)), const Size(48, 48));
  });

  testWidgets('Checkbox can be constructed with Active & InactiveIcon ',
      (tester) async {
    const activeIcon = Icon(Icons.sentiment_satisfied);
    const inactiveIcon = Icon(Icons.sentiment_dissatisfied);

    final GFCheckbox checkbox = GFCheckbox(
      key: checkboxKey,
      value: isChecked,
      onChanged: null,
      activeIcon: activeIcon,
      inactiveIcon: inactiveIcon,
    );

    final TestApp app = TestApp(checkbox);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(checkboxKey), findsOneWidget);
    expect(app.checkbox.activeIcon, activeIcon);
    expect(app.checkbox.inactiveIcon, inactiveIcon);
  });

  testWidgets('Checkbox can be constructed with Colors ', (tester) async {
    final GFCheckbox checkbox = GFCheckbox(
      key: checkboxKey,
      activeBgColor: Colors.amber,
      customBgColor: Colors.amberAccent,
      inactiveBgColor: Colors.blue,
      activeBorderColor: Colors.deepPurple,
      inactiveBorderColor: Colors.green,
      value: isChecked,
      onChanged: (value) {
        isChecked = true;
      },
    );

    final TestApp app = TestApp(checkbox);
    await tester.pumpWidget(app);
    await tester.pump();
    expect(find.byKey(checkboxKey), findsOneWidget);
    expect(app.checkbox.activeBgColor, Colors.amber);
    expect(app.checkbox.customBgColor, Colors.amberAccent);
    expect(app.checkbox.inactiveBgColor, Colors.blue);
    expect(app.checkbox.activeBorderColor, Colors.deepPurple);
    expect(app.checkbox.inactiveBorderColor, Colors.green);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.checkbox);

  final GFCheckbox checkbox;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.checkbox,
            ],
          ),
        ),
      );
}
