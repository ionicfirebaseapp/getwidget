import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExpandableBottomSheet extends StatefulWidget {
  /// [expandableContent] is the widget which you can hide and show by dragging.
  /// It has to be a widget with a constant height. It is required for the [ExpandableBottomSheet].
  final Widget expandableContent;

  /// [background] is the widget behind the [expandableContent] which holds
  /// usually the content of your page. It is required for the [ExpandableBottomSheet].
  final Widget background;

  /// [persistentHeader] is a Widget which is on top of the [expandableContent]
  /// and will never be hidden. It is made for a widget which indicates the
  /// user he can expand the content by dragging.
  final Widget persistentHeader;

  /// [persistentFooter] is a widget which is always shown at the bottom. The [expandableContent]
  /// is if it is expanded on top of it so you don't need margin to see all of
  /// your content. You can use it for example for navigation or a menu.
  final Widget persistentFooter;

  /// [persistentContentHeight] is the height of the content which will never
  /// been contracted. It only relates to [expandableContent]. [persistentHeader]
  /// and [persistentFooter] will not be affected by this.
  final double persistentContentHeight;

  /// [animationDurationExtend] is the duration for the animation if you stop
  /// dragging with high speed.
  final Duration animationDurationExtend;

  /// [animationDurationContract] is the duration for the animation to bottom
  /// if you stop dragging with high speed. If it is `null` [animationDurationExtend] will be used.
  final Duration animationDurationContract;

  /// [animationCurveExpand] is the curve of the animation for expanding
  /// the [expandableContent] if the drag ended with high speed.
  final Curve animationCurveExpand;

  /// [animationCurveContract] is the curve of the animation for contracting
  /// the [expandableContent] if the drag ended with high speed.
  final Curve animationCurveContract;

  /// [onIsExtendedCallback] will be executed if the extend reaches its maximum.
  final Function() onIsExtendedCallback;

  /// [onIsContractedCallback] will be executed if the extend reaches its minimum.
  final Function() onIsContractedCallback;

  /// Creates the [ExpandableBottomSheet].
  ///
  /// [persistentContentHeight] has to be greater 0.
  const ExpandableBottomSheet({
    Key key,
    @required this.expandableContent,
    @required this.background,
    this.persistentHeader,
    this.persistentFooter,
    this.persistentContentHeight = 0.0,
    this.animationCurveExpand = Curves.ease,
    this.animationCurveContract = Curves.ease,
    this.animationDurationExtend = const Duration(milliseconds: 250),
    this.animationDurationContract = const Duration(milliseconds: 250),
    this.onIsExtendedCallback,
    this.onIsContractedCallback,
  })  : assert(expandableContent != null),
        assert(background != null),
        assert(persistentContentHeight != null && persistentContentHeight >= 0),
        assert(animationCurveExpand != null),
        assert(animationCurveContract != null),
        assert(animationDurationExtend != null),
        assert(animationDurationContract != null),
        super(key: key);

  @override
  ExpandableBottomSheetState createState() => ExpandableBottomSheetState();
}

