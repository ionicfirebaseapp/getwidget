import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [ExpandableBottomSheet] is a BottomSheet with a draggable height like the
/// Google Maps App on Android.
///
/// __Example:__
///
/// ```dart
/// ExpandableBottomSheet(
///   background: Container(
///     color: Colors.red,
///     child: Center(
///       child: Text('Background'),
///     ),
///   ),
///   persistentHeader: Container(
///     height: 40,
///     color: Colors.blue,
///     child: Center(
///       child: Text('Header'),
///     ),
///   ),
///   expandableContent: Container(
///     height: 500,
///     color: Colors.green,
///     child: Center(
///       child: Text('Content'),
///     ),
///   ),
/// );
/// ```
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
