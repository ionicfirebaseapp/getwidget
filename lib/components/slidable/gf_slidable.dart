import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'gf_fractionally_aligned_sized_box.dart';
import 'gf_slidable_dissmissal.dart';


const double _kActionsExtentRatio = 0.25;
const double _kFastThreshold = 2500;
const double _kDismissThreshold = 0.75;
const Curve _kResizeTimeCurve = Interval(0.4, 1, curve: Curves.ease);
const Duration _kMovementDuration = Duration(milliseconds: 200);

/// The rendering mode in which the [GFSlidable] is.
enum GFSlidableRenderingMode {
  /// The [GFSlidable] is not showing actions.
  none,

  /// The [GFSlidable] is showing actions during sliding.
  slide,

  /// The [GFSlidable] is showing actions during dismissing.
  dismiss,

  /// The [GFSlidable] is resizing after dismissing.
  resize,
}

/// The type of slide action that is currently been showed by the [GFSlidable].
enum SlideActionType {
  /// The [actions] are being shown.
  primary,

  /// The [secondaryActions] are being shown.
  secondary,
}

/// Signature used by [SlideToDismissDelegate] to indicate that it has been
/// dismissed for the given [actionType].
///
/// Used by [SlideToDismissDelegate.onDismissed].
typedef void DismissSlideActionCallback(SlideActionType actionType);

/// Signature for determining whether the widget will be dismissed for the
/// given [actionType].
///
/// Used by [SlideToDismissDelegate.onWillDismiss].
typedef FutureOr<bool> SlideActionWillBeDismissed(SlideActionType actionType);

/// Signature for the builder callback used to create slide actions.
typedef Widget SlideActionBuilder(BuildContext context, int index,
    Animation<double> animation, GFSlidableRenderingMode step);

/// A delegate that supplies slide actions.
///
/// It's uncommon to subclass [SlideActionDelegate]. Instead, consider using one
/// of the existing subclasses that provide adaptors to builder callbacks or
/// explicit action lists.
///
/// See also:
///
///  * [SlideActionBuilderDelegate], which is a delegate that uses a builder
///    callback to construct the slide actions.
///  * [SlideActionListDelegate], which is a delegate that has an explicit list
///    of slidable action.
abstract class SlideActionDelegate {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const SlideActionDelegate();

  /// Returns the child with the given index.
  ///
  /// Must not return null.
  Widget build(BuildContext context, int index, Animation<double> animation,
      GFSlidableRenderingMode step);

  /// Returns the number of actions this delegate will build.
  int get actionCount;
}

/// A delegate that supplies slide actions using a builder callback.
///
/// This delegate provides slide actions using a [SlideActionBuilder] callback,
/// so that the animation can be passed down to the final widget.
///
/// See also:
///
///  * [SlideActionListDelegate], which is a delegate that has an explicit list
///    of slide action.
class SlideActionBuilderDelegate extends SlideActionDelegate {
  /// Creates a delegate that supplies slide actions using the given
  /// builder callback.
  ///
  /// The [builder] must not be null. The [actionCount] argument must not be positive.
  const SlideActionBuilderDelegate({
    @required this.builder,
    @required this.actionCount,
  }) : assert(actionCount != null && actionCount >= 0);

  /// Called to build slide actions.
  ///
  /// Will be called only for indices greater than or equal to zero and less
  /// than [childCount].
  final SlideActionBuilder builder;

  /// The total number of slide actions this delegate can provide.
  final int actionCount;

  @override
  Widget build(BuildContext context, int index, Animation<double> animation,
          GFSlidableRenderingMode step) =>
      builder(context, index, animation, step);
}

/// A delegate that supplies slide actions using an explicit list.
///
/// This delegate provides slide actions using an explicit list,
/// which is convenient but reduces the benefit of passing the animation down
/// to the final widget.
///
/// See also:
///
///  * [SlideActionBuilderDelegate], which is a delegate that uses a builder
///    callback to construct the slide actions.
class SlideActionListDelegate extends SlideActionDelegate {
  /// Creates a delegate that supplies slide actions using the given
  /// list.
  ///
  /// The [actions] argument must not be null.
  const SlideActionListDelegate({
    @required this.actions,
  });