class ExpandableBottomSheetState extends State<ExpandableBottomSheet>
    with TickerProviderStateMixin {
  GlobalKey _contentKey = new GlobalKey(debugLabel: 'contentKey');
  GlobalKey _headerKey = new GlobalKey(debugLabel: 'headerKey');
  GlobalKey _footerKey = new GlobalKey(debugLabel: 'footerKey');

  AnimationController _controller;
  double _draggableHeight = 0;
  double _positionOffset;
  double _startOffsetAtDragDown = 0;
  double _startPositionAtDragDown = 0;
  double _minOffset = 0;
  double _maxOffset = 0;
  double _animationMinOffset = 0;
  AnimationStatus _oldStatus = AnimationStatus.dismissed;
  bool _useDrag = true;
  bool _callCallbacks = false;

  /// Expands the content of the widget.
  void expand() {
    _afterUpdateWidgetBuild(false);
    _callCallbacks = true;
    _animateToTop();
  }

  /// Contracts the content of the widget.
  void contract() {
    _afterUpdateWidgetBuild(false);
    _callCallbacks = true;
    _animateToBottom();
  }

  /// The status of the expansion.
  ExpansionStatus get expansionStatus {
    if (_positionOffset == null) return ExpansionStatus.contracted;
    if (_positionOffset == _maxOffset) return ExpansionStatus.contracted;
    if (_positionOffset == _minOffset) return ExpansionStatus.expanded;
    return ExpansionStatus.middle;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _controller.addStatusListener(_handleAnimationStatusUpdate);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _afterUpdateWidgetBuild(true));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _afterUpdateWidgetBuild(false));
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: widget.background,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, Widget child) {
                  if (_controller.isAnimating) {
                    _positionOffset = _animationMinOffset +
                        _controller.value * _draggableHeight;
                  }
                  return Positioned(
                    top: _positionOffset,
                    right: 0.0,
                    left: 0.0,
                    child: child,
                  );
                },
                child: GestureDetector(
                  onVerticalDragDown: _dragDown,
                  onVerticalDragUpdate: _dragUpdate,
                  onVerticalDragEnd: _dragEnd,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          key: _headerKey,
                          child: widget.persistentHeader ?? Container()),
                      Container(
                        key: _contentKey,
                        child: widget.expandableContent,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
            key: _footerKey, child: widget.persistentFooter ?? Container()),
      ],
    );
  }

  void _handleAnimationStatusUpdate(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_oldStatus == AnimationStatus.forward) {
        setState(() {
          _draggableHeight = _maxOffset - _minOffset;
          _positionOffset = _minOffset;
        });
        if (widget.onIsExtendedCallback != null && _callCallbacks) {
          widget.onIsExtendedCallback();
        }
      }
      if (_oldStatus == AnimationStatus.reverse) {
        setState(() {
          _draggableHeight = _maxOffset - _minOffset;
          _positionOffset = _maxOffset;
        });
        if (widget.onIsContractedCallback != null && _callCallbacks)
          widget.onIsContractedCallback();
      }
    }
  }

  void _afterUpdateWidgetBuild(bool isFirstBuild) {
    double headerHeight = _headerKey.currentContext.size.height;
    double footerHeight = _footerKey.currentContext.size.height;
    double contentHeight = _contentKey.currentContext.size.height;

    double checkedPersistentContentHeight =
    (widget.persistentContentHeight < contentHeight)
        ? widget.persistentContentHeight
        : contentHeight;

    _minOffset =
        context.size.height - headerHeight - contentHeight - footerHeight;
    _maxOffset = context.size.height -
        headerHeight -
        footerHeight -
        checkedPersistentContentHeight;

    if (!isFirstBuild) {
      _positionOutOfBounds();
    } else {
      setState(() {
        _positionOffset = _maxOffset;
        _draggableHeight = _maxOffset - _minOffset;
      });
    }
  }

  void _positionOutOfBounds() {
    if (_positionOffset < _minOffset) {
      //the extend is larger than contentHeight
      _callCallbacks = false;
      _animateToMin();
    } else {
      if (_positionOffset > _maxOffset) {
        //the extend is smaller than persistentContentHeight
        _callCallbacks = false;
        _animateToMax();
      } else {
        _draggableHeight = _maxOffset - _minOffset;
      }
    }
  }

  void _animateOnIsAnimating() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  void _dragDown(DragDownDetails details) {
    if (_controller.isAnimating) {
      _useDrag = false;
    } else {
      _useDrag = true;
      _startOffsetAtDragDown = details.localPosition.dy;
      _startPositionAtDragDown = _positionOffset;
    }
  }

  void _dragUpdate(DragUpdateDetails details) {
    if (!_useDrag) return;
    double offset = details.localPosition.dy;
    double newOffset =
        _startPositionAtDragDown + offset - _startOffsetAtDragDown;
    if (_minOffset <= newOffset && _maxOffset >= newOffset) {
      setState(() {
        _positionOffset = newOffset;
      });
    } else {
      if (_minOffset > newOffset)
        setState(() {
          _positionOffset = _minOffset;
        });
      if (_maxOffset < newOffset)
        setState(() {
          _positionOffset = _maxOffset;
        });
    }
  }

  void _dragEnd(DragEndDetails details) {
    if (_startPositionAtDragDown == _positionOffset || !_useDrag) return;
    if (details.primaryVelocity < -250) {
      //drag up ended with high speed
      _callCallbacks = true;
      _animateToTop();
    } else {
      if (details.primaryVelocity > 250) {
        //drag down ended with high speed
        _callCallbacks = true;
        _animateToBottom();
      } else {
        if (_positionOffset == _maxOffset &&
            widget.onIsContractedCallback != null) {
          widget.onIsContractedCallback();
        }
        if (_positionOffset == _minOffset &&
            widget.onIsExtendedCallback != null) {
          widget.onIsExtendedCallback();
        }
      }
    }
  }

  void _animateToTop() {
    _animateOnIsAnimating();
    _controller.value = (_positionOffset - _minOffset) / _draggableHeight;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.forward;
    _controller.animateTo(
      0.0,
      duration: widget.animationDurationExtend,
      curve: widget.animationCurveExpand,
    );
  }

  void _animateToBottom() {
    _animateOnIsAnimating();

    _controller.value = (_positionOffset - _minOffset) / _draggableHeight;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.reverse;
    _controller.animateTo(
      1.0,
      duration:
      widget.animationDurationContract ?? widget.animationDurationExtend,
      curve: widget.animationCurveContract ?? widget.animationCurveExpand,
    );
  }

  void _animateToMax() {
    _animateOnIsAnimating();

    _controller.value = 1.0;
    _draggableHeight = _positionOffset - _maxOffset;
    _animationMinOffset = _maxOffset;
    _oldStatus = AnimationStatus.reverse;
    _controller.animateTo(0.0,
        duration: widget.animationDurationExtend,
        curve: widget.animationCurveExpand);
  }

  void _animateToMin() {
    _animateOnIsAnimating();

    _controller.value = 1.0;
    _draggableHeight = _positionOffset - _minOffset;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.forward;
    _controller.animateTo(
      0.0,
      duration:
      widget.animationDurationContract ?? widget.animationDurationExtend,
      curve: widget.animationCurveContract ?? widget.animationCurveExpand,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// The status of the expandable content.
enum ExpansionStatus {
  expanded,
  middle,
  contracted,
}


//.....................................................................................................................
//
//import 'dart:async';
//import 'dart:ui' show lerpDouble;
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/scheduler.dart';
//import 'package:flutter/widgets.dart';
//
//import 'package:flutter/material.dart';

const Duration _bottomSheetEnterDuration = Duration(milliseconds: 250);
const Duration _bottomSheetExitDuration = Duration(milliseconds: 200);
const Curve _modalBottomSheetCurve = Cubic(0, 0, 0.2, 1);
const double _minFlingVelocity = 700;
const double _closeProgressThreshold = 0.5;

typedef GFBottomSheetDragStartHandler = void Function(DragStartDetails details);
typedef GFBottomSheetDragEndHandler = void Function(
    DragEndDetails details, {
    bool isClosing,
    });

class GFBottomSheet extends StatefulWidget {
  const GFBottomSheet({
    Key key,
    this.animationController,
    this.enableDrag = true,
    this.onDragStart,
    this.onDragEnd,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    @required this.onClosing,
    @required this.builder,
  }) : assert(enableDrag != null),
        assert(onClosing != null),
        assert(builder != null),
        assert(elevation == null || elevation >= 0.0),
        super(key: key);

  /// The animation controller that controls the bottom sheet's entrance and
  /// exit animations.
  ///
  /// The GFBottomSheet widget will manipulate the position of this animation, it
  /// is not just a passive observer.
  final AnimationController animationController;

  /// Called when the bottom sheet begins to close.
  ///
  /// A bottom sheet might be prevented from closing (e.g., by user
  /// interaction) even after this callback is called. For this reason, this
  /// callback might be call multiple times for a given bottom sheet.
  final VoidCallback onClosing;

  /// A builder for the contents of the sheet.
  ///
  /// The bottom sheet will wrap the widget produced by this builder in a
  /// [Material] widget.
  final WidgetBuilder builder;

  /// If true, the bottom sheet can be dragged up and down and dismissed by
  /// swiping downwards.
  ///
  /// Default is true.
  final bool enableDrag;

  /// Called when the user begins dragging the bottom sheet vertically, if
  /// [enableDrag] is true.
  ///
  /// Would typically be used to change the bottom sheet animation curve so
  /// that it tracks the user's finger accurately.
  final GFBottomSheetDragStartHandler onDragStart;

  /// Called when the user stops dragging the bottom sheet, if [enableDrag]
  /// is true.
  ///
  /// Would typically be used to reset the bottom sheet animation curve, so
  /// that it animates non-linearly. Called before [onClosing] if the bottom
  /// sheet is closing.
  final GFBottomSheetDragEndHandler onDragEnd;

  /// The bottom sheet's background color.
  ///
  /// Defines the bottom sheet's [Material.color].
  ///
  /// Defaults to null and falls back to [Material]'s default.
  final Color backgroundColor;

  /// The z-coordinate at which to place this material relative to its parent.
  ///
  /// This controls the size of the shadow below the material.
  ///
  /// Defaults to 0. The value is non-negative.
  final double elevation;

  /// The shape of the bottom sheet.
  ///
  /// Defines the bottom sheet's [Material.shape].
  ///
  /// Defaults to null and falls back to [Material]'s default.
  final ShapeBorder shape;

  /// {@macro flutter.widgets.Clip}
  ///
  /// Defines the bottom sheet's [Material.clipBehavior].
  ///
  /// Use this property to enable clipping of content when the bottom sheet has
  /// a custom [shape] and the content can extend past this shape. For example,
  /// a bottom sheet with rounded corners and an edge-to-edge [Image] at the
  /// top.
  ///
  /// If this property is null then [ThemeData.bottomSheetTheme.clipBehavior] is
  /// used. If that's null then the behavior will be [Clip.none].
  final Clip clipBehavior;

  @override
  _GFBottomSheetState createState() => _GFBottomSheetState();

  /// Creates an [AnimationController] suitable for a
  /// [GFBottomSheet.animationController].
  ///
  /// This API available as a convenience for a Material compliant bottom sheet
  /// animation. If alternative animation durations are required, a different
  /// animation controller could be provided.
  static AnimationController createAnimationController(TickerProvider vsync) => AnimationController(
      duration: _bottomSheetEnterDuration,
      reverseDuration: _bottomSheetExitDuration,
      debugLabel: 'GFBottomSheet',
      vsync: vsync,
    );
}

class _GFBottomSheetState extends State<GFBottomSheet> {

  final GlobalKey _childKey = GlobalKey(debugLabel: 'GFBottomSheet child');

  double get _childHeight {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway => widget.animationController.status == AnimationStatus.reverse;

  void _handleDragStart(DragStartDetails details) {
    if (widget.onDragStart != null) {
      widget.onDragStart(details);
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    assert(widget.enableDrag);
    if (_dismissUnderway)
      return;
    widget.animationController.value -= details.primaryDelta / (_childHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    assert(widget.enableDrag);
    if (_dismissUnderway)
      return;
    bool isClosing = false;
    if (details.velocity.pixelsPerSecond.dy > _minFlingVelocity) {
      final double flingVelocity = -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (widget.animationController.value > 0.0) {
        widget.animationController.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        isClosing = true;
      }
    } else if (widget.animationController.value < _closeProgressThreshold) {
      if (widget.animationController.value > 0.0)
        widget.animationController.fling(velocity: -1.0);
      isClosing = true;
    } else {
      widget.animationController.forward();
    }

    if (widget.onDragEnd != null) {
      widget.onDragEnd(
        details,
        isClosing: isClosing,
      );
    }

    if (isClosing) {
      widget.onClosing();
    }
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent) {
      widget.onClosing();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme = Theme.of(context).bottomSheetTheme;
    final Color color = widget.backgroundColor ?? bottomSheetTheme.backgroundColor;
    final double elevation = widget.elevation ?? bottomSheetTheme.elevation ?? 0;
    final ShapeBorder shape = widget.shape ?? bottomSheetTheme.shape;
    final Clip clipBehavior = widget.clipBehavior ?? bottomSheetTheme.clipBehavior ?? Clip.none;

    final Widget bottomSheet = Material(
      key: _childKey,
      color: color,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: extentChanged,
        child: widget.builder(context),
      ),
    );

    return !widget.enableDrag ? bottomSheet : GestureDetector(
      onVerticalDragStart: _handleDragStart,
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: bottomSheet,
      excludeFromSemantics: true,
    );
  }
}

// MODAL BOTTOM SHEETS
class _ModalGFBottomSheetLayout extends SingleChildLayoutDelegate {
  _ModalGFBottomSheetLayout(this.progress, this.isScrollControlled);

  final double progress;
  final bool isScrollControlled;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) => BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0,
      maxHeight: isScrollControlled
          ? constraints.maxHeight
          : constraints.maxHeight * 9.0 / 16.0,
    );

  @override
  Offset getPositionForChild(Size size, Size childSize) => Offset(0, size.height - childSize.height * progress);

  @override
  bool shouldRelayout(_ModalGFBottomSheetLayout oldDelegate) => progress != oldDelegate.progress;
}

class _ModalGFBottomSheet<T> extends StatefulWidget {
  const _ModalGFBottomSheet({
    Key key,
    this.route,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.isScrollControlled = false,
    this.enableDrag = true,
    this.expandableContent,
    this.background,
    this.persistentHeader,
    this.persistentFooter,
    this.persistentContentHeight = 0.0,
    this.animationCurveExpand = Curves.ease,
    this.animationCurveContract = Curves.ease,
    this.animationDurationExtend = const Duration(milliseconds: 250),
    this.animationDurationContract = const Duration(milliseconds: 250),
    this.onIsExtendedCallback,
    this.onIsContractedCallback,
  }) : assert(isScrollControlled != null),
        assert(enableDrag != null),
        assert(persistentContentHeight != null && persistentContentHeight >= 0),
        assert(animationCurveExpand != null),
        assert(animationCurveContract != null),
        assert(animationDurationExtend != null),
        assert(animationDurationContract != null),
        super(key: key);

  final _ModalGFBottomSheetRoute<T> route;
  final bool isScrollControlled;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final bool enableDrag;

  /// [expandableContent] is the widget which you can hide and show by dragging.
  /// It has to be a widget with a constant height. It is required for the [ExpandableBottomSheet].
  final Widget expandableContent;

  /// [background] is the widget behind the [expandableContent] which holds
  /// usually the content of your page. It is required for the [ExpandableBottomSheet].
  final Widget background;

  /// [persistentHeader] is a Widget which is on top of the [expandableContent]
  /// and will never be hidden. It is made for a widget which indicates the
  /// user he can expand the content by dragging.
  final Widget persistentHeader;

  /// [persistentFooter] is a widget which is always shown at the bottom. The [expandableContent]
  /// is if it is expanded on top of it so you don't need margin to see all of
  /// your content. You can use it for example for navigation or a menu.
  final Widget persistentFooter;

  /// [persistentContentHeight] is the height of the content which will never
  /// been contracted. It only relates to [expandableContent]. [persistentHeader]
  /// and [persistentFooter] will not be affected by this.
  final double persistentContentHeight;

  /// [animationDurationExtend] is the duration for the animation if you stop
  /// dragging with high speed.
  final Duration animationDurationExtend;

  /// [animationDurationContract] is the duration for the animation to bottom
  /// if you stop dragging with high speed. If it is `null` [animationDurationExtend] will be used.
  final Duration animationDurationContract;

  /// [animationCurveExpand] is the curve of the animation for expanding
  /// the [expandableContent] if the drag ended with high speed.
  final Curve animationCurveExpand;

  /// [animationCurveContract] is the curve of the animation for contracting
  /// the [expandableContent] if the drag ended with high speed.
  final Curve animationCurveContract;

  /// [onIsExtendedCallback] will be executed if the extend reaches its maximum.
  final Function() onIsExtendedCallback;

  /// [onIsContractedCallback] will be executed if the extend reaches its minimum.
  final Function() onIsContractedCallback;

  @override
  _ModalGFBottomSheetState<T> createState() => _ModalGFBottomSheetState<T>();
}

class _ModalGFBottomSheetState<T> extends State<_ModalGFBottomSheet<T>>    with TickerProviderStateMixin {
  GlobalKey _contentKey = new GlobalKey(debugLabel: 'contentKey');
  GlobalKey _headerKey = new GlobalKey(debugLabel: 'headerKey');
  GlobalKey _footerKey = new GlobalKey(debugLabel: 'footerKey');

  AnimationController _controller;
  double _draggableHeight = 0;
  double _positionOffset;
  double _startOffsetAtDragDown = 0;
  double _startPositionAtDragDown = 0;
  double _minOffset = 0;
  double _maxOffset = 0;
  double _animationMinOffset = 0;
  AnimationStatus _oldStatus = AnimationStatus.dismissed;
  bool _useDrag = true;
  bool _callCallbacks = false;

  /// Expands the content of the widget.
  void expand() {
    _afterUpdateWidgetBuild(false);
    _callCallbacks = true;
    _animateToTop();
  }

  /// Contracts the content of the widget.
  void contract() {
    _afterUpdateWidgetBuild(false);
    _callCallbacks = true;
    _animateToBottom();
  }

  /// The status of the expansion.
  ExpansionStatus get expansionStatus {
    if (_positionOffset == null) return ExpansionStatus.contracted;
    if (_positionOffset == _maxOffset) return ExpansionStatus.contracted;
    if (_positionOffset == _minOffset) return ExpansionStatus.expanded;
    return ExpansionStatus.middle;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _controller.addStatusListener(_handleAnimationStatusUpdate);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _afterUpdateWidgetBuild(true));
  }

  void _handleAnimationStatusUpdate(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_oldStatus == AnimationStatus.forward) {
        setState(() {
          _draggableHeight = _maxOffset - _minOffset;
          _positionOffset = _minOffset;
        });
        if (widget.onIsExtendedCallback != null && _callCallbacks) {
          widget.onIsExtendedCallback();
        }
      }
      if (_oldStatus == AnimationStatus.reverse) {
        setState(() {
          _draggableHeight = _maxOffset - _minOffset;
          _positionOffset = _maxOffset;
        });
        if (widget.onIsContractedCallback != null && _callCallbacks)
          widget.onIsContractedCallback();
      }
    }
  }

  void _afterUpdateWidgetBuild(bool isFirstBuild) {
    double headerHeight = _headerKey.currentContext.size.height;
    double footerHeight = _footerKey.currentContext.size.height;
    double contentHeight = _contentKey.currentContext.size.height;

    double checkedPersistentContentHeight =
    (widget.persistentContentHeight < contentHeight)
        ? widget.persistentContentHeight
        : contentHeight;

    _minOffset =
        context.size.height - headerHeight - contentHeight - footerHeight;
    _maxOffset = context.size.height -
        headerHeight -
        footerHeight -
        checkedPersistentContentHeight;

    if (!isFirstBuild) {
      _positionOutOfBounds();
    } else {
      setState(() {
        _positionOffset = _maxOffset;
        _draggableHeight = _maxOffset - _minOffset;
      });
    }
  }

  void _positionOutOfBounds() {
    if (_positionOffset < _minOffset) {
      //the extend is larger than contentHeight
      _callCallbacks = false;
      _animateToMin();
    } else {
      if (_positionOffset > _maxOffset) {
        //the extend is smaller than persistentContentHeight
        _callCallbacks = false;
        _animateToMax();
      } else {
        _draggableHeight = _maxOffset - _minOffset;
      }
    }
  }

  void _animateOnIsAnimating() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  void _dragDown(DragDownDetails details) {
    if (_controller.isAnimating) {
      _useDrag = false;
    } else {
      _useDrag = true;
      _startOffsetAtDragDown = details.localPosition.dy;
      _startPositionAtDragDown = _positionOffset;
    }
  }

  void _dragUpdate(DragUpdateDetails details) {
    if (!_useDrag) return;
    double offset = details.localPosition.dy;
    double newOffset =
        _startPositionAtDragDown + offset - _startOffsetAtDragDown;
    if (_minOffset <= newOffset && _maxOffset >= newOffset) {
      setState(() {
        _positionOffset = newOffset;
      });
    } else {
      if (_minOffset > newOffset)
        setState(() {
          _positionOffset = _minOffset;
        });
      if (_maxOffset < newOffset)
        setState(() {
          _positionOffset = _maxOffset;
        });
    }
  }

  void _dragEnd(DragEndDetails details) {
    if (_startPositionAtDragDown == _positionOffset || !_useDrag) return;
    if (details.primaryVelocity < -250) {
      //drag up ended with high speed
      _callCallbacks = true;
      _animateToTop();
    } else {
      if (details.primaryVelocity > 250) {
        //drag down ended with high speed
        _callCallbacks = true;
        _animateToBottom();
      } else {
        if (_positionOffset == _maxOffset &&
            widget.onIsContractedCallback != null) {
          widget.onIsContractedCallback();
        }
        if (_positionOffset == _minOffset &&
            widget.onIsExtendedCallback != null) {
          widget.onIsExtendedCallback();
        }
      }
    }
  }

  void _animateToTop() {
    _animateOnIsAnimating();
    _controller.value = (_positionOffset - _minOffset) / _draggableHeight;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.forward;
    _controller.animateTo(
      0.0,
      duration: widget.animationDurationExtend,
      curve: widget.animationCurveExpand,
    );
  }

  void _animateToBottom() {
    _animateOnIsAnimating();

    _controller.value = (_positionOffset - _minOffset) / _draggableHeight;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.reverse;
    _controller.animateTo(
      1.0,
      duration:
      widget.animationDurationContract ?? widget.animationDurationExtend,
      curve: widget.animationCurveContract ?? widget.animationCurveExpand,
    );
  }

  void _animateToMax() {
    _animateOnIsAnimating();

    _controller.value = 1.0;
    _draggableHeight = _positionOffset - _maxOffset;
    _animationMinOffset = _maxOffset;
    _oldStatus = AnimationStatus.reverse;
    _controller.animateTo(0.0,
        duration: widget.animationDurationExtend,
        curve: widget.animationCurveExpand);
  }

  void _animateToMin() {
    _animateOnIsAnimating();

    _controller.value = 1.0;
    _draggableHeight = _positionOffset - _minOffset;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.forward;
    _controller.animateTo(
      0.0,
      duration:
      widget.animationDurationContract ?? widget.animationDurationExtend,
      curve: widget.animationCurveContract ?? widget.animationCurveExpand,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ParametricCurve<double> animationCurve = _modalBottomSheetCurve;

  String _getRouteLabel(MaterialLocalizations localizations) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return '';
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return localizations.dialogLabel;
    }
    return null;
  }

  void handleDragStart(DragStartDetails details) {
    // Allow the bottom sheet to track the user's finger accurately.
    animationCurve = Curves.linear;
  }

