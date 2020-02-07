import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_loader_type.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:getflutter/colors/gf_color.dart';

class GFLoader extends StatefulWidget {
  const GFLoader(
      {Key key,
      this.loaderColorOne = Colors.redAccent,
      this.loaderColorTwo = Colors.green,
      this.loaderColorThree = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.type = GFLoaderType.android,
      this.loaderIconOne = const Icon(Icons.blur_on),
        this.loaderIconTwo,
        this.loaderIconThree,
//        this.loaderSizeOne,
//        this.loaderSizeTwo,
//        this.loaderSizeThree,
        this.androidLoaderColor,
        this.loaderSize = 15.0,
        this.loaderstrokeWidth= 4.0,
        this.size = GFSize.medium,
        this.child



      })
      : super(key: key);

  final Color loaderColorOne;
  final Color loaderColorTwo;
  final Color loaderColorThree;
  final Duration duration;
  final GFLoaderType type;
  final Widget loaderIconOne;
//  final dynamic loaderSize;
//  final double loaderSizeTwo;
//  final double loaderSizeThree;
  final Widget loaderIconTwo;
  final Widget loaderIconThree;
  final Animation<Color> androidLoaderColor;
  final dynamic loaderSize;
  final double loaderstrokeWidth;
  final dynamic size;
  final Widget child;

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

    animation_1 = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.71,
          curve: Curves.linear,
        ),
      ),
    );


    animation_2 = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.1,
          0.81,
          curve: Curves.linear,
        ),
      ),
    );

    animation_3 = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.2,
          0.91,
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
        child: widget.type==GFLoaderType.android? Center(
          child:Container(
            height: GFSizesClass.getGFSize(widget.size)* 0.7,
            width: GFSizesClass.getGFSize(widget.size)* 0.7,
            child:  CircularProgressIndicator(
              valueColor: widget.androidLoaderColor,
              strokeWidth: widget.loaderstrokeWidth,
//              value: 20,
            ),
          )
        ):widget.type==GFLoaderType.ios?Center(
          child: CupertinoActivityIndicator(
              radius: GFSizesClass.getGFSize(widget.size)* 0.4

          ),
        ):widget.type==GFLoaderType.custom?
        Container(
//          color: Colors.amber,
//          height: GFSizesClass.getGFSize(widget.size)* 10,
//          width: GFSizesClass.getGFSize(widget.size)* 10,
          child: widget.child,

        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: animation_1.value <= 0.3
                  ? 2.5 * animation_1.value
                  : (animation_1.value > 0.30 && animation_1.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * animation_1.value),
//            opacity: (animation_1.value <= 0.4 ? 2.5 * animation_1.value : (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value)),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Loader(
                  radius:GFSizesClass.getGFSize(widget.size)*0.3,
                  color: widget.loaderColorOne,
                  type: widget.type,
                  icon: widget.loaderIconOne,
                ),
              ),
            ),
            Opacity(
              opacity: animation_2.value <= 0.3
                  ? 2.5 * animation_2.value
                  : (animation_2.value > 0.30 && animation_2.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * animation_2.value),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Loader(
                  radius: GFSizesClass.getGFSize(widget.size)*0.44,
                  color: widget.loaderColorTwo,
                  type: widget.type,
                  icon: widget.loaderIconTwo,
                ),
              ),
            ),
            Opacity(
              opacity: animation_3.value <= 0.3
                  ? 2.5 * animation_3.value
                  : (animation_3.value > 0.30 && animation_3.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * animation_3.value),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Loader(
                  radius: GFSizesClass.getGFSize(widget.size)*0.3,
                  color: widget.loaderColorThree,
                  type: widget.type,
                  icon: widget.loaderIconThree
                  ,
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

class Loader extends StatelessWidget {
  const Loader({Key key, this.radius, this.color, this.type, this.icon})
      : super(key: key);

  final double radius;
  final Color color;
  final GFLoaderType type;
  final Icon icon;


  @override
  Widget build(BuildContext context) => Center(
        child:Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
              color: color,
              shape: type == GFLoaderType.circle
                  ? BoxShape.circle
                  : BoxShape.rectangle),
        )
      );
}
