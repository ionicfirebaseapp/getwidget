import 'package:flutter/material.dart';
import 'dart:math';
import 'package:getflutter/types/gf_loader_type.dart';


class GFLoader extends StatefulWidget {

  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final LoaderDotType dotType;
  final Icon dotIcon;

  GFLoader({
    this.dotOneColor = Colors.redAccent,
    this.dotTwoColor = Colors.green,
    this.dotThreeColor = Colors.blueAccent,
    this.duration = const Duration(milliseconds: 1000),
    this.dotType = LoaderDotType.circle,
    this.dotIcon = const Icon(Icons.blur_on)
  });

  @override
  _GFLoaderState createState() => _GFLoaderState();
}

class _GFLoaderState extends State<GFLoader>
    with SingleTickerProviderStateMixin {
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {
        //print(animation_1.value);
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    //print(animation_1.value <= 0.4 ? 2.5 * animation_1.value : (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value));
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: (animation_1.value <= 0.4 ? 2.5 * animation_1.value : (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value)),
            child: new Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Dot(
                radius: 10.0,
                color: widget.dotOneColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
            ),
          ),
          Opacity(
            opacity: (animation_2.value <= 0.4 ? 2.5 * animation_2.value : (animation_2.value > 0.40 && animation_2.value <= 0.60)? 1.0 : 2.5 - (2.5 * animation_2.value)),
            child: new Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Dot(
                radius: 10.0,
                color: widget.dotTwoColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
            ),
          ),
          Opacity(
            opacity: (animation_3.value <= 0.4 ? 2.5 * animation_3.value : (animation_3.value > 0.40 && animation_3.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_3.value)),
            child: new Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Dot(
                radius: 10.0,
                color: widget.dotThreeColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final LoaderDotType type;
  final Icon icon;

  Dot({this.radius, this.color, this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: type == LoaderDotType.icon ?
      Icon(icon.icon, color: color, size: 1.3 * radius,)
          : new Transform.rotate(
        angle: type == LoaderDotType.diamond ? pi/4 : 0.0,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(color: color, shape: type == LoaderDotType.circle? BoxShape.circle : BoxShape.rectangle),
        ),
      ),
    );
  }
}