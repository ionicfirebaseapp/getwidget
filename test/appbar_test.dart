import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const title = Text('Appbar');
  final leading = GFIconButton(
    icon: const Icon(
      Icons.wb_sunny,
      color: GFColors.WHITE,
    ),
    onPressed: () {},
    type: GFButtonType.transparent,
  );
  final actionButton = GFIconButton(
    icon: const Icon(
      Icons.favorite,
      color: GFColors.WHITE,
    ),
    onPressed: () {},
    type: GFButtonType.transparent,
  );
  final flexibleSpace = Container(color: Colors.amber);
  final shape = RoundedRectangleBorder(
      side: const BorderSide(
          color: Colors.tealAccent, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(25));

  final bottom = PreferredSize(
      child: Container(
        color: Colors.orange,
        height: 4,
      ),
      preferredSize: const Size.fromHeight(4));

  const textTheme =
      TextTheme(headlineSmall: TextStyle(color: Colors.tealAccent));
  const iconTheme = IconThemeData(color: Colors.red);
  const actionsIconTheme = IconThemeData(color: Colors.amber);

  testWidgets('GF AppBar can be constructed', (tester) async {
    final GFAppBar appbar = GFAppBar();

    final TestApp app = TestApp(appbar);

    await tester.pumpWidget(app);
  });

  testWidgets('GF AppBar can be constructed with title, leading and actions',
      (tester) async {
    final GFAppBar appbar = GFAppBar(
      leading: leading,
      title: title,
      actions: <Widget>[actionButton],
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    expect(app.appbar.leading, leading);
    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
  });

  testWidgets('GF AppBar with title with no titleSpace', (tester) async {
    // when GFAppBar.titleSpacing is 0, title takes all the space available
    // with or without leading and actions
    final GFAppBar appbar = GFAppBar(
      leading: leading,
      title: title,
      titleSpacing: 0,
      actions: <Widget>[actionButton],
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    expect(app.appbar.leading, leading);
    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.titleSpacing, 0);
  });

  testWidgets('GF AppBar with centerTitle', (tester) async {
    // when GFAppBar.centerTitle is true, title will align at center.
    final GFAppBar appbar = GFAppBar(
      leading: leading,
      title: title,
      actions: <Widget>[actionButton],
      centerTitle: true,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    expect(app.appbar.leading, leading);
    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.centerTitle, true);
  });

  testWidgets('GF AppBar with automaticallyImplyLeading', (tester) async {
    // when GFAppBar.automaticallyImplyLeading is true and [leading] is null, automatically try to deduce what the leading
    // widget should be. If false and [leading] is null, leading space is given to [title].
    // If leading widget is not null, this parameter has no effect.
    final GFAppBar appbar = GFAppBar(
      title: title,
      actions: <Widget>[actionButton],
      automaticallyImplyLeading: true,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.automaticallyImplyLeading, true);
  });

  testWidgets('GF AppBar with flexibleSpace', (tester) async {
    // GFAppbar.flexibleSpace stacked behind the toolbar and the tab bar. It's height will
    // be the same as the app bar's overall height. A flexible space isn't actually
    // flexible unless the [GFAppBar]'s container changes the [GFAppBar]'s size.
    final GFAppBar appbar = GFAppBar(
      title: title,
      actions: <Widget>[actionButton],
      flexibleSpace: flexibleSpace,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byWidget(flexibleSpace), findsOneWidget);

    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.flexibleSpace, flexibleSpace);
  });

  testWidgets('GF AppBar with primary and brightness', (tester) async {
    // GFAppbar.primary on false displays title at the top of the screen.
    // If true, the app bar's toolbar elements and [bottom] widget will be
    // padded on top by the height of the system status bar.

    final GFAppBar appbar = GFAppBar(
      title: title,
      primary: false,
      brightness: Brightness.dark,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);

    expect(app.appbar.title, title);
    expect(app.appbar.primary, false);
    expect(app.appbar.brightness, Brightness.dark);
  });

  testWidgets('GF AppBar with backgroundColor and shape', (tester) async {
    // GFAppbar.shape to customize shape of the appbar
    final GFAppBar appbar = GFAppBar(
      title: title,
      actions: <Widget>[actionButton],
      backgroundColor: Colors.teal,
      shape: shape,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.backgroundColor, Colors.teal);
    expect(app.appbar.shape, shape);
  });

  testWidgets('GF AppBar with bottom and elevation', (tester) async {
    final GFAppBar appbar = GFAppBar(
      title: title,
      actions: <Widget>[actionButton],
      bottom: bottom,
      elevation: 1,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byWidget(bottom), findsOneWidget);

    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.bottom, bottom);
    expect(app.appbar.elevation, 1);
  });

  testWidgets('GF AppBar with textTheme, iconTheme, actionsIconTheme',
      (tester) async {
    const leadingIcon = Icon(Icons.wb_sunny);

    final GFAppBar appbar = GFAppBar(
      leading: leadingIcon,
      title: title,
      actions: const <Widget>[Icon(Icons.favorite)],
      textTheme: textTheme,
      actionsIconTheme: actionsIconTheme,
      iconTheme: iconTheme,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    expect(app.appbar.leading, leadingIcon);
    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.textTheme, textTheme);
    expect(app.appbar.actionsIconTheme, actionsIconTheme);
    expect(app.appbar.iconTheme, iconTheme);
  });
  testWidgets(
      'GF AppBar with bottomOpacity, toolbarOpacity and test searchBar with default searchBar value',
      (tester) async {
    final GFAppBar appbar = GFAppBar(
      title: title,
      actions: <Widget>[actionButton],
      bottomOpacity: 0.5,
      toolbarOpacity: 0.6,
      bottom: bottom,
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    expect(find.text('Appbar'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byWidget(bottom), findsOneWidget);

    expect(app.appbar.title, title);
    expect(app.appbar.actions!.length, 1);
    expect(app.appbar.bottom, bottom);
    expect(app.appbar.bottomOpacity, 0.5);
    expect(app.appbar.toolbarOpacity, 0.6);
    // set appbar.searchBar = false state to disable search bar
    expect(app.appbar.searchBar, isFalse);
    // try to find search icon when appbar.searchBar = false
    expect(find.byIcon(Icons.search), findsNothing);
  });

  testWidgets('GF AppBar with searchBar', (tester) async {
    final Key appbarKey = UniqueKey();
    final TextEditingController _searchController = TextEditingController();

    final GFAppBar appbar = GFAppBar(
      key: appbarKey,
      title: title,
      actions: <Widget>[actionButton],
      searchBar: true,
      searchController: _searchController,
      searchHintText: 'Search',
      searchHintStyle: const TextStyle(fontSize: 14, color: Colors.white70),
      searchTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      searchBarColorTheme: Colors.white,
      onChanged: (value) {
        print('on change $value');
      },
      onSubmitted: (value) {
        print('submitted $value');
      },
      onTap: () {
        print('tapped');
      },
    );

    final TestApp app = TestApp(appbar);
    await tester.pumpWidget(app);

    // find appbar by key
    expect(find.byKey(appbarKey), findsOneWidget);
    // find appbar title text
    expect(find.text('Appbar'), findsOneWidget);
    // find appbar action button icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    // set appbar.searchBar = true state to enable search bar
    expect(app.appbar.searchBar, isTrue);
    // find appbar search icon
    expect(find.byIcon(Icons.search), findsOneWidget);
    // tap the search icon
    await tester.tap(find.byIcon(Icons.search));
    // rebuild the widget
    await tester.pump();
    // enter 'flutter' to the textField
    await tester.enterText(find.byWidget(appbar), 'flutter');
    // find the text 'flutter' to test onChanged
    expect(find.text('flutter'), findsOneWidget);
    // to test onSubmitted when TextInputAction.done
    await tester.testTextInput.receiveAction(TextInputAction.done);
    // rebuild the widget
    await tester.pump();
    // find the text 'flutter' in textField
    expect(find.text('flutter'), findsOneWidget);
    // tap the close icon to close the searchBar
    await tester.tap(find.byIcon(Icons.close));
    // rebuild the widget
    await tester.pump();
    // try to find textField
    expect(find.byType(TextField), findsNothing);
    // tap the search icon to reopen the searchBar
    await tester.tap(find.byIcon(Icons.search));
    // rebuild the widget
    await tester.pump();
    // find the text 'flutter' in textField
    expect(find.text('flutter'), findsNothing);
    // tap the textField to test onTap
    await tester.tap(find.byType(TextField));
    // rebuild the widget
    await tester.pump();
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.appbar);

  final GFAppBar appbar;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: widget.appbar,
            body: Container(
              child: const Text('body'),
            )),
      );
}
