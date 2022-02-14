import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

Future<void> main() async {
  final childWidget = Container(
    width: 100,
    height: 100,
  );

  const color = Colors.white;
  const elevation = 2.0;
  const borderOnForeground = false;
  const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  const margin = EdgeInsets.all(1);
  const title = GFListTile(
    titleText: 'Card Title',
    icon: Icon(Icons.favorite_border),
  );
  const content = Text('Hello');
  final borderRadius = BorderRadius.circular(10);
  const border = Border(top: BorderSide(color: Colors.black));

  testWidgets('GF Card can be created.', (tester) async {
    final GFCard card = GFCard(
      color: color,
      elevation: elevation,
      borderOnForeground: borderOnForeground,
      padding: padding,
      margin: margin,
      title: title,
      content: childWidget,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderOnForeground);
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
    final GFCard card = GFCard(
      gradient: gradient,
      elevation: elevation,
      borderOnForeground: borderOnForeground,
      padding: padding,
      margin: margin,
      title: title,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.gradient, gradient);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderOnForeground);
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
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
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
    const boxFit = BoxFit.cover;

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      boxFit: boxFit,
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.boxFit, boxFit);
  });

  testWidgets('GF Card with background image & image overlay.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const boxFit = BoxFit.cover;
    const imageOverlay = NetworkImage(
        'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      boxFit: boxFit,
      imageOverlay: imageOverlay,
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.boxFit, boxFit);
    expect(app.card.imageOverlay, imageOverlay);
  });

  testWidgets('GF Card with semantic container.', (tester) async {
    const isSemanticContainer = false;

    final GFCard card = GFCard(
      semanticContainer: isSemanticContainer,
      elevation: elevation,
      borderOnForeground: borderOnForeground,
      title: title,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.semanticContainer, isSemanticContainer);
    expect(app.card.elevation, elevation);
    expect(app.card.borderOnForeground, borderOnForeground);
    expect(app.card.title, title);
  });

  testWidgets('GF Card with title position.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const titlePosition = GFPosition.end;

    final GFCard card = GFCard(
      image: bgImage,
      title: title,
      titlePosition: titlePosition,
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    expect(app.card.image, bgImage);
    expect(app.card.title, title);
    expect(app.card.titlePosition, titlePosition);
  });

  testWidgets('GF Card with border & border radius.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    final GFCard card = GFCard(
      title: title,
      border: border,
      borderRadius: borderRadius,
      image: bgImage,
      content: content,
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.title, title);
    expect(app.card.border, border);
    expect(app.card.borderRadius, borderRadius);
    expect(app.card.content, content);
    expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with custom button bar.', (tester) async {
    final bgImage = Image.network(
      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
    );
    const customButtonBar = GFButtonBar(
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
      buttonBar: customButtonBar,
      title: title,
      image: bgImage,
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.elevation, elevation);
    expect(app.card.buttonBar, customButtonBar);
    expect(app.card.image, bgImage);
  });

  testWidgets('GF Card with custom title.', (tester) async {
    const customTitle = GFListTile(
      titleText: 'Card Title',
      icon: Icon(Icons.favorite_border),
    );
    final GFCard card = GFCard(
      color: color,
      title: customTitle,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customTitle);
  });

  testWidgets('GF Card with GFAvatar & subTitle in title section.',
      (tester) async {
    const customTitle = GFListTile(
      avatar: GFAvatar(),
      titleText: 'Card Title',
      subTitleText: 'Sub title',
      icon: Icon(Icons.favorite_border),
    );
    final GFCard card = GFCard(
      color: color,
      title: customTitle,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
      imageOverlay: const NetworkImage(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(app);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customTitle);
  });

  testWidgets('GF Card with full background image & button bar.',
      (tester) async {
    const imageOverlay = NetworkImage(
        'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');
    final colorFilter =
        ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken);
    const customTitle = GFListTile(
      titleText: 'Card Title',
      subTitleText: 'Sub title',
    );
    final GFCard card = GFCard(
      color: color,
      title: customTitle,
      imageOverlay: imageOverlay,
      colorFilter: colorFilter,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customTitle);
    expect(app.card.imageOverlay, imageOverlay);
    expect(app.card.colorFilter, colorFilter);
  });

  testWidgets(
      'GF Card with full background image, customized title & button bar.',
      (tester) async {
    const imageOverlay = NetworkImage(
        'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg');
    final colorFilter =
        ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken);
    const customTitle = GFListTile(
      avatar: GFAvatar(),
      titleText: 'Card Title',
      subTitleText: 'Sub title',
      icon: Icon(Icons.favorite_border),
    );
    const customButtonBar = GFButtonBar(
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
      title: customTitle,
      imageOverlay: imageOverlay,
      colorFilter: colorFilter,
      buttonBar: customButtonBar,
      image: Image.network(
          'https://cdn.pixabay.com/photo/2021/02/01/16/22/flamingo-5971206__340.jpg'),
    );

    final TestApp app = TestApp(card);

    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
    expect(app.card.color, color);
    expect(app.card.title, customTitle);
    expect(app.card.imageOverlay, imageOverlay);
    expect(app.card.colorFilter, colorFilter);
    expect(app.card.buttonBar, customButtonBar);
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
