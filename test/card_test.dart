import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  final childWidget = Container(
    width: 100,
    height: 100,
  );

  final color = Colors.white;
  const elevation = 2.0;
  const borderonForeground = false;
  const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  const margin = EdgeInsets.all(1);
  // const clip = Clip.none;
  // const semanticcontainer = false;
  const title = GFListTile(
    titleText: 'Card Title',
    icon: Icon(Icons.favorite_border),
  );
  const content = Text('Hello');
  // final image = Image.network('https://images.unsplash.com/photo-1547721064-da6cfb341d50');
  // final buttonbar = GFButtonBar(
  //                           padding: const EdgeInsets.only(bottom: 10),
  //                           children: <Widget>[
  //                             GFButton(
  //                               onPressed: () {},
  //                               text: 'Read More',
  //                             ),
  //                             GFButton(
  //                               onPressed: () {},
  //                               text: 'Send',
  //                             )
  //                           ],
  //                         );
  // const titleposition = GFPosition.end;
  final borderradius = BorderRadius.circular(10);
  const border = Border(top: BorderSide(color: Colors.black));
  // const boxfit = BoxFit.cover;
  // const gradient = LinearGradient(
  //     begin: Alignment.bottomCenter,
  //     end: Alignment.topCenter,
  //     colors: [Colors.red, Colors.pink]);

  testWidgets('GF Card can be created.', (tester) async {
    //  final bgImage = Image.network(
    //   'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    // );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        borderOnForeground: borderonForeground,
        padding: padding,
        margin: margin,
        title: title,
        // image: bgImage,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderonForeground);
    expect(app.card.padding, padding);
    expect(app.card.margin, margin);
    expect(app.card.title, title);
    expect(app.card.content, content);

    // expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with background image.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    final GFCard card = GFCard(
      image: bgImage,
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with border & border radius.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        borderOnForeground: borderonForeground,
        padding: padding,
        margin: margin,
        title: title,
        border: border,
        borderRadius: borderradius,
        image: bgImage,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderonForeground);
    expect(app.card.padding, padding);
    expect(app.card.margin, margin);
    expect(app.card.title, title);
    expect(app.card.border, border);
    expect(app.card.borderRadius, borderradius);
    expect(app.card.content, content);

    expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with custom buttonbar.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const custombuttonbar = GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: null,
          child: Text('Read More'),
          icon: Icon(Icons.keyboard_arrow_right),
          type: GFButtonType.transparent,
        ),
      ],
    );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        padding: padding,
        buttonBar: custombuttonbar,
        title: title,
        image: bgImage,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.buttonBar, custombuttonbar);
    expect(app.card.padding, padding);
    expect(app.card.content, content);
    expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with custom title.', (tester) async {
    const customtitle = GFListTile(
      titleText: 'Card Title',
      icon: Icon(Icons.favorite_border),
    );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        padding: padding,
        title: customtitle,
        // image: bgImage,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.padding, padding);
    expect(app.card.title, customtitle);
    expect(app.card.content, content);

    // expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with GFAvatar & Subtitle in title section.',
      (tester) async {
    const customtitle = GFListTile(
      avatar: GFAvatar(),
      titleText: 'Card Title',
      subtitleText: 'Sub title',
      icon: Icon(Icons.favorite_border),
    );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        padding: padding,
        title: customtitle,
        // image: bgImage,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.padding, padding);
    expect(app.card.title, customtitle);
    expect(app.card.content, content);
    // expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with full background image & buttonbar.',
      (tester) async {
    // const imageoverlay = NetworkImage(
    //     'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');
    final colorfilter =
        ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken);
    const customtitle = GFListTile(
      titleText: 'Card Title',
      subtitleText: 'Sub title',
    );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        padding: padding,
        title: customtitle,
        // imageOverlay: imageoverlay,
        colorFilter: colorfilter,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.padding, padding);
    expect(app.card.title, customtitle);
    expect(app.card.content, content);
    // expect(app.card.imageOverlay, imageoverlay);
    expect(app.card.colorFilter, colorfilter);
  });

  testWidgets(
      'GF Card with full background image , customized title & buttonbar.',
      (tester) async {
    // const imageoverlay = NetworkImage(
    //     'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');
    final colorfilter =
        ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken);
    const customtitle = GFListTile(
      avatar: GFAvatar(),
      titleText: 'Card Title',
      subtitleText: 'Sub title',
      icon: Icon(Icons.favorite_border),
    );
    const custombuttonbar = GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: null,
          child: Text('Read More'),
          icon: Icon(Icons.keyboard_arrow_right),
          type: GFButtonType.transparent,
        ),
      ],
    );
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        padding: padding,
        title: customtitle,
        // imageOverlay: imageoverlay,
        colorFilter: colorfilter,
        buttonBar: custombuttonbar,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.padding, padding);
    expect(app.card.title, customtitle);
    expect(app.card.content, content);
    // expect(app.card.imageOverlay, imageoverlay);
    expect(app.card.colorFilter, colorfilter);
    expect(app.card.buttonBar, custombuttonbar);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.card);

  final GFCard card;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  bool fav = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.card,
            ],
          ),
        ),
      );
}
