import 'dart:math';
import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_loader_type.dart';

class GFLoader extends StatefulWidget {
  const GFLoader(
      {Key key,
      this.loaderColorOne = Colors.redAccent,
      this.loaderColorTwo = Colors.green,
      this.loaderColorThree = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.loaderType = LoaderDotType.circle,
      this.loaderIcon = const Icon(Icons.blur_on)})
      : super(key: key);

  final Color loaderColorOne;
  final Color loaderColorTwo;
  final Color loaderColorThree;
  final Duration duration;
  final LoaderDotType loaderType;
  final Icon loaderIcon;

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

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.70,
          curve: Curves.linear,
        ),
      ),
    );

    animation_2 = Tween(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.1,
          0.80,
          curve: Curves.linear,
        ),
      ),
    );

    animation_3 = Tween(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.2,
          0.90,
          curve: Curves.linear,
        ),
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
  Widget build(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: animation_1.value <= 0.4
                  ? 2.5 * animation_1.value
                  : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                      ? 1.0
                      : 2.5 - (2.5 * animation_1.value),
//            opacity: (animation_1.value <= 0.4 ? 2.5 * animation_1.value : (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value)),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Dot(
                  radius: 10,
                  color: widget.loaderColorOne,
                  type: widget.loaderType,
                  icon: widget.loaderIcon,
                ),
              ),
            ),
            Opacity(
              opacity: animation_2.value <= 0.4
                  ? 2.5 * animation_2.value
                  : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                      ? 1.0
                      : 2.5 - (2.5 * animation_2.value),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Dot(
                  radius: 10,
                  color: widget.loaderColorTwo,
                  type: widget.loaderType,
                  icon: widget.loaderIcon,
                ),
              ),
            ),
            Opacity(
              opacity: animation_3.value <= 0.4
                  ? 2.5 * animation_3.value
                  : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                      ? 1.0
                      : 2.5 - (2.5 * animation_3.value),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Dot(
                  radius: 10,
                  color: widget.loaderColorThree,
                  type: widget.loaderType,
                  icon: widget.loaderIcon,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  const Dot({Key key, this.radius, this.color, this.type, this.icon})
      : super(key: key);

  final double radius;
  final Color color;
  final LoaderDotType type;
  final Icon icon;

  @override
  Widget build(BuildContext context) => Center(
        child: type == LoaderDotType.icon
            ? Icon(
                icon.icon,
                color: color,
                size: 1.3 * radius,
              )
            : Transform.rotate(
                angle: type == LoaderDotType.diamond ? pi / 4 : 0.0,
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                      color: color,
                      shape: type == LoaderDotType.circle
                          ? BoxShape.circle
                          : BoxShape.rectangle),
                ),
              ),
      );
}
