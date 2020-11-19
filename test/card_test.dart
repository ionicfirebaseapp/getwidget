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
  const title = GFListTile(
    titleText: 'Card Title',
    icon: Icon(Icons.favorite_border),
  );
  const content = Text('Hello');
  final borderradius = BorderRadius.circular(10);
  const border = Border(top: BorderSide(color: Colors.black));

  testWidgets('GF Card can be created.', (tester) async {
    final GFCard card = GFCard(
        color: color,
        elevation: elevation,
        borderOnForeground: borderonForeground,
        padding: padding,
        margin: margin,
        title: title,
        content: childWidget);

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
    expect(app.card.content, childWidget);
  });

  testWidgets('GF Card with color gradient.', (tester) async {
    const gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.red, Colors.pink]);
    const GFCard card = GFCard(
      gradient: gradient,
      elevation: elevation,
      borderOnForeground: borderonForeground,
      padding: padding,
      margin: margin,
      title: title,
    );

    const TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.gradient, gradient);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderonForeground);
    expect(app.card.padding, padding);
    expect(app.card.margin, margin);
    expect(app.card.title, title);
  });

  testWidgets('GF Card with clip behaviour.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const clip = Clip.none;

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      clipBehavior: clip,
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.clipBehavior, clip);
  });

  testWidgets('GF Card with background image.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const boxfit = BoxFit.cover;

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      boxFit: boxfit,
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.boxFit, boxfit);
  });

  testWidgets('GF Card with background image & image overlay.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const boxfit = BoxFit.cover;
    const imageoverlay = NetworkImage(
        'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      boxFit: boxfit,
      imageOverlay: imageoverlay,
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.boxFit, boxfit);
    expect(app.card.imageOverlay, imageoverlay);
  });

  testWidgets('GF Card with semantic container.', (tester) async {
    const scontainer = false;

    const GFCard card = GFCard(
      semanticContainer: scontainer,
      elevation: elevation,
      borderOnForeground: borderonForeground,
      title: title,
    );

    const TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.semanticContainer, scontainer);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderonForeground);
    expect(app.card.title, title);
  });

  testWidgets('GF Card with title position.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const titleposition = GFPosition.end;

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      titlePosition: titleposition,
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.titlePosition, titleposition);
  });

  testWidgets('GF Card with border & border radius.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    final GFCard card = GFCard(
        title: title,
        border: border,
        borderRadius: borderradius,
        image: bgImage,
        content: content);

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
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
      buttonBar: custombuttonbar,
      title: title,
      image: bgImage,
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.buttonBar, custombuttonbar);
    expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with custom title.', (tester) async {
    const customtitle = GFListTile(
      titleText: 'Card Title',
      icon: Icon(Icons.favorite_border),
    );
    final GFCard card = GFCard(
      color: color,
      title: customtitle,
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customtitle);
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
      title: customtitle,
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customtitle);
  });

  testWidgets('GF Card with full background image & buttonbar.',
      (tester) async {
    const imageoverlay = NetworkImage(
        'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');
    final colorfilter =
        ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken);
    const customtitle = GFListTile(
      titleText: 'Card Title',
      subtitleText: 'Sub title',
    );
    final GFCard card = GFCard(
      color: color,
      title: customtitle,
      imageOverlay: imageoverlay,
      colorFilter: colorfilter,
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customtitle);
    expect(app.card.imageOverlay, imageoverlay);
    expect(app.card.colorFilter, colorfilter);
  });

  testWidgets(
      'GF Card with full background image , customized title & buttonbar.',
      (tester) async {
    const imageoverlay = NetworkImage(
        'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');
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
      title: customtitle,
      imageOverlay: imageoverlay,
      colorFilter: colorfilter,
      buttonBar: custombuttonbar,
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customtitle);
    expect(app.card.imageOverlay, imageoverlay);
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