  /// The slide actions.
  final List<Widget> actions;

  /// The number of actions.
  @override
  int get actionCount => actions?.length ?? 0;

  @override
  Widget build(BuildContext context, int index, Animation<double> animation,
          GFSlidableRenderingMode step) =>
      actions[index];
}

class _GFSlidableScope extends InheritedWidget {
  _GFSlidableScope({
    Key key,
    @required this.state,
    @required Widget child,
  }) : super(key: key, child: child);

  final GFSlidableState state;

  @override
  bool updateShouldNotify(_GFSlidableScope oldWidget) => oldWidget.state != state;
}

/// The data used by a [GFSlidable].
class GFSlidableData extends InheritedWidget {
  GFSlidableData({
    Key key,
    @required this.actionType,
    @required this.renderingMode,
    @required this.totalActionsExtent,
    @required this.dismissThreshold,
    @required this.dismissible,
    @required this.actionDelegate,
    @required this.overallMoveAnimation,
    @required this.actionsMoveAnimation,
    @required this.dismissAnimation,
    @required this.slidable,
    @required this.actionExtentRatio,
    @required this.direction,
    @required Widget child,
  }) : super(key: key, child: child);

  /// The type of slide action that is currently been showed by the [GFSlidable].
  final SlideActionType actionType;

  /// The rendering mode in which the [GFSlidable] is.
  final GFSlidableRenderingMode renderingMode;

  /// The total extent of all the actions
  final double totalActionsExtent;

  /// The offset threshold the item has to be dragged in order to be considered
  /// dismissed.
  final double dismissThreshold;

  /// Indicates whether the [GFSlidable] can be dismissed.
  final bool dismissible;

  /// The current actions that have to be shown.
  final SlideActionDelegate actionDelegate;

  /// Animation for the whole movement.
  final Animation<double> overallMoveAnimation;

  /// Animation for the actions.
  final Animation<double> actionsMoveAnimation;

  /// Dismiss animation.
  final Animation<double> dismissAnimation;

  /// The slidable.
  final GFSlidable slidable;

  /// Relative ratio between one slide action and the extent of the child.
  final double actionExtentRatio;

  /// The direction in which this widget can be slid.
  final Axis direction;

  /// Indicates whether the primary actions are currently shown.
  bool get showActions => actionType == SlideActionType.primary;

  /// The number of actions.
  int get actionCount => actionDelegate?.actionCount ?? 0;

  /// If the [actionType] is [SlideActionType.primary] returns 1, -1 otherwise.
  double get actionSign => actionType == SlideActionType.primary ? 1.0 : -1.0;

  /// Indicates wheter the direction is horizontal.
  bool get directionIsXAxis => direction == Axis.horizontal;

  /// The alignment of the actions.
  Alignment get alignment => Alignment(
        directionIsXAxis ? -actionSign : 0.0,
        directionIsXAxis ? 0.0 : -actionSign,
      );

  /// If the [direction] is horizontal, returns the [totalActionsExtent]
  /// otherwise null.
  double get actionPaneWidthFactor =>
      directionIsXAxis ? totalActionsExtent : null;

  /// If the [direction] is vertical, returns the [totalActionsExtent]
  /// otherwise null.
  double get actionPaneHeightFactor =>
      directionIsXAxis ? null : totalActionsExtent;