//  void handleDragEnd(DragEndDetails details, {bool isClosing}) {
//    // Allow the bottom sheet to animate smoothly from its current position.
//    animationCurve = _GFBottomSheetSuspendedCurve(
//      widget.route.animation.value,
//      curve: _modalBottomSheetCurve,
//    );
//  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String routeLabel = _getRouteLabel(localizations);

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, Widget child) {
        if (_controller.isAnimating) {
          _positionOffset = _animationMinOffset +
              _controller.value * _draggableHeight;
        }
        return Positioned(
          top: _positionOffset,
          right: 0.0,
          left: 0.0,
          child: child,
        );
      },

      child: GestureDetector(
        onVerticalDragDown: _dragDown,
        onVerticalDragUpdate: _dragUpdate,
        onVerticalDragEnd: _dragEnd,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                key: _headerKey,
                child: widget.persistentHeader ?? Container()),
            Container(
              key: _contentKey,
              child: widget.expandableContent,
            ),
          ],
        ),
      ),
    );


//    return AnimatedBuilder(
//      animation: widget.route.animation,
//      builder: (BuildContext context, Widget child) {
//        // Disable the initial animation when accessible navigation is on so
//        // that the semantics are added to the tree at the correct time.
//        final double animationValue = animationCurve.transform(
//            mediaQuery.accessibleNavigation ? 1.0 : widget.route.animation.value
//        );
//        return Semantics(
//          scopesRoute: true,
//          namesRoute: true,
//          label: routeLabel,
//          explicitChildNodes: true,
//          child: ClipRect(
//            child: CustomSingleChildLayout(
//              delegate: _ModalGFBottomSheetLayout(animationValue, widget.isScrollControlled),
//              child: GFBottomSheet(
//                animationController: widget.route._animationController,
//                onClosing: () {
//                  if (widget.route.isCurrent) {
//                    Navigator.pop(context);
//                  }
//                },
//                builder: widget.route.builder,
//                backgroundColor: widget.backgroundColor,
//                elevation: widget.elevation,
//                shape: widget.shape,
//                clipBehavior: widget.clipBehavior,
//                enableDrag: widget.enableDrag,
//                onDragStart: handleDragStart,
////                onDragEnd: handleDragEnd,
//              ),
//            ),
//          ),
//        );
//      },
//    );
  }
}

