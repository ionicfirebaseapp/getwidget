import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';

/// A controller that keep tracks of the active [SlidableState] and close
/// the previous one.
class GFSlidableController {
  GFSlidableState _activeState;
  gfSlidableState get activeState => _activeState;
  set activeState(SlidableState value) {
    _activeState?.close();
    _activeState = value;
  }
}

class GFSlidable extends StatefulWidget {
  GFSlidable({
    Key key,
    @required Widget child,
    GFSlidableController controller,
  }) : this.builder(
    key: key,
    child: child,
    controller: controller,
  );

  GFSlidable.builder({
    Key key,
    @required this.child,
    this.controller,
  });

  /// widget below this widget in the tree
  final Widget child;

  /// controller that tracks active [GFSlidable] and keep only one open
  final GFSlidableController controller;

  /// The state from the closest instance of this class that encloses the given context.
  static GFSlidableState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<SlidableState>());
  }

  @override
  _GFSlidableState createState() => _GFSlidableState();
}


class _GFSlidableState extends State<GFSlidable> {

  bool _onDrag = false;


 void _onDragStart(DragStartDetails details) {
  _onDrag = true;
  widget.controller?.activeState = this;
  _dragExtent = _actionsMoveController.value *
      _actionsDragAxisExtent *
      _dragExtent.sign;
  if (_overallMoveController.isAnimating) {
    _overallMoveController.stop();
  }

  if (_actionsMoveController.isAnimating) {
    _actionsMoveController.stop();
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
        onHorizontalDragStart: _onDragStart,
  child: widget.child,
      );
}
