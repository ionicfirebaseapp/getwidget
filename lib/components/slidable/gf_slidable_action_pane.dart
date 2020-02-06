import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';

class _SlidableStackActionPane extends StatelessWidget {
  _SlidableStackActionPane({
    Key key,
    @required this.data,
    @required this.child,
  })  : _animation = Tween<Offset>(
    begin: Offset.zero,
    end: data.createOffset(data.totalActionsExtent * data.actionSign),
  ).animate(data.actionsMoveAnimation),
        super(key: key);

  final Widget child;
  final SlidableData data;
  final Animation<Offset> _animation;

  @override
  Widget build(BuildContext context) {
    if (data.actionsMoveAnimation.isDismissed) {
      return data.slidable.child;
    }

    return Stack(
      children: <Widget>[
        child,
        SlideTransition(
          position: _animation,
          child: data.slidable.child,
        ),
      ],
    );
  }
}

/// An action pane that creates actions which stretch while the item is sliding.
class SlidableStrechActionPane extends StatelessWidget {
  const SlidableStrechActionPane({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SlidableData data = SlidableData.of(context);

    final animation = Tween<double>(
      begin: 0.0,
      end: data.totalActionsExtent,
    ).animate(data.actionsMoveAnimation);

    return _SlidableStackActionPane(
      data: data,
      child: Positioned.fill(
        child: AnimatedBuilder(
          animation: data.actionsMoveAnimation,
          builder: (context, child) {
            return FractionallySizedBox(
              alignment: data.alignment,
              widthFactor: data.directionIsXAxis ? animation.value : null,
              heightFactor: data.directionIsXAxis ? null : animation.value,
              child: Flex(
                direction: data.direction,
                children: data
                    .buildActions(context)
                    .map((a) => Expanded(child: a))
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// An action pane that creates actions which stay behind the item while it's sliding.
class SlidableBehindActionPane extends StatelessWidget {
  const SlidableBehindActionPane({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SlidableData data = SlidableData.of(context);

    return _SlidableStackActionPane(
      data: data,
      child: Positioned.fill(
        child: FractionallySizedBox(
          alignment: data.alignment,
          widthFactor: data.actionPaneWidthFactor,
          heightFactor: data.actionPaneHeightFactor,
          child: Flex(
            direction: data.direction,
            children: data
                .buildActions(context)
                .map((a) => Expanded(child: a))
                .toList(),
          ),
        ),
      ),
    );
  }
}

/// An action pane that creates actions which follow the item while it's sliding.
class SlidableScrollActionPane extends StatelessWidget {
  /// Creates an action pane that creates actions which follow the item while it's sliding.
  const SlidableScrollActionPane({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SlidableData data = SlidableData.of(context);

    final alignment = data.alignment;
    final animation = Tween<Offset>(
      begin: Offset(alignment.x, alignment.y),
      end: Offset.zero,
    ).animate(data.actionsMoveAnimation);

    return _SlidableStackActionPane(
      data: data,
      child: Positioned.fill(
        child: FractionallySizedBox(
          alignment: data.alignment,
          widthFactor: data.actionPaneWidthFactor,
          heightFactor: data.actionPaneHeightFactor,
          child: SlideTransition(
            position: animation,
            child: Flex(
              direction: data.direction,
              children: data
                  .buildActions(context)
                  .map((a) => Expanded(child: a))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

/// An action pane that creates actions which animate like drawers while the item is sliding.
class SlidableDrawerActionPane extends StatelessWidget {
  /// Creates an action pane that creates actions which animate like drawers while the item is sliding.
  const SlidableDrawerActionPane({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SlidableData data = SlidableData.of(context);

    final alignment = data.alignment;
    final startOffset = Offset(alignment.x, alignment.y);
    final animations = Iterable.generate(data.actionCount).map((index) {
      return Tween<Offset>(
        begin: startOffset,
        end: startOffset * (index - data.actionCount + 1.0),
      ).animate(data.actionsMoveAnimation);
    }).toList();

    return _SlidableStackActionPane(
      data: data,
      child: Positioned.fill(
        child: Stack(
          alignment: data.alignment,
          children: List.generate(
            data.actionCount,
                (index) {
              int displayIndex =
              data.showActions ? data.actionCount - index - 1 : index;
              return SlideTransition(
                position: animations[index],
                child: FractionallySizedBox(
                  alignment: data.alignment,
                  widthFactor:
                  data.directionIsXAxis ? data.actionExtentRatio : null,
                  heightFactor:
                  data.directionIsXAxis ? null : data.actionExtentRatio,
                  child: data.actionDelegate.build(
                    context,
                    displayIndex,
                    data.actionsMoveAnimation,
                    SlidableRenderingMode.slide,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}