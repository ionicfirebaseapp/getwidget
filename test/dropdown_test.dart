import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const iconSize = 24.0;
  final List itemList = <String>['one', 'two', 'three', 'four', 'five', 'Six'];

  testWidgets('Dropdown button can be constructed Null Values', (tester) async {
    const dropdownKey = Key('header');
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: null,
      onChanged: null,
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);
    expect(find.byKey(dropdownKey), findsOneWidget);
    await tester.pump();
    expect(app.dropdown.onChanged, null);
    expect(
      app.dropdown.value,
      null,
    );
  });

  testWidgets('Dropdown button control can be constructed', (tester) async {
    const dropdownKey = Key('header');
    String value = 'one';
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: value,
      onChanged: (newValue) {
        value = newValue;
      },
    );

    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    await tester.pumpWidget(app);
    await tester.tap(find.text('one'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(value, equals('one'));
    await tester.tap(find.text('three').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(value, equals('three'));

    await tester.tap(find.text('three'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(value, equals('three'));

    await tester.pumpWidget(app);
    await tester.tap(find.text('two').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(value, equals('two'));
  });

  testWidgets('Dropdown button can be constructed with items length',
      (tester) async {
    const dropdownKey = Key('header');
    String dropdownValue = 'one';
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: dropdownValue,
      onChanged: (newValue) {
        dropdownValue = newValue;
      },
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);
    expect(find.byKey(dropdownKey), findsOneWidget);
    await tester.pump();
    expect(app.dropdown.items!.length, itemList.length);
    expect(app.dropdown.value, dropdownValue);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(itemList.length, equals(6));
  });

  testWidgets('DropdownButton disabledHint is null by default', (tester) async {
    const dropdownKey = Key('header');
    const String value = 'one';
    final List itemLists = <String>[];
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemLists
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: value,
      onChanged: null,
      hint: const Text('hint used when disabled'),
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    // [hint] should display when [items] is an empty list
    expect(find.text('hint used when disabled'), findsOneWidget);
  });

  testWidgets(
      'DropdowwnButton hint displays when the items list is empty, items is null, and disabledHint is null',
      (tester) async {
    const dropdownKey = Key('header');
    final List itemLists = <String>[];
    String value = 'one';
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemLists
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: value,
      onChanged: null,
      disabledHint: null,
      hint: const Text('hint used when disabled'),
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);
    expect(find.text('hint used when disabled'), findsOneWidget);

    expect(find.byKey(dropdownKey), findsOneWidget);

    final RenderBox buttonBoxHintValue =
        tester.renderObject(find.byKey(dropdownKey));
    assert(buttonBoxHintValue.attached);

    value = 'one';
    await tester.pumpWidget(app);
    final RenderBox buttonBox = tester.renderObject(find.byKey(dropdownKey));
    assert(buttonBox.attached);
    print(itemList[0]);

    expect(buttonBox.localToGlobal(Offset.zero),
        equals(buttonBoxHintValue.localToGlobal(Offset.zero)));
    expect(buttonBox.size, equals(buttonBoxHintValue.size));
  });

  testWidgets('DropdownButton is activated with the enter key', (tester) async {
    const dropdownKey = Key('header');
    final FocusNode focusNode = FocusNode(debugLabel: 'DropdownButton');
    String value = 'one';
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: value,
      itemHeight: null,
      onChanged: (newValue) {
        value = newValue;
      },
      focusNode: focusNode,
      autofocus: true,
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    expect(focusNode.hasPrimaryFocus, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation
    expect(value, equals('one'));

    await tester.sendKeyEvent(LogicalKeyboardKey.tab); // Focus 'two'
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter); // Select 'two'.
    await tester.pump();

    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(value, equals('two'));
  });

  testWidgets('DropdownButton is activated with the space key', (tester) async {
    const dropdownKey = Key('header');
    final FocusNode focusNode = FocusNode(debugLabel: 'DropdownButton');
    String value = 'one';
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: value,
      itemHeight: null,
      onChanged: (newValue) {
        value = newValue;
      },
      focusNode: focusNode,
      autofocus: true,
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    expect(focusNode.hasPrimaryFocus, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation
    expect(value, equals('one'));

    await tester.sendKeyEvent(LogicalKeyboardKey.tab); // Focus 'two'
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.space); // Select 'two'.
    await tester.pump();

    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(value, equals('two'));
  });

  testWidgets('DropdownButton won\'t be focused if not enabled',
      (tester) async {
    final UniqueKey dropdownKey = UniqueKey();
    final FocusNode focusNode = FocusNode(debugLabel: 'DropdownButton');
    final GFDropdown dropdown = GFDropdown(
        key: dropdownKey,
        items: itemList
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: null,
        focusNode: focusNode,
        autofocus: true,
        focusColor: const Color(0xff00ff00));
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    await tester
        .pump(); // Pump a frame for autofocus to take effect (although it shouldn't).
    expect(focusNode.hasPrimaryFocus, isFalse);
  });

  testWidgets('DropdownButton changes selected item with arrow keys',
      (tester) async {
    final UniqueKey dropdownKey = UniqueKey();
    final FocusNode focusNode = FocusNode(debugLabel: 'DropdownButton');
    String value = 'one';
    final GFDropdown dropdown = GFDropdown(
        key: dropdownKey,
        items: itemList
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        value: value,
        itemHeight: null,
        onChanged: (newValue) {
          value = newValue;
        },
        focusNode: focusNode,
        autofocus: true,
        focusColor: const Color(0xff00ff00));
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    await tester.pumpWidget(app);
    await tester.pump();
    expect(focusNode.hasPrimaryFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation
    expect(value, equals('one'));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown); // Focus 'two'.
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown); // Focus 'three'.
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp); // Back to 'two'.
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter); // Select 'two'.
    await tester.pump();

    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(value, equals('two'));
  });

  testWidgets('GFDropdown Color Property can be constructed ', (tester) async {
    const dropdownKey = Key('header');
    const GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: null,
      onChanged: null,
      iconDisabledColor: Colors.amber,
      iconEnabledColor: Colors.blue,
      dropdownColor: Colors.redAccent,
      focusColor: Colors.red,
    );

    const TestApp app = TestApp(dropdown);

    await tester.pumpWidget(app);
    expect(app.dropdown.iconDisabledColor, Colors.amber);
    expect(
      app.dropdown.iconEnabledColor,
      Colors.blue,
    );
    expect(
      app.dropdown.dropdownColor,
      Colors.redAccent,
    );
    expect(
      app.dropdown.focusColor,
      Colors.red,
    );

    await tester.tap(find.byKey(dropdownKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GFDropdown Button Property can be constructed', (tester) async {
    const dropdownKey = Key('header');
    const GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: null,
      isDense: true,
      isExpanded: false,
      autofocus: false,
      onChanged: null,
      iconSize: iconSize,
      itemHeight: 40,
      elevation: 8,
    );

    const TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    expect(app.dropdown.iconSize, iconSize);
    expect(app.dropdown.onChanged, null);
    expect(app.dropdown.isExpanded, false);
    expect(app.dropdown.isDense, true);
    expect(app.dropdown.autofocus, false);
    expect(app.dropdown.elevation, 8);
    expect(app.dropdown.itemHeight, 40);

    await tester.tap(find.byKey(dropdownKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.dropdown);

  final GFDropdown dropdown;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.dropdown,
            ],
          ),
        ),
      );
}
