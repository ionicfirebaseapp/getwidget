import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';

const Duration _kResizeDuration = const Duration(milliseconds: 300);

/// A widget that controls how the [Slidable] is dismissed.
///
/// The [Slidable] widget calls the [onDismissed] callback either after its size has
/// collapsed to zero (if [resizeDuration] is non-null) or immediately after
/// the slide animation (if [resizeDuration] is null). If the [Slidable] is a
/// list item, it must have a key that distinguishes it from the other items and
/// its [onDismissed] callback must remove the item from the list.
///
/// See also:
///
///  * [SlidableDrawerDismissal], which creates slide actions that are displayed like drawers
///  while the item is dismissing.
class SlidableDismissal extends StatelessWidget {
  /// Creates a widget that controls how the [Slidable] is dismissed.
  const SlidableDismissal({
    @required this.child,
    this.dismissThresholds = const <SlideActionType, double>{},
    this.onResize,
    this.onDismissed,
    this.resizeDuration = _kResizeDuration,
    this.crossAxisEndOffset = 0.0,
    this.onWillDismiss,
    this.closeOnCanceled = false,
    this.dragDismissible = true,
  }) : assert(dismissThresholds != null);

  /// Specifies if the widget can be dismissed by sliding.
  ///
  /// Setting to false makes the widget dismissible only by
  /// calling [Slidable.dismiss()].
  ///
  /// Defaults to true.
  final bool dragDismissible;

  /// The offset threshold the item has to be dragged in order to be considered
  /// dismissed.
  ///
  /// Represented as a fraction, e.g. if it is 0.4 (the default), then the item
  /// has to be dragged at least 40% towards one direction to be considered
  /// dismissed. Clients can define different thresholds for each dismiss
  /// direction.
  ///
  /// Flinging is treated as being equivalent to dragging almost to 1.0, so
  /// flinging can dismiss an item past any threshold less than 1.0.
  ///
  /// Setting a threshold of 1.0 (or greater) prevents a drag for
  //  the given [SlideActionType]
  final Map<SlideActionType, double> dismissThresholds;

  /// Called when the widget has been dismissed, after finishing resizing.
  final DismissSlideActionCallback onDismissed;

  /// Called before the widget is dismissed. If the call returns false, the
  /// item will not be dismissed.
  ///
  /// If null, the widget will always be dismissed.
  final SlideActionWillBeDismissed onWillDismiss;

  /// Specifies to close this slidable after canceling dismiss.
  ///
  /// Defaults to false.
  final bool closeOnCanceled;

  /// Called when the widget changes size (i.e., when contracting before being dismissed).
  final VoidCallback onResize;

  /// The amount of time the widget will spend contracting before [onDismissed] is called.
  ///
  /// If null, the widget will not contract and [onDismissed] will be called
  /// immediately after the widget is dismissed.
  final Duration resizeDuration;

  /// Defines the end offset across the main axis after the card is dismissed.
  ///
  /// If non-zero value is given then widget moves in cross direction depending on whether
  /// it is positive or negative.
  final double crossAxisEndOffset;

  /// The widget to show when the [Slidable] enters dismiss mode.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SlidableData data = SlidableData.of(context);

    return AnimatedBuilder(
      animation: data.overallMoveAnimation,
      child: child,
      builder: (BuildContext context, Widget child) {
        if (data.overallMoveAnimation.value > data.totalActionsExtent) {
          return child;
        } else {
          return data.slidable.actionPane;
        }
      },
    );
  }
}

/// A specific dismissal that creates slide actions that are displayed like drawers
/// while the item is dismissing.
/// The further slide action will grow faster than the other ones.
class SlidableDrawerDismissal extends StatelessWidget {
  /// Creates a specific dismissal that creates slide actions that are displayed like drawers
  /// while the item is dismissing.
  const SlidableDrawerDismissal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SlidableData data = SlidableData.of(context);

    final animation = Tween<Offset>(
      begin: Offset.zero,
      end: data.createOffset(data.actionSign),
    ).animate(data.overallMoveAnimation);

    final count = data.actionCount;

    final extentAnimations = Iterable.generate(count).map((index) {
      return Tween<double>(
        begin: data.actionExtentRatio,
        end: 1 - data.actionExtentRatio * (data.actionCount - index - 1),
      ).animate(
        CurvedAnimation(
          parent: data.overallMoveAnimation,
          curve: Interval(data.totalActionsExtent, 1.0),
        ),
      );
    }).toList();

    return Stack(
      children: <Widget>[
        AnimatedBuilder(
            animation: data.overallMoveAnimation,
            builder: (context, child) {
              return Positioned.fill(
                child: Stack(
                  children: List.generate(data.actionCount, (index) {
                    // For the main actions we have to reverse the order if we want the last item at the bottom of the stack.
                    int displayIndex =
                    data.showActions ? data.actionCount - index - 1 : index;

                    return data.createFractionallyAlignedSizedBox(
                      positionFactor: data.actionExtentRatio *
                          (data.actionCount - index - 1),
                      extentFactor: extentAnimations[index].value,
                      child: data.actionDelegate.build(context, displayIndex,
                          data.actionsMoveAnimation, data.renderingMode),
                    );
                  }),
                ),
              );
            }),
        SlideTransition(
          position: animation,
          child: data.slidable.child,
        ),
      ],
    );
  }
}