class _ModalGFBottomSheetRoute<T> extends PopupRoute<T> {
  _ModalGFBottomSheetRoute({
    this.builder,
    this.theme,
    this.barrierLabel,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    @required this.isScrollControlled,
    @required this.expandableContent,
    @required this.background,
    this.persistentHeader,
    this.persistentFooter,
    this.persistentContentHeight = 0.0,
    this.animationCurveExpand = Curves.ease,
    this.animationCurveContract = Curves.ease,
    this.animationDurationExtend = const Duration(milliseconds: 250),
    this.animationDurationContract = const Duration(milliseconds: 250),
    this.onIsExtendedCallback,
    this.onIsContractedCallback,
    RouteSettings settings,
  }) : assert(isScrollControlled != null),
        assert(isDismissible != null),
        assert(enableDrag != null),
        super(settings: settings);

  final WidgetBuilder builder;
  final ThemeData theme;
  final bool isScrollControlled;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final Color modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;

  /// [expandableContent] is the widget which you can hide and show by dragging.
  /// It has to be a widget with a constant height. It is required for the [ExpandableBottomSheet].
  final Widget expandableContent;

  /// [background] is the widget behind the [expandableContent] which holds
  /// usually the content of your page. It is required for the [ExpandableBottomSheet].
  final Widget background;