  /// The data from the closest instance of this class that encloses the given context.
  static GFSlidableData of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(GFSlidableData);
  }

  /// Gets the the given offset related to the current direction.
  Offset createOffset(double value) {
    return directionIsXAxis ? Offset(value, 0.0) : Offset(0.0, value);
  }

  /// Gets the maximum extent in the current direction.
  double getMaxExtent(BoxConstraints constraints) {
    return directionIsXAxis ? constraints.maxWidth : constraints.maxHeight;
  }

  /// Creates a positioned related to the current direction and showed actions.
  Positioned createPositioned({
    Widget child,
    double extent,
    double position,
  }) {
    return Positioned(
      left: directionIsXAxis ? (showActions ? position : null) : 0.0,
      right: directionIsXAxis ? (showActions ? null : position) : 0.0,
      top: directionIsXAxis ? 0.0 : (showActions ? position : null),
      bottom: directionIsXAxis ? 0.0 : (showActions ? null : position),
      width: directionIsXAxis ? extent : null,
      height: directionIsXAxis ? null : extent,
      child: child,
    );
  }

  /// Creates a [FractionallyAlignedSizedBox] related to the current direction and showed actions.
  FractionallyAlignedSizedBox createFractionallyAlignedSizedBox({
    Widget child,
    double extentFactor,
    double positionFactor,
  }) {
    return FractionallyAlignedSizedBox(
      leftFactor:
          directionIsXAxis ? (showActions ? positionFactor : null) : 0.0,
      rightFactor:
          directionIsXAxis ? (showActions ? null : positionFactor) : 0.0,
      topFactor: directionIsXAxis ? 0.0 : (showActions ? positionFactor : null),
      bottomFactor:
          directionIsXAxis ? 0.0 : (showActions ? null : positionFactor),
      widthFactor: directionIsXAxis ? extentFactor : null,
      heightFactor: directionIsXAxis ? null : extentFactor,
      child: child,
    );
  }

  /// Builds the slide actions using the active [SlideActionDelegate]'s builder.
  List<Widget> buildActions(BuildContext context) {
    return List.generate(
      actionCount,
      (int index) => actionDelegate.build(
        context,
        index,
        actionsMoveAnimation,
        GFSlidableRenderingMode.slide,
      ),
    );
  }

  /// Whether the framework should notify widgets that inherit from this widget.
  @override
  bool updateShouldNotify(GFSlidableData oldWidget) =>
      (oldWidget.actionType != actionType) ||
      (oldWidget.renderingMode != renderingMode) ||
      (oldWidget.totalActionsExtent != totalActionsExtent) ||
      (oldWidget.dismissThreshold != dismissThreshold) ||
      (oldWidget.dismissible != dismissible) ||
      (oldWidget.actionDelegate != actionDelegate) ||
      (oldWidget.overallMoveAnimation != overallMoveAnimation) ||
      (oldWidget.actionsMoveAnimation != actionsMoveAnimation) ||
      (oldWidget.dismissAnimation != dismissAnimation) ||
      (oldWidget.slidable != slidable) ||
      (oldWidget.actionExtentRatio != actionExtentRatio) ||
      (oldWidget.direction != direction);
}

/// A controller that keep tracks of the active [GFSlidableState] and close
/// the previous one.
class GFSlidableController {
  /// Creates a controller that keep tracks of the active [GFSlidableState] and close
  /// the previous one.
  GFSlidableController({
    this.onSlideAnimationChanged,
    this.onSlideIsOpenChanged,
  });

  /// Function called when the animation changed.
  final ValueChanged<Animation<double>> onSlideAnimationChanged;

  /// Function called when the [GFSlidable] open status changed.
  final ValueChanged<bool> onSlideIsOpenChanged;

  bool _isSlideOpen;

  Animation<double> _slideAnimation;

  GFSlidableState _activeState;

  /// The state of the active [GFSlidable].
  GFSlidableState get activeState => _activeState;

  /// Changes the state of the active [GFSlidable].
  set activeState(GFSlidableState value) {
    _activeState?._flingAnimationController();

    _activeState = value;
    if (onSlideAnimationChanged != null) {
      _slideAnimation?.removeListener(_handleSlideIsOpenChanged);
      if (onSlideIsOpenChanged != null) {
        _slideAnimation = value?.overallMoveAnimation;
        _slideAnimation?.addListener(_handleSlideIsOpenChanged);
        if (_slideAnimation == null) {
          _isSlideOpen = false;
          onSlideIsOpenChanged(_isSlideOpen);
        }
      }
      onSlideAnimationChanged(value?.overallMoveAnimation);
    }
  }

