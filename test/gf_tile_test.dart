import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  testWidgets('Basic GFListTile Testing', (tester) async {
    const GFListTile tile = GFListTile();
    const TestApp tiletest = TestApp(tile);
    await tester.pumpWidget(tiletest);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('GFListTile Properties Testing', (tester) async {
    const GFListTile tile = GFListTile(
      titleText: 'Title',
      subtitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
      icon: Icon(Icons.favorite),
    );
    const TestApp app = TestApp(tile);
    await tester.pumpWidget(app);

    final text = find.text('Title');
    expect(text, findsOneWidget);
    final subtext =
        find.text('Lorem ipsum dolor sit amet, consectetur adipiscing');
    expect(subtext, findsOneWidget);

    final icons = find.byIcon(Icons.favorite);
    expect(icons, findsOneWidget);
    await tester.pump();
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('GFListTile Test default cursor', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.forbidden,
              child: GFListTile(
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    );
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('GFListTile Test default cursor', (tester) async {
    const title = 'Title';
    const subtitle = 'Lorem ipsum dolor sit amet, consectetur adipiscing';
    const icon = Icon(Icons.favorite);
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.forbidden,
              child: GFListTile(
                onTap: () {},
                titleText: title,
                subtitleText: subtitle,
                icon: icon,
              ),
            ),
          ),
        ),
      ),
    );
    debugDefaultTargetPlatformOverride = null;
  });

   testWidgets('GFListTile with avatar', (WidgetTester tester) async {
    const title = 'Title';
    const subtitle = 'Lorem ipsum dolor sit amet, consectetur adipiscing';
    const icon = Icon(Icons.favorite);
    const avatar = GFAvatar();
    const GFListTile listTile = GFListTile(
      avatar: avatar,
      titleText: title,
      subtitleText: subtitle,
      icon: icon,
    );
    const TestApp app = TestApp(listTile);
    expect(app.tile.avatar, avatar);
    expect(app.tile.titleText, title);
    expect(app.tile.subtitleText, subtitle);
    expect(app.tile.icon, icon);
  });

  testWidgets('GFListTile Test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ListView(
            children: const <Widget>[
              GFListTile(
                title: Text('A'),
                subtitle: Text('A'),
              ),
              GFListTile(
                title: Text('B'),
                subtitle: Text('B'),
              ),
            ],
          ),
        ),
      ),
    );
    debugDefaultTargetPlatformOverride = null;
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