  /// [persistentHeader] is a Widget which is on top of the [expandableContent]
  /// and will never be hidden. It is made for a widget which indicates the
  /// user he can expand the content by dragging.
  final Widget persistentHeader;

  /// [persistentFooter] is a widget which is always shown at the bottom. The [expandableContent]
  /// is if it is expanded on top of it so you don't need margin to see all of
  /// your content. You can use it for example for navigation or a menu.
  final Widget persistentFooter;

  /// [persistentContentHeight] is the height of the content which will never
  /// been contracted. It only relates to [expandableContent]. [persistentHeader]
  /// and [persistentFooter] will not be affected by this.
  final double persistentContentHeight;

  /// [animationDurationExtend] is the duration for the animation if you stop
  /// dragging with high speed.
  final Duration animationDurationExtend;

  /// [animationDurationContract] is the duration for the animation to bottom
  /// if you stop dragging with high speed. If it is `null` [animationDurationExtend] will be used.
  final Duration animationDurationContract;

  /// [animationCurveExpand] is the curve of the animation for expanding
  /// the [expandableContent] if the drag ended with high speed.
  final Curve animationCurveExpand;

  /// [animationCurveContract] is the curve of the animation for contracting
  /// the [expandableContent] if the drag ended with high speed.
  final Curve animationCurveContract;