  void _handleSlideIsOpenChanged() {
    if (onSlideIsOpenChanged != null && _slideAnimation != null) {
      final bool isOpen = _slideAnimation.value != 0.0;
      if (isOpen != _isSlideOpen) {
        _isSlideOpen = isOpen;
        onSlideIsOpenChanged(_isSlideOpen);
      }
    }
  }
}

/// A widget that can be slid in both direction of the specified axis.
///
/// If the direction is [Axis.horizontal], this widget can be slid to the left or to the right,
/// otherwise this widget can be slid up or slid down.
///
/// By sliding in one of these direction, slide actions will appear.
class GFSlidable extends StatefulWidget {
  /// Creates a widget that can be slid.
  ///
  /// The [actions] contains the slide actions that appears when the child has been dragged down or to the right.
  /// The [secondaryActions] contains the slide actions that appears when the child has been dragged up or to the left.
  ///
  /// The [delegate] and [closeOnScroll] arguments must not be null. The [actionExtentRatio]
  /// and [showAllActionsThreshold] arguments must be greater or equal than 0 and less or equal than 1.
  ///
  /// The [key] argument must not be null if the `slideToDismissDelegate`
  /// is provided because [GFSlidable]s are commonly
  /// used in lists and removed from the list when dismissed. Without keys, the
  /// default behavior is to sync widgets based on their index in the list,
  /// which means the item after the dismissed item would be synced with the
  /// state of the dismissed item. Using keys causes the widgets to sync
  /// according to their keys and avoids this pitfall.
  GFSlidable({
    Key key,
    @required Widget child,
    @required Widget actionPane,
    List<Widget> actions,
    List<Widget> secondaryActions,
    double showAllActionsThreshold = 0.5,
    double actionExtentRatio = _kActionsExtentRatio,
    Duration movementDuration = _kMovementDuration,
    Axis direction = Axis.horizontal,
    bool closeOnScroll = true,
    bool enabled = true,
//    GFSlidableDismissal dismissal,
    GFSlidableController controller,
    double fastThreshold,
  }) : this.builder(
          key: key,
          child: child,
          actionPane: actionPane,
          actionDelegate: SlideActionListDelegate(actions: actions),
          secondaryActionDelegate:
              SlideActionListDelegate(actions: secondaryActions),
          showAllActionsThreshold: showAllActionsThreshold,
          actionExtentRatio: actionExtentRatio,
          movementDuration: movementDuration,
          direction: direction,
          closeOnScroll: closeOnScroll,
          enabled: enabled,
//          dismissal: dismissal,
          controller: controller,
          fastThreshold: fastThreshold,
        );

  /// Creates a widget that can be slid.
  ///
  /// The [actionDelegate] is a delegate that builds the slide actions that appears when the child has been dragged down or to the right.
  /// The [secondaryActionDelegate] is a delegate that builds the slide actions that appears when the child has been dragged up or to the left.
  ///
  /// The [delegate], [closeOnScroll] and [enabled] arguments must not be null. The [actionExtentRatio]
  /// and [showAllActionsThreshold] arguments must be greater or equal than 0 and less or equal than 1.
  ///
  /// The [key] argument must not be null if the `slideToDismissDelegate`
  /// is provided because [GFSlidable]s are commonly
  /// used in lists and removed from the list when dismissed. Without keys, the
  /// default behavior is to sync widgets based on their index in the list,
  /// which means the item after the dismissed item would be synced with the
  /// state of the dismissed item. Using keys causes the widgets to sync
  /// according to their keys and avoids this pitfall.
  GFSlidable.builder({
    Key key,
    @required this.child,
    @required this.actionPane,
    this.actionDelegate,
    this.secondaryActionDelegate,
    this.showAllActionsThreshold = 0.5,
    this.actionExtentRatio = _kActionsExtentRatio,
    this.movementDuration = _kMovementDuration,
    this.direction = Axis.horizontal,
    this.closeOnScroll = true,
    this.enabled = true,
//    this.dismissal,
    this.controller,
    double fastThreshold,
  })  :
//        assert(actionPane != null),
//        assert(direction != null),
        assert(
            showAllActionsThreshold != null &&
                showAllActionsThreshold >= .0 &&
                showAllActionsThreshold <= 1.0,
            'showAllActionsThreshold must be between 0.0 and 1.0'),
        assert(
            actionExtentRatio != null &&
                actionExtentRatio >= .0 &&
                actionExtentRatio <= 1.0,
            'actionExtentRatio must be between 0.0 and 1.0'),
        assert(closeOnScroll != null),
        assert(enabled != null),
//        assert(dismissal == null || key != null,
//            'a key must be provided if slideToDismissDelegate is set'),
        assert(fastThreshold == null || fastThreshold >= .0,
            'fastThreshold must be positive'),
        fastThreshold = fastThreshold ?? _kFastThreshold,
        super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The controller that tracks the active [GFSlidable] and keep only one open.
  final GFSlidableController controller;

