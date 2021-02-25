import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  testWidgets('AnimatedContainer with properties', (WidgetTester tester) async {
    final AnimatedContainer container = AnimatedContainer(
      constraints: const BoxConstraints.tightFor(width: 22, height: 32),
      decoration: const BoxDecoration(color: Colors.red),
      foregroundDecoration: const BoxDecoration(color: Colors.amber),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(6),
      transform: Matrix4.translationValues(5, 4, 0),
      width: 55,
      height: 76,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
    );
    expect(container, hasOneLineDescription);
  });
  testWidgets('AnimatedContainer test animation control ', (WidgetTester tester) async {
    final GlobalKey key = GlobalKey();
    const BoxDecoration decorationA = BoxDecoration(
      color: Colors.amberAccent,
    );
    const BoxDecoration decoration = BoxDecoration(
      color: Colors.blueAccent,
    );
    BoxDecoration actualDecoration;
    await tester.pumpWidget(
        AnimatedContainer(
            key: key,
            duration: const Duration(milliseconds: 300),
            decoration: decorationA
        )
    );
    final RenderDecoratedBox box = key.currentContext.findRenderObject();
    actualDecoration = box.decoration;
    expect(actualDecoration.color, equals(decorationA.color));
    await tester.pumpWidget(
        AnimatedContainer(
            key: key,
            duration: const Duration(milliseconds: 300),
            decoration: decoration
        )
    );
    expect(key.currentContext.findRenderObject(), equals(box));
    actualDecoration = box.decoration;
    expect(actualDecoration.color, equals(decorationA.color));
    await tester.pump(const Duration(seconds: 1));
    actualDecoration = box.decoration;
    expect(actualDecoration.color, equals(decoration.color));
    expect(box, hasAGoodToStringDeep);
    expect(
      box.toStringDeep(minLevel: DiagnosticLevel.info),
      equalsIgnoringHashCodes(
        'RenderDecoratedBox#00000\n'
            ' │ parentData: <none>\n'
            ' │ constraints: BoxConstraints(w=800, h=600)\n'
            ' │ size: Size(800, 600)\n'
            ' │ decoration: BoxDecoration:\n'
            ' │   color: Color(0xff0000ff)\n'
            ' │ configuration: ImageConfiguration(bundle:\n'
            ' │   PlatformAssetBundle#00000(), devicePixelRatio: 1, platform:\n'
            ' │   android)\n'
            ' │\n'
            ' └─child: RenderLimitedBox#00000\n'
            '   │ parentData: <none> (can use size)\n'
            '   │ constraints: BoxConstraints(w=800, h=600)\n'
            '   │ size: Size(800, 600)\n'
            '   │ maxWidth: 0\n'
            '   │ maxHeight: 0\n'
            '   │\n'
            '   └─child: RenderConstrainedBox#00000\n'
            '       parentData: <none> (can use size)\n'
            '       constraints: BoxConstraints(w=800, h=600)\n'
            '       size: Size(800, 600)\n'
            '       additionalConstraints: BoxConstraints(biggest)\n',
      ),
    );
  });
  testWidgets('AnimatedContainer testing over animate ', (WidgetTester tester) async {
    await tester.pumpWidget(
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: Colors.teal,
        )
    );
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pumpWidget(
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: Colors.greenAccent,
        )
    );
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pumpWidget(
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: Colors.amber,
        )
    );
    expect(tester.binding.transientCallbackCount, 1); // this is the only time an animation should have started!
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.transientCallbackCount, 0);
    await tester.pumpWidget(
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: Colors.amberAccent,
        )
    );
    expect(tester.binding.transientCallbackCount, 0);
  });
  testWidgets('AnimatedContainer padding visual-to-directional animation', (WidgetTester tester) async {
    final Key target = UniqueKey();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(right: 50),
          child: SizedBox.expand(key: target),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(target)), const Size(750, 600));
    expect(tester.getTopRight(find.byKey(target)), const Offset(750, 0));
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsetsDirectional.only(start: 100),
          child: SizedBox.expand(key: target),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(target)), const Size(750, 600));
    expect(tester.getTopRight(find.byKey(target)), const Offset(750, 0));
    await tester.pump(const Duration(milliseconds: 200));
    expect(tester.getSize(find.byKey(target)), const Size(725, 600));
    expect(tester.getTopRight(find.byKey(target)), const Offset(725, 0));
    await tester.pump(const Duration(milliseconds: 600));
    expect(tester.getSize(find.byKey(target)), const Size(700, 600));
    expect(tester.getTopRight(find.byKey(target)), const Offset(700, 0));
  });
  testWidgets('AnimatedContainer alignment visual-to-directional animation', (WidgetTester tester) async {
    final Key target = UniqueKey();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topRight,
          child: SizedBox(key: target, width: 100, height: 200),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(800, 0));
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: AlignmentDirectional.bottomStart,
          child: SizedBox(key: target, width: 100, height: 200),
        ),
      ),
    );
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(800, 0));
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(800, 200));
    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.getSize(find.byKey(target)), const Size(100, 200));
    expect(tester.getTopRight(find.byKey(target)), const Offset(800, 400));
  });
  testWidgets('Animation rerun', (WidgetTester tester) async {
    await tester.pumpWidget(
        Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 100,
                height: 100,
                child: const Text('X', textDirection: TextDirection.ltr)
            )
        )
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    RenderBox text = tester.renderObject(find.text('X'));
    expect(text.size.width, equals(100));
    expect(text.size.height, equals(100));
    await tester.pump(const Duration(milliseconds: 1000));
    await tester.pumpWidget(
        Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 200,
                height: 200,
                child: const Text('X', textDirection: TextDirection.ltr)
            )
        )
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    text = tester.renderObject(find.text('X'));
    expect(text.size.width, greaterThan(110));
    expect(text.size.width, lessThan(190));
    expect(text.size.height, greaterThan(110));
    expect(text.size.height, lessThan(190));
    await tester.pump(const Duration(milliseconds: 1000));
    expect(text.size.width, equals(200));
    expect(text.size.height, equals(200));
    await tester.pumpWidget(
        Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 200,
                height: 100,
                child: const Text('X', textDirection: TextDirection.ltr)
            )
        )
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(text.size.width, equals(200));
    expect(text.size.height, greaterThan(110));
    expect(text.size.height, lessThan(190));
    await tester.pump(const Duration(milliseconds: 1000));
    expect(text.size.width, equals(200));
    expect(text.size.height, equals(100));
  });
}