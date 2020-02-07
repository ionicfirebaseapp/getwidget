import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_loader_type.dart';
import 'package:getflutter/size/gf_size.dart';


class GFLoader extends StatefulWidget {
  const GFLoader(
      {Key key,
      this.loaderColorOne = Colors.redAccent,
      this.loaderColorTwo = Colors.green,
      this.loaderColorThree = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.type = GFLoaderType.android,
      this.loaderIconOne ,
        this.loaderIconTwo ,
        this.loaderIconThree ,
        this.androidLoaderColor,
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
  final Widget loaderIconOne ;
  final Widget loaderIconTwo;
  final Widget loaderIconThree;
  final Animation<Color> androidLoaderColor;
  final double loaderstrokeWidth;
  final dynamic size;
  final Widget child;

  @override
  _GFLoaderState createState() => _GFLoaderState();
}

class _GFLoaderState extends State<GFLoader>
    with SingleTickerProviderStateMixin {
  Animation<double>  loaderanimation1;
  Animation<double> loaderanimation2;
  Animation<double> loaderanimation3;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    loaderanimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.71,
          curve: Curves.linear,
        ),
      ),
    );


    loaderanimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.1,
          0.81,
          curve: Curves.linear,
        ),
      ),
    );

    loaderanimation3 = Tween<double>(begin: 0, end: 1).animate(
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
        //print(loaderanimation1.value);
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: widget.child !=null? Loader(
  radius:GFSizesClass.getGFSize(widget.size)*0.3,
  type: widget.type,
  child: widget.child,

  ):widget.type==GFLoaderType.android? Center(
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
        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: loaderanimation1.value <= 0.3
                  ? 2.5 * loaderanimation1.value
                  : (loaderanimation1.value > 0.30 && loaderanimation1.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * loaderanimation1.value),
//            opacity: (loaderanimation1.value <= 0.4 ? 2.5 * loaderanimation1.value : (loaderanimation1.value > 0.40 && loaderanimation1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * loaderanimation1.value)),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Loader(
                  radius:GFSizesClass.getGFSize(widget.size)*0.3,
                  color: widget.loaderColorOne,
                  type: widget.type,
                  icon: widget.loaderIconOne,
                  child: widget.child,
                ),
              ),
            ),
            Opacity(
              opacity: loaderanimation2.value <= 0.3
                  ? 2.5 * loaderanimation2.value
                  : (loaderanimation2.value > 0.30 && loaderanimation2.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * loaderanimation2.value),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Loader(
                  radius: GFSizesClass.getGFSize(widget.size)*0.44,
                  color: widget.loaderColorTwo,
                  type: widget.type,
                  icon: widget.loaderIconTwo,
//
                ),
              ),
            ),
            Opacity(
              opacity: loaderanimation3.value <= 0.3
                  ? 2.5 * loaderanimation3.value
                  : (loaderanimation3.value > 0.30 && loaderanimation3.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * loaderanimation3.value),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Loader(
                  radius: GFSizesClass.getGFSize(widget.size)*0.3,
                  color: widget.loaderColorThree,
                  type: widget.type,
                  icon: widget.loaderIconThree,
//

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
  const Loader({Key key, this.radius, this.color, this.type, this.icon, this.size, this.child})
      : super(key: key);

  final double radius;
  final Color color;
  final GFLoaderType type;
  final Widget icon;
  final dynamic size;
  final Widget child;


  @override
  Widget build(BuildContext context) => Center(
        child:type== GFLoaderType.custom? Container(
          child: child!=null ?child:icon??Container())
          :Container(
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

