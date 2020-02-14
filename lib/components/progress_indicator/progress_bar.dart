import 'package:flutter/material.dart';
import 'package:getflutter/types/gf_progress_type.dart';
import 'package:getflutter/getflutter.dart';

class ProgressBarDemo extends StatefulWidget {
  const ProgressBarDemo({Key key, this.width, this.type = GFProgressType.round})
      : super(key: key);

  final GFProgressType type;
  final double width;

  @override
  _ProgressBarDemoState createState() => _ProgressBarDemoState();
}

class _ProgressBarDemoState extends State<ProgressBarDemo> {
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: widget.type == GFProgressType.linear
            ? MediaQuery.of(context).size.width
            : widget.width,
        height: widget.type == GFProgressType.round ? 50 : 20,
        decoration: BoxDecoration(
//          color: Colors.orange,
          border: Border.all(color: Colors.orange, width: 3),
//shape: BoxShape.rectangle
//        shape: widget.type == GFProgressType.round?BoxShape.circle?? widget.type==GFProgressType.square:BoxShape.rectangle
        ),
        child: const Text('75%'),
      );
}
