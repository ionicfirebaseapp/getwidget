import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';

class GFSlidable extends StatefulWidget {
  const GFSlidable({
    this.child,
  });

  /// defines main widget
  final Widget child;

  @override
  _GFSlidableState createState() => _GFSlidableState();
}

class _GFSlidableState extends State<GFSlidable> {

bool showAction = false;
  
  void _onDragStart(DragEndDetails details) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == 1) {
       setState(() {
         showAction = true;
       });
    }
  }
  
  Widget action = Row(
    children: <Widget>[
      GFIconButton(icon: Icon(Icons.favorite), onPressed: null)
    ],
  );

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) => _onDragStart(details),
  child: !showAction ?  widget.child : action,
      );
}