  /// A delegate that builds slide actions that appears when the child has been dragged
  /// down or to the right.
  final SlideActionDelegate actionDelegate;

  /// A delegate that builds slide actions that appears when the child has been dragged
  /// up or to the left.
  final SlideActionDelegate secondaryActionDelegate;

  /// The action pane that controls how the slide actions are animated;
  final Widget actionPane;

  /// A delegate that controls how to dismiss the item.
//  final GFSlidableDismissal dismissal;

  /// Relative ratio between one slide action and the extent of the child.
  final double actionExtentRatio;

  /// The direction in which this widget can be slid.
  final Axis direction;

  /// The offset threshold the item has to be dragged in order to show all actions
  /// in the slide direction.
  ///
  /// Represented as a fraction, e.g. if it is 0.4 (the default), then the item
  /// has to be dragged at least 40% of the slide actions extent towards one direction to show all actions.
  final double showAllActionsThreshold;

  /// Defines the duration for card to go to final position or to come back to original position if threshold not reached.
  final Duration movementDuration;

  /// Specifies to close this slidable after the closest [Scrollable]'s position changed.
  ///
  /// Defaults to true.
  final bool closeOnScroll;

  /// Whether this slidable is interactive.
  ///
  /// If false, the child will not slid to show slide actions.
  ///
  /// Defaults to true.
  final bool enabled;

  /// The threshold used to know if a movement was fast and request to open/close the actions.
  final double fastThreshold;

  /// The state from the closest instance of this class that encloses the given context.
  static GFSlidableState of(BuildContext context) {
    final _GFSlidableScope scope =
        context.inheritFromWidgetOfExactType(_GFSlidableScope);
    return scope?.state;
  }

  @override
  GFSlidableState createState() => GFSlidableState();
}

/// The state of [GFSlidable] widget.
/// You can open or close the [GFSlidable] by calling the corresponding methods of
/// this object.
class GFSlidableState extends State<GFSlidable>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<GFSlidable> {
  @override
  void initState() {
    super.initState();
//    _overallMoveController =
//        AnimationController(duration: widget.movementDuration, vsync: this)
//          ..addStatusListener(_handleDismissStatusChanged)
//          ..addListener(_handleOverallPositionChanged);
    _initAnimations();
  }

  void _initAnimations() {
    _actionsMoveAnimation
        ?.removeStatusListener(_handleShowAllActionsStatusChanged);
    _dismissAnimation?.removeStatusListener(_handleShowAllActionsStatusChanged);

    _actionsMoveAnimation = CurvedAnimation(
      parent: _overallMoveController,
      curve: Interval(0.0, _totalActionsExtent),
    )..addStatusListener(_handleShowAllActionsStatusChanged);
    _dismissAnimation = CurvedAnimation(
      parent: _overallMoveController,
      curve: Interval(_totalActionsExtent, 1.0),
    )..addStatusListener(_handleShowAllActionsStatusChanged);
  }

