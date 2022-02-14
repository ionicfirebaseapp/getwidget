import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Key listTileKey = UniqueKey();

  testWidgets('GFListTile can be constructed', (tester) async {
    const title = 'title text';
    const subTitle = 'sub title text';
    const icon = Icon(Icons.favorite);
    const avatar = GFAvatar(
      backgroundColor: Colors.tealAccent,
    );
    const description = Text('description');

    final GFListTile listTile = GFListTile(
      key: listTileKey,
      titleText: title,
      subTitleText: subTitle,
      color: Colors.teal,
      avatar: avatar,
      icon: icon,
      description: description,
    );

    final TestApp app = TestApp(listTile);
    await tester.pumpWidget(app);

    // find listTile by key
    expect(find.byKey(listTileKey), findsOneWidget);
    // find title text
    expect(find.text('title text'), findsOneWidget);
    // find sub title text
    expect(find.text('sub title text'), findsOneWidget);
    // find description
    expect(find.text('description'), findsOneWidget);
    // find icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    // find avatar
    expect(find.byType(GFAvatar), findsOneWidget);

    expect(app.tile.avatar, avatar);
    expect(app.tile.titleText, title);
    expect(app.tile.subTitleText, subTitle);
    expect(app.tile.description, description);
    expect(app.tile.icon, icon);
    expect(app.tile.color, Colors.teal);
  });

  testWidgets('GFListTile can be constructed with text', (tester) async {
    var i = 5;
    final titleText = Text('title $i');
    const subTitleText = Text('sub title');
    const icon = Icon(Icons.favorite);
    const avatar = GFAvatar(
      backgroundColor: Colors.tealAccent,
    );
    const description = Text('description');

    final GFListTile listTile = GFListTile(
      key: listTileKey,
      title: titleText,
      subTitle: subTitleText,
      color: Colors.teal,
      avatar: avatar,
      icon: icon,
      description: description,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      onTap: () {
        i++;
        print('tapped $i');
      },
      onLongPress: () {
        i--;
        print('long pressed $i');
      },
    );

    final TestApp app = TestApp(listTile);
    await tester.pumpWidget(app);

    // find listTile by key
    expect(find.byKey(listTileKey), findsOneWidget);
    // find title text
    expect(find.text('title 5'), findsOneWidget);
    // find sub title text
    expect(find.text('sub title'), findsOneWidget);
    // find description
    expect(find.text('description'), findsOneWidget);
    // find icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    // find avatar
    expect(find.byType(GFAvatar), findsOneWidget);
    await tester.tap(find.text('title 5'));
    await tester.pump();
    await tester.longPress(find.text('sub title'));
    await tester.pump();

    expect(app.tile.avatar, avatar);
    expect(app.tile.title, titleText);
    expect(app.tile.subTitle, subTitleText);
    expect(app.tile.description, description);
    expect(app.tile.icon, icon);
    expect(app.tile.color, Colors.teal);
    expect(app.tile.padding, const EdgeInsets.all(6));
    expect(app.tile.margin,
        const EdgeInsets.symmetric(vertical: 8, horizontal: 6));
  });

  testWidgets('GFListTile can be constructed with hover color and focus color',
      (tester) async {
    const titleText = Text('title');
    const subTitleText = Text('sub title');
    const icon = Icon(Icons.favorite);
    const avatar = GFAvatar(
      backgroundColor: Colors.tealAccent,
    );
    const description = Text('description');
    final FocusNode focusNode = FocusNode(debugLabel: 'GFListTile');

    final GFListTile listTile = GFListTile(
      key: listTileKey,
      title: titleText,
      subTitle: subTitleText,
      color: Colors.teal,
      avatar: avatar,
      icon: icon,
      description: description,
      enabled: true,
      focusColor: Colors.amber,
      hoverColor: Colors.blue,
      focusNode: focusNode,
      autofocus: true,
    );

    final TestApp app = TestApp(listTile);
    await tester.pumpWidget(app);

    // find listTile by key
    expect(find.byKey(listTileKey), findsOneWidget);
    // find title text
    expect(find.text('title'), findsOneWidget);
    // find sub title text
    expect(find.text('sub title'), findsOneWidget);
    // find description
    expect(find.text('description'), findsOneWidget);
    // find icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    // find avatar
    expect(find.byType(GFAvatar), findsOneWidget);

    await tester.pumpAndSettle();

    expect(app.tile.avatar, avatar);
    expect(app.tile.title, titleText);
    expect(app.tile.subTitle, subTitleText);
    expect(app.tile.description, description);
    expect(app.tile.icon, icon);
    expect(app.tile.avatar, avatar);
    expect(app.tile.color, Colors.teal);
    expect(app.tile.focusColor, Colors.amber);
    expect(app.tile.hoverColor, Colors.blue);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.tile);

  final GFListTile tile;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.tile,
            ],
          ),
        ),
      );
}