  /// [onIsExtendedCallback] will be executed if the extend reaches its maximum.
  final Function() onIsExtendedCallback;

  /// [onIsContractedCallback] will be executed if the extend reaches its minimum.
  final Function() onIsContractedCallback;

  @override
  Duration get transitionDuration => _bottomSheetEnterDuration;

  @override
  Duration get reverseTransitionDuration => _bottomSheetExitDuration;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor => modalBarrierColor ?? Colors.black54;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = GFBottomSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final BottomSheetThemeData sheetTheme = theme?.bottomSheetTheme ?? Theme.of(context).bottomSheetTheme;
    // By definition, the bottom sheet is aligned to the bottom of the page
    // and isn't exposed to the top padding of the MediaQuery.
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _ModalGFBottomSheet<T>(
        route: this,
        backgroundColor: backgroundColor ?? sheetTheme?.modalBackgroundColor ?? sheetTheme?.backgroundColor,
        elevation: elevation ?? sheetTheme?.modalElevation ?? sheetTheme?.elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        expandableContent: expandableContent,
        animationDurationExtend: animationDurationExtend,
        animationCurveContract: animationCurveContract,
        animationCurveExpand: animationCurveExpand,
        animationDurationContract: animationDurationContract,
        background: background,
        persistentHeader: persistentHeader,
        persistentContentHeight: persistentContentHeight,
        persistentFooter: persistentFooter,
      ),
    );
    if (theme != null)
      bottomSheet = Theme(data: theme, child: bottomSheet);
    return bottomSheet;
  }
}