  AnimationController _overallMoveController;
  Animation<double> get overallMoveAnimation => _overallMoveController.view;

  Animation<double> _actionsMoveAnimation;
  Animation<double> _dismissAnimation;

  AnimationController _resizeController;
  Animation<double> _resizeAnimation;

  double _dragExtent = 0.0;

  GFSlidableRenderingMode _renderingMode = GFSlidableRenderingMode.none;
  GFSlidableRenderingMode get renderingMode => _renderingMode;

  ScrollPosition _scrollPosition;
  bool _dragUnderway = false;
  Size _sizePriorToCollapse;
  bool _dismissing = false;

  SlideActionType _actionType = SlideActionType.primary;
  SlideActionType get actionType => _actionType;
  set actionType(SlideActionType value) {
    _actionType = value;
    _initAnimations();
  }

  int get _actionCount => _actionDelegate?.actionCount ?? 0;

  double get _totalActionsExtent => widget.actionExtentRatio * (_actionCount);

//  double get _dismissThreshold {
//    if (widget.dismissal == null)
//      return _kDismissThreshold;
//    else
//      return widget.dismissal.dismissThresholds[actionType] ??
//          _kDismissThreshold;
//  }

//  bool get _dismissible => widget.dismissal != null && _dismissThreshold < 1.0;

  @override
  bool get wantKeepAlive =>
      !widget.closeOnScroll &&
      (_overallMoveController?.isAnimating == true ||
          _resizeController?.isAnimating == true);

  /// The current actions that have to be shown.
  SlideActionDelegate get _actionDelegate =>
      actionType == SlideActionType.primary
          ? widget.actionDelegate
          : widget.secondaryActionDelegate;

  bool get _directionIsXAxis => widget.direction == Axis.horizontal;

  double get _overallDragAxisExtent {
    final Size size = context.size;
    return _directionIsXAxis ? size.width : size.height;
  }

  double get _actionsDragAxisExtent {
    return _overallDragAxisExtent * _totalActionsExtent;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeScrollingNotifierListener();
    _addScrollingNotifierListener();
  }

  @override
  void didUpdateWidget(GFSlidable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.closeOnScroll != oldWidget.closeOnScroll) {
      _removeScrollingNotifierListener();
      _addScrollingNotifierListener();
    }
  }

  void _addScrollingNotifierListener() {
    if (widget.closeOnScroll) {
      _scrollPosition = Scrollable.of(context)?.position;
      if (_scrollPosition != null)
        _scrollPosition.isScrollingNotifier.addListener(_isScrollingListener);
    }
  }

  void _removeScrollingNotifierListener() {
    if (_scrollPosition != null) {
      _scrollPosition.isScrollingNotifier.removeListener(_isScrollingListener);
    }
  }

  @override
  void dispose() {
    _overallMoveController.dispose();
    _resizeController?.dispose();
    _removeScrollingNotifierListener();
    widget.controller?._activeState = null;
    super.dispose();
  }

  /// Opens the [GFSlidable].
  /// By default it's open the [SlideActionType.primary] action pane, but you
  /// can modify this by setting [actionType].
  void open({SlideActionType actionType}) {
    widget.controller?.activeState = this;

    if (actionType != null && _actionType != actionType) {
      setState(() {
        this.actionType = actionType;
      });
    }
    if (_actionCount > 0) {
      _overallMoveController.animateTo(
        _totalActionsExtent,
        curve: Curves.easeIn,
        duration: widget.movementDuration,
      );
    }
  }

  /// Closes this [GFSlidable].
  void close() {
    if (!_overallMoveController.isDismissed) {
      if (widget.controller?.activeState == this) {
        widget.controller?.activeState = null;
      } else {
        _flingAnimationController();
      }
    }
  }

  void _flingAnimationController() {
    if (!_dismissing) {
      _overallMoveController.fling(velocity: -1.0);
    }
  }

  /// Dismisses this [GFSlidable].
  /// By default it's dismiss by showing the [SlideActionType.primary] action pane, but you
  /// can modify this by setting [actionType].
