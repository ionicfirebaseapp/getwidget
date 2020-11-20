import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const List searchList = [
    'Flutter',
    'React',
    'Ionic',
    'Xamarin',
    'Flutter2',
    'React2',
    'Ionic2',
    'Xamarin2',
  ];

  final noItemsFound = Container(
    child: const Text('no items found...'),
  );

  final decoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(50)),
  );

  testWidgets(
      'GF SearchBar without searchList, overlaySearchListItemBuilder, searchQueryBuilder',
      (tester) async {
    // `GFSearchBar.searchList` null or `GFSearchBar.overlaySearchListItemBuilder` null
    // or `GFSearchBar.searchQueryBuilder` null.
    expect(
      () => GFSearchBar(
        searchList: null,
        overlaySearchListItemBuilder: null,
        searchQueryBuilder: null,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('GF SearchBar can be constructed', (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
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
  });

  testWidgets('Can hide searchBox when item selected', (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
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

    expect(app.searchBar.hideSearchBoxWhenItemSelected, isTrue);
    expect(app.searchBar.overlaySearchListHeight, 115);
  });

  testWidgets('On item selected and when item not found in GFSearchBar List',
      (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
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
      onItemSelected: (item) {
        print('selected item $item');
      },
      noItemsFoundWidget: noItemsFound,
    );

    final TestApp app = TestApp(searchBar);

    await tester.pumpWidget(app);

    expect(app.searchBar.hideSearchBoxWhenItemSelected, isTrue);
    expect(app.searchBar.noItemsFoundWidget, noItemsFound);
  });

  testWidgets('GFSearchBar with search box input decoration', (tester) async {
    final GFSearchBar searchBar = GFSearchBar(
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
      onItemSelected: (item) {
        print('selected item $item');
      },
      noItemsFoundWidget: noItemsFound,
      searchBoxInputDecoration: decoration,
    );

    final TestApp app = TestApp(searchBar);

    await tester.pumpWidget(app);

    expect(app.searchBar.hideSearchBoxWhenItemSelected, isTrue);
    expect(app.searchBar.noItemsFoundWidget, noItemsFound);
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
