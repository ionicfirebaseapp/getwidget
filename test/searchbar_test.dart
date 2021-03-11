import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Key searchBarKey = UniqueKey();
  const List searchList = [
    'Flutter',
    'React',
    'Ionic',
    'Xamarin',
    'Flutter2',
    'Angular'
  ];

  const notFound = 'oopsy...no items found';

  final noItemsFound = Container(
    child: const Text(notFound),
  );

  final decoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(50)),
  );

  testWidgets('GF SearchBar can be constructed', (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
      key: searchBarKey,
      searchList: searchList,
      overlaySearchListItemBuilder: (item) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          item,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      searchQueryBuilder: (query, list) => list
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList(),
    );

    final TestApp app = TestApp(searchBar);
    await tester.pumpWidget(app);

    // find searchBar by key
    expect(find.byKey(searchBarKey), findsOneWidget);
    // tap the textField to display overlay search list items
    await tester.tap(find.byType(TextField));
    // rebuild the widget
    await tester.pump();
    // find overlay search list item
    expect(find.text('${searchList[1]}'), findsOneWidget);
    // enter 'flutter' to the textField
    await tester.enterText(find.byWidget(searchBar), 'flutter');
    // find the text 'flutter' in textField
    expect(find.text('flutter'), findsOneWidget);
    // find the text 'flutter' in overlay search list items
    expect(find.widgetWithText(Container, 'flutter'), findsOneWidget);
    // tap the close icon to close the overlay search list items
    await tester.tap(find.byIcon(Icons.close));
    // find the text 'flutter' in overlay search list items
    expect(find.widgetWithText(Container, 'flutter'), findsNothing);
  });

  testWidgets('Can hide searchBox when item selected', (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
      key: searchBarKey,
      searchList: searchList,
      overlaySearchListItemBuilder: (item) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          item,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      hideSearchBoxWhenItemSelected: true,
      searchQueryBuilder: (query, list) => list
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList(),
      overlaySearchListHeight: 115,
    );

    final TestApp app = TestApp(searchBar);
    await tester.pumpWidget(app);

    // find searchBar by key
    expect(find.byKey(searchBarKey), findsOneWidget);
    // set searchBar.hideSearchBoxWhenItemSelected = true state to hide searchBar when item selected
    expect(app.searchBar.hideSearchBoxWhenItemSelected, isTrue);
    // tap the textField to display overlay search list items
    await tester.tap(find.byType(TextField));
    // rebuild the widget
    await tester.pump();
    // find overlay search list item
    expect(find.text('${searchList[1]}'), findsOneWidget);
    // tap to select item from overlay search list items
    await tester.tap(find.text('${searchList[1]}'));
    // rebuild the widget
    await tester.pump();
    // find searchBar
    expect(find.byType(TextField), findsNothing);

    expect(app.searchBar.hideSearchBoxWhenItemSelected, isTrue);
    expect(app.searchBar.overlaySearchListHeight, 115);
  });

  testWidgets('On item selected and when item not found in GFSearchBar List',
      (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
      key: searchBarKey,
      searchList: searchList,
      overlaySearchListItemBuilder: (item) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          item,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      searchQueryBuilder: (query, list) => list
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList(),
      onItemSelected: (item) {
        print('selected item $item');
      },
      noItemsFoundWidget: noItemsFound,
    );

    final TestApp app = TestApp(searchBar);
    await tester.pumpWidget(app);

    // find searchBar by key
    expect(find.byKey(searchBarKey), findsOneWidget);
    // tap the textField to display overlay search list items
    await tester.tap(find.byType(TextField));
    // rebuild the widget
    await tester.pump();
    // find overlay search list item
    expect(find.text('${searchList[1]}'), findsOneWidget);
    // enter 'flutter' to the textField
    await tester.enterText(find.byWidget(searchBar), 'flu');
    // find text 'flutter' in overlay search list item
    expect(find.text('flu'), findsOneWidget);
    // find text 'flutter' in overlay search list item
    expect(find.text('${searchList[1]}'), findsOneWidget);
    // tap to select 'flutter' item from overlay search list items
    await tester.tap(find.text('${searchList[1]}'));
    // rebuild the widget
    await tester.pump();
    // // find overlay search list
    // expect(find.text('${searchList[1]}'), findsNothing);
    // // enter 'dart' to the textField
    // await tester.enterText(find.byWidget(searchBar), 'dart');
    // // find text 'oopsy...no items found' in overlay search list item
    // // expect(find.text(notFound), findsOneWidget);

    expect(app.searchBar.noItemsFoundWidget, noItemsFound);
  });

  testWidgets('GFSearchBar with search box input decoration', (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
      key: searchBarKey,
      searchList: searchList,
      overlaySearchListItemBuilder: (item) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          item,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      searchQueryBuilder: (query, list) => list
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList(),
      onItemSelected: (item) {
        print('selected item $item');
      },
      searchBoxInputDecoration: decoration,
    );

    final TestApp app = TestApp(searchBar);
    await tester.pumpWidget(app);

    expect(app.searchBar.searchBoxInputDecoration, decoration);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.searchBar);

  final GFSearchBar searchBar;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.searchBar,
            ],
          ),
        ),
      );
}