//  void dismiss({SlideActionType actionType}) {
//    if (_dismissible) {
//      _dismissing = true;
//      actionType ??= _actionType;
//      if (actionType != _actionType) {
//        setState(() {
//          this.actionType = actionType;
//        });
//      }
//
//      _overallMoveController.fling(velocity: 1.0);
//    }
//  }

  void _isScrollingListener() {
    if (!widget.closeOnScroll || _scrollPosition == null) return;

    // When a scroll starts close this.
    if (_scrollPosition.isScrollingNotifier.value) {
      close();
    }
  }

  void _handleDragStart(DragStartDetails details) {
    _dragUnderway = true;
    widget.controller?.activeState = this;
    _dragExtent =
        _actionsMoveAnimation.value * _actionsDragAxisExtent * _dragExtent.sign;
    if (_overallMoveController.isAnimating) {
      _overallMoveController.stop();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (widget.controller != null && widget.controller.activeState != this) {
      return;
    }

//    final double delta = details.primaryDelta;
//    _dragExtent += delta;
//    setState(() {
//      actionType = _dragExtent.sign >= 0
//          ? SlideActionType.primary
//          : SlideActionType.secondary;
//      if (_actionCount > 0) {
//        if (_dismissible && !widget.dismissal.dragDismissible) {
//          // If the widget is not dismissible by dragging, clamp drag result
//          // so the widget doesn't slide past [_totalActionsExtent].
//          _overallMoveController.value =
//              (_dragExtent.abs() / _overallDragAxisExtent)
//                  .clamp(0.0, _totalActionsExtent);
//        } else {
//          _overallMoveController.value =
//              _dragExtent.abs() / _overallDragAxisExtent;
//        }
//      }
//    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (widget.controller != null && widget.controller.activeState != this) {
      return;
    }

    _dragUnderway = false;
    final double velocity = details.primaryVelocity;
    final bool shouldOpen = velocity.sign == _dragExtent.sign;
    final bool fast = velocity.abs() > widget.fastThreshold;

//    if (_dismissible && overallMoveAnimation.value > _totalActionsExtent) {
//      // We are in a dismiss state.
//      if (overallMoveAnimation.value >= _dismissThreshold) {
//        dismiss();
//      } else {
//        open();
//      }
//    } else if (_actionsMoveAnimation.value >= widget.showAllActionsThreshold ||
//        (shouldOpen && fast)) {
//      open();
//    } else {
//      close();
//    }
  }

  void _handleShowAllActionsStatusChanged(AnimationStatus status) {
    // Make sure to rebuild a last time, otherwise the slide action could
    // be scrambled.
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() {});
    }

    updateKeepAlive();
  }

  void _handleOverallPositionChanged() {
    final double value = _overallMoveController.value;
    if (value == _overallMoveController.lowerBound) {
      _renderingMode = GFSlidableRenderingMode.none;
    } else if (value <= _totalActionsExtent) {
      _renderingMode = GFSlidableRenderingMode.slide;
    } else {
      _renderingMode = GFSlidableRenderingMode.dismiss;
    }

    setState(() {});
  }

//  void _handleDismissStatusChanged(AnimationStatus status) async {
//    if (_dismissible) {
//      if (status == AnimationStatus.completed &&
//          _overallMoveController.value == _overallMoveController.upperBound &&
//          !_dragUnderway) {
//        if (widget.dismissal.onWillDismiss == null ||
//            await widget.dismissal.onWillDismiss(actionType)) {
//          _startResizeAnimation();
//        } else {
//          _dismissing = false;
//          if (widget.dismissal?.closeOnCanceled == true) {
//            close();
//          } else {
//            open();
//          }
//        }
//      }
//      updateKeepAlive();
//    }
//  }

//  void _handleDismiss() {
//    widget.controller?.activeState = null;
//    final GFSlidableDismissal dismissal = widget.dismissal;
//    if (dismissal.onDismissed != null) {
//      assert(actionType != null);
//      dismissal.onDismissed(actionType);
//    }
//  }