///// The [startingPoint] and [curve] arguments must not be null.
//class _GFBottomSheetSuspendedCurve extends ParametricCurve<double> {
//  /// Creates a suspended curve.
//  const _GFBottomSheetSuspendedCurve(
//      this.startingPoint, {
//        this.curve = Curves.easeOutCubic,
//      }) : assert(startingPoint != null),
//        assert(curve != null);
//
//  /// The progress value at which [curve] should begin.
//  ///
//  /// This defaults to [Curves.easeOutCubic].
//  final double startingPoint;
//  /// The curve to use when [startingPoint] is reached.
//  final Curve curve;
//
//  @override
//  double transform(double t) {
//    assert(t >= 0.0 && t <= 1.0);
//    assert(startingPoint >= 0.0 && startingPoint <= 1.0);
//
//    if (t < startingPoint) {
//      return t;
//    }
//
//    if (t == 1.0) {
//      return t;
//    }
//
//    final double curveProgress = (t - startingPoint) / (1 - startingPoint);
//    final double transformed = curve.transform(curveProgress);
//    return lerpDouble(startingPoint, 1, transformed);
//  }
//
//  @override
//  String toString() {
//    return '${describeIdentity(this)}($startingPoint, $curve)';
//  }
//}

Future<T> showModalGFBottomSheet<T>({
  @required BuildContext context,
  WidgetBuilder builder,
  Color backgroundColor,
  double elevation,
  ShapeBorder shape,
  Clip clipBehavior,
  Color barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
//  isScrollControlled,
  expandableContent,
  persistentHeader,
  persistentFooter,
  persistentContentHeight = 0.0,
  animationCurveExpand = Curves.ease,
  animationCurveContract = Curves.ease,
  animationDurationExtend = const Duration(milliseconds: 250),
  animationDurationContract = const Duration(milliseconds: 250),
  onIsExtendedCallback,
  onIsContractedCallback,
}) {
  assert(isScrollControlled != null);
  assert(isDismissible != null);
  assert(enableDrag != null);
  assert(context != null);
  assert(useRootNavigator != null);
  assert(isDismissible != null);
  assert(enableDrag != null);
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  return Navigator.of(context, rootNavigator: useRootNavigator).push(_ModalGFBottomSheetRoute<T>(
    builder: builder,
    theme: Theme.of(context, shadowThemeOnly: true),
    isScrollControlled: isScrollControlled,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    isDismissible: isDismissible,
    modalBarrierColor: barrierColor,
    enableDrag: enableDrag,
    expandableContent: expandableContent,
    animationDurationExtend: animationDurationExtend,
    animationCurveContract: animationCurveContract,
    animationCurveExpand: animationCurveExpand,
    animationDurationContract: animationDurationContract,
//    background: background,
    persistentHeader: persistentHeader,
    persistentContentHeight: persistentContentHeight,
    persistentFooter: persistentFooter,
  ));
}
