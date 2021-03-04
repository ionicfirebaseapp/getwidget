import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

class TestPaintingContext implements PaintingContext {
  final List<Invocation> invocations = <Invocation>[];
  @override
  void noSuchMethod(Invocation invocation) {
    invocations.add(invocation);
  }
}

void main() {
  testWidgets('AnimatedAlign.debugFillProperties', (WidgetTester tester) async {
    final GFAnimation box = GFAnimation(
      duration: const Duration(seconds: 2),
      alignment: Alignment.bottomLeft,
      type: GFAnimationType.align,
      child: Container(
        width: 80,
        height: 80,
      ),
    );
    expect(box, hasOneLineDescription);
  });

  testWidgets('AnimatedAlign alignment visual-to-directional animation',
      (WidgetTester tester) async {
    final Key alignKey = UniqueKey();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: GFAnimation(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topRight,
          type: GFAnimationType.align,
          child: SizedBox(key: alignKey, width: 100, height: 200),
        ),
      ),
    );

    expect(tester.getSize(find.byKey(alignKey)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(alignKey)), const Offset(800, 0));

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: GFAnimation(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomRight,
          type: GFAnimationType.align,
          child: SizedBox(key: alignKey, width: 100, height: 200),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(alignKey)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(alignKey)), const Offset(800, 0));
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.getSize(find.byKey(alignKey)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(alignKey)), const Offset(800, 200));
    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.getSize(find.byKey(alignKey)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(alignKey)), const Offset(800, 400));
  });

  testWidgets('AnimatedContainer.debugFillProperties',
      (WidgetTester tester) async {
    final GFAnimation container = GFAnimation(
      width: 50,
      changedWidth: 100,
      height: 50,
      changedHeight: 100,
      activeColor: Colors.transparent,
      color: Colors.transparent,
      fontSize: 35,
      type: GFAnimationType.container,
      child: Container(
        width: 80,
        height: 80,
      ),
    );
    expect(container, hasOneLineDescription);
  });

  testWidgets('AnimatedContainer test animation control ',
      (WidgetTester tester) async {
    final GlobalKey key = GlobalKey();

    final GFAnimation animate = GFAnimation(
      key: key,
      duration: const Duration(milliseconds: 300),
      color: Colors.amberAccent,
      width: 50,
      changedWidth: 100,
      height: 50,
      changedHeight: 100,
      activeColor: Colors.transparent,
      fontSize: 35,
      type: GFAnimationType.container,
      child: Container(
        width: 80,
        height: 80,
      ),
    );

    final TestApp app = TestApp(animate);

    await tester.pumpWidget(app);
    expect(app.animate.color, equals(Colors.amberAccent));
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('AnimatedContainer testing over animate ',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GFAnimation(
      duration: Duration(milliseconds: 300),
      type: GFAnimationType.container,
      color: Colors.teal,
      child: SizedBox(
        width: 45,
        height: 45,
      ),
    ));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pumpWidget(const GFAnimation(
      duration: Duration(milliseconds: 300),
      type: GFAnimationType.container,
      color: Colors.teal,
      child: SizedBox(
        width: 45,
        height: 45,
      ),
    ));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pumpWidget(const GFAnimation(
      duration: Duration(milliseconds: 300),
      type: GFAnimationType.container,
      color: Colors.teal,
      child: SizedBox(
        width: 45,
        height: 45,
      ),
    ));
    expect(tester.binding.transientCallbackCount,
        0); // this is the only time an animation should have started!
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pumpWidget(const GFAnimation(
      duration: Duration(milliseconds: 300),
      type: GFAnimationType.container,
      color: Colors.teal,
      child: SizedBox(
        width: 45,
        height: 45,
      ),
    ));
    expect(tester.binding.transientCallbackCount, 0);
  });

  testWidgets('AnimatedContainer alignment visual-to-directional animation',
      (WidgetTester tester) async {
    final Key target = UniqueKey();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: GFAnimation(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topRight,
          type: GFAnimationType.container,
          child: SizedBox(key: target, width: 100, height: 200),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(792, 8));
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: GFAnimation(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomRight,
          type: GFAnimationType.container,
          child: SizedBox(key: target, width: 100, height: 200),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(792, 8));
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(792, 200));
    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(792, 392));
  });

  testWidgets('Animation rerun', (WidgetTester tester) async {
    await tester.pumpWidget(Center(
        child: GFAnimation(
            duration: const Duration(milliseconds: 200),
            type: GFAnimationType.container,
            child: Container(
              child: const Text('X', textDirection: TextDirection.ltr),
              width: 100,
              height: 100,
            ))));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    RenderBox text = tester.renderObject(find.text('X'));
    expect(text.size.width, equals(84));
    expect(text.size.height, equals(84));
    await tester.pump(const Duration(milliseconds: 1000));
    await tester.pumpWidget(Center(
        child: GFAnimation(
            duration: const Duration(milliseconds: 200),
            type: GFAnimationType.container,
            child: Container(
              child: const Text('X', textDirection: TextDirection.ltr),
              width: 200,
              height: 200,
            ))));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    text = tester.renderObject(find.text('X'));
    expect(text.size.width, greaterThan(60));
    expect(text.size.width, lessThan(220));
    expect(text.size.height, greaterThan(60));
    expect(text.size.height, lessThan(220));
    await tester.pump(const Duration(milliseconds: 1000));
    expect(text.size.width, equals(84));
    expect(text.size.height, equals(84));
    await tester.pumpWidget(Center(
        child: GFAnimation(
            duration: const Duration(milliseconds: 200),
            child: Container(
              child: const Text('X', textDirection: TextDirection.ltr),
              width: 200,
              height: 200,
            ))));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(text.size.width, equals(84));
    expect(text.size.height, greaterThan(60));
    expect(text.size.height, lessThan(190));
    await tester.pump(const Duration(milliseconds: 1000));
    expect(text.size.width, equals(84));
    expect(text.size.height, equals(84));
  });

  // --------------------------- size

  testWidgets('animates forwards then backwards with stable-sized children',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const Center(
        child: GFAnimation(
          type: GFAnimationType.size,
          duration: Duration(milliseconds: 200),
          child: SizedBox(
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
    RenderBox box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(100));
    expect(box.size.height, equals(100));
    await tester.pumpWidget(
      const Center(
        child: GFAnimation(
          width: 200,
          height: 200,
          duration: Duration(milliseconds: 200),
          type: GFAnimationType.size,
          child: SizedBox(
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(150));
    expect(box.size.height, equals(150));
    TestPaintingContext context = TestPaintingContext();
    box.paint(context, Offset.zero);
    expect(context.invocations.first.memberName, equals(#pushClipRect));
    await tester.pump(const Duration(milliseconds: 100));
    box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(200));
    expect(box.size.height, equals(200));
    await tester.pumpWidget(
      const Center(
        child: GFAnimation(
          duration: Duration(milliseconds: 200),
          type: GFAnimationType.size,
          width: 200,
          height: 200,
          child: SizedBox(
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(200));
    expect(box.size.height, equals(200));
    context = TestPaintingContext();
    box.paint(context, Offset.zero);
    expect(context.invocations.first.memberName, equals(#paintChild));
    await tester.pump(const Duration(milliseconds: 100));
    box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(200));
    expect(box.size.height, equals(200));
  });

  testWidgets('clamps animated size to constraints',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: GFAnimation(
            duration: Duration(milliseconds: 200),
            type: GFAnimationType.size,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
    RenderBox box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(100));
    expect(box.size.height, equals(100));
    // Attempt to animate beyond the outer SizedBox.
    await tester.pumpWidget(
      const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: GFAnimation(
            duration: Duration(milliseconds: 200),
            type: GFAnimationType.size,
            child: SizedBox(
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
    // Verify that animated size is the same as the outer SizedBox.
    await tester.pump(const Duration(milliseconds: 100));
    box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(100));
    expect(box.size.height, equals(100));
  });

  testWidgets('resyncs its animation controller', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Center(
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          vsync: TestVSync(),
          child: SizedBox(
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
    await tester.pumpWidget(
      const Center(
        child: GFAnimation(
          duration: Duration(milliseconds: 200),
          type: GFAnimationType.size,
          child: SizedBox(
            width: 200,
            height: 100,
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    final RenderBox box = tester.renderObject(find.byType(AnimatedSize));
    expect(box.size.width, equals(100));
  });
  testWidgets('does not run animation unnecessarily',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const Center(
        child: GFAnimation(
          duration: Duration(milliseconds: 200),
          type: GFAnimationType.size,
          child: SizedBox(
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
    for (int i = 0; i < 20; i++) {
      final RenderAnimatedSize box =
          tester.renderObject(find.byType(AnimatedSize));
      expect(box.size.width, 100);
      expect(box.size.height, 100);
      expect(box.state, RenderAnimatedSizeState.stable);
      expect(box.isAnimating, false);
      await tester.pump(const Duration(milliseconds: 10));
    }
  });

  testWidgets('RotationTransition maintains chosen alignment during animation',
      (WidgetTester tester) async {
    AnimationController controller;
    Animation<double> animation;

    controller = AnimationController(
        duration: const Duration(seconds: 5), vsync: const TestVSync());
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    final Widget widget = GFAnimation(
      turnsAnimation: animation,
      controller: controller,
      type: GFAnimationType.rotateTransition,
      alignment: Alignment.topRight,
      child: const Text('Rotation', textDirection: TextDirection.ltr),
    );

    await tester.pumpWidget(widget);
    RotationTransition actualRotatedBox =
        tester.widget(find.byType(RotationTransition));
    Alignment actualAlignment = actualRotatedBox.alignment;
    expect(actualAlignment, Alignment.topRight);

    controller.value = 0.5;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(RotationTransition));
    actualAlignment = actualRotatedBox.alignment;
    expect(actualAlignment, Alignment.topRight);
  });

  testWidgets('RotationTransition animates', (WidgetTester tester) async {
    AnimationController controller;
    Animation<double> animation;

    controller = AnimationController(
        duration: const Duration(seconds: 5), vsync: const TestVSync());
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    final Widget widget = GFAnimation(
      turnsAnimation: animation,
      controller: controller,
      type: GFAnimationType.rotateTransition,
      alignment: Alignment.topRight,
      child: const Text('Rotation', textDirection: TextDirection.ltr),
    );

    await tester.pumpWidget(widget);
    Transform actualRotatedBox = tester.widget(find.byType(Transform));
    Matrix4 actualTurns = actualRotatedBox.transform;
    expect(actualTurns, equals(Matrix4.rotationZ(0)));

    controller.value = 0.5;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(Transform));
    actualTurns = actualRotatedBox.transform;
    expect(actualTurns, Matrix4.rotationZ(math.pi));

    controller.value = 0.75;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(Transform));
    actualTurns = actualRotatedBox.transform;
    expect(actualTurns, Matrix4.rotationZ(math.pi * 1.5));
  });

  testWidgets('ScaleTransition animates', (WidgetTester tester) async {
    AnimationController controller;
    Animation<double> animation;

    controller = AnimationController(
        duration: const Duration(seconds: 5), vsync: const TestVSync());
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    final Widget widget = GFAnimation(
      turnsAnimation: animation,
      controller: controller,
      type: GFAnimationType.scaleTransition,
      alignment: Alignment.topRight,
      child: const Text('Scale', textDirection: TextDirection.rtl),
    );

    await tester.pumpWidget(widget);
    Transform actualRotatedBox = tester.widget(find.byType(Transform));
    Matrix4 actualTurns = actualRotatedBox.transform;
    expect(actualTurns, equals(Matrix4.rotationZ(0)));

    controller.value = 0.5;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(Transform));
    actualTurns = actualRotatedBox.transform;
    expect(actualTurns, Matrix4.rotationZ(math.pi));

    controller.value = 0.75;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(Transform));
    actualTurns = actualRotatedBox.transform;
    expect(actualTurns, Matrix4.rotationZ(math.pi * 1.5));
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.animate);

  final GFAnimation animate;

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
              widget.animate,
            ],
          ),
        ),
      );
}