//  void _startResizeAnimation() {
//    assert(_overallMoveController != null);
//    assert(_overallMoveController.isCompleted);
//    assert(_resizeController == null);
//    assert(_sizePriorToCollapse == null);
//    final GFSlidableDismissal dismissal = widget.dismissal;
//    if (dismissal.resizeDuration == null) {
//      _handleDismiss();
//    } else {
//      _resizeController =
//          AnimationController(duration: dismissal.resizeDuration, vsync: this)
//            ..addListener(_handleResizeProgressChanged)
//            ..addStatusListener((AnimationStatus status) => updateKeepAlive());
//      _resizeController.forward();
//      setState(() {
//        _renderingMode = GFSlidableRenderingMode.resize;
//        _sizePriorToCollapse = context.size;
//        _resizeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
//            CurvedAnimation(
//                parent: _resizeController, curve: _kResizeTimeCurve));
//      });
//    }
//  }

//  void _handleResizeProgressChanged() {
//    if (_resizeController.isCompleted) {
//      _handleDismiss();
//    } else {
//      widget.dismissal.onResize?.call();
//    }
//  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.

    Widget content = widget.child;

    if (!(!widget.enabled ||
        ((widget.actionDelegate == null ||
                widget.actionDelegate.actionCount == 0) &&
            (widget.secondaryActionDelegate == null ||
                widget.secondaryActionDelegate.actionCount == 0)))) {
      if (actionType == SlideActionType.primary &&
              widget.actionDelegate != null &&
              widget.actionDelegate.actionCount > 0 ||
          actionType == SlideActionType.secondary &&
              widget.secondaryActionDelegate != null &&
              widget.secondaryActionDelegate.actionCount > 0) {
//        if (_dismissible) {
//          content = widget.dismissal;
//
//          if (_resizeAnimation != null) {
//            // we've been dragged aside, and are now resizing.
//            assert(() {
//              if (_resizeAnimation.status != AnimationStatus.forward) {
//                assert(_resizeAnimation.status == AnimationStatus.completed);
//                throw FlutterError(
//                    'A dismissed GFSlidable widget is still part of the tree.\n'
//                    'Make sure to implement the onDismissed handler and to immediately remove the GFSlidable\n'
//                    'widget from the application once that handler has fired.');
//              }
//              return true;
//            }());
//
//            content = SizeTransition(
//              sizeFactor: _resizeAnimation,
//              axis: _directionIsXAxis ? Axis.vertical : Axis.horizontal,
//              child: SizedBox(
//                width: _sizePriorToCollapse.width,
//                height: _sizePriorToCollapse.height,
//                child: content,
//              ),
//            );
//          }
//        } else {
//          content = widget.actionPane;
//        }
      }

      content = GestureDetector(
        onHorizontalDragStart: _directionIsXAxis ? _handleDragStart : null,
        onHorizontalDragUpdate: _directionIsXAxis ? _handleDragUpdate : null,
        onHorizontalDragEnd: _directionIsXAxis ? _handleDragEnd : null,
        onVerticalDragStart: _directionIsXAxis ? null : _handleDragStart,
        onVerticalDragUpdate: _directionIsXAxis ? null : _handleDragUpdate,
        onVerticalDragEnd: _directionIsXAxis ? null : _handleDragEnd,
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return _GFSlidableScope(
      state: this,
      child: GFSlidableData(
        actionType: actionType,
        renderingMode: _renderingMode,
        totalActionsExtent: _totalActionsExtent,
//        dismissThreshold: _dismissThreshold,
//        dismissible: _dismissible,
        actionDelegate: _actionDelegate,
        overallMoveAnimation: overallMoveAnimation,
        actionsMoveAnimation: _actionsMoveAnimation,
        dismissAnimation: _dismissAnimation,
        slidable: widget,
        actionExtentRatio: widget.actionExtentRatio,
        direction: widget.direction,
        child: content,
      ),
    );
  }
}
