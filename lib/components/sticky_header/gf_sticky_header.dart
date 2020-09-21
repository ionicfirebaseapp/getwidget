import 'dart:math' show min, max;

import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class GFStickyHeader extends MultiChildRenderObjectWidget {
  GFStickyHeader({
    Key key,
    this.header, this.content, this.enableHeaderOverlap = false,
    @required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.hardEdge,
    // List<Widget> children = const <Widget>[],
  }) : assert(direction != null),
        assert(mainAxisAlignment != null),
        assert(mainAxisSize != null),
        assert(crossAxisAlignment != null),
        assert(verticalDirection != null),
        assert(crossAxisAlignment != CrossAxisAlignment.baseline || textBaseline != null),
        assert(clipBehavior != null),
        super(key: key, children: [content, header]);
  //   Key key,
  //   @required this.header,
  //   @required this.content,
  //   this.enableHeaderOverlap = false,
  // }) : super(
  //   key: key,
  //   children: [content, header],
  // );


  /// widget can be used to define [header].
  final Widget header;

  /// widget can be used to define [content].
  final Widget content;

  /// On state true, the [header] will overlap the [content].
  /// Default value is false.
  final bool enableHeaderOverlap;

  ///
  /// If you know the axis in advance, then consider using a [Row] (if it's
  /// horizontal) or [Column] (if it's vertical) instead of a [Flex], since that
  /// will be less verbose. (For [Row] and [Column] this property is fixed to
  /// the appropriate axis.)
  final Axis direction;

  /// How the children should be placed along the main axis.
  ///
  /// For example, [MainAxisAlignment.start], the default, places the children
  /// at the start (i.e., the left for a [Row] or the top for a [Column]) of the
  /// main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  final MainAxisSize mainAxisSize;

  /// How the children should be placed along the cross axis.
  ///
  /// For example, [CrossAxisAlignment.center], the default, centers the
  /// children in the cross axis (e.g., horizontally for a [Column]).
  final CrossAxisAlignment crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// Defaults to the ambient [Directionality].
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// the children are positioned (left-to-right or right-to-left), and the
  /// meaning of the [mainAxisAlignment] property's [MainAxisAlignment.start] and
  /// [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [mainAxisAlignment] is either [MainAxisAlignment.start] or
  /// [MainAxisAlignment.end], or there's more than one child, then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  final TextDirection textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [mainAxisAlignment]
  /// property's [MainAxisAlignment.start] and [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [mainAxisAlignment]
  /// is either [MainAxisAlignment.start] or [MainAxisAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  final VerticalDirection verticalDirection;

  /// If aligning items according to their baseline, which baseline to use.
  final TextBaseline textBaseline;

  // TODO(liyuqian): defaults to [Clip.none] once Google references are updated.
  /// {@macro flutter.widgets.Clip}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  bool get _needTextDirection {
    assert(direction != null);
    switch (direction) {
      case Axis.horizontal:
        return true; // because it affects the layout order.
      case Axis.vertical:
        assert(crossAxisAlignment != null);
        return crossAxisAlignment == CrossAxisAlignment.start
            || crossAxisAlignment == CrossAxisAlignment.end;
    }
    return null;
  }

  /// The value to pass to [RenderFlex.textDirection].
  ///
  /// This value is derived from the [textDirection] property and the ambient
  /// [Directionality]. The value is null if there is no need to specify the
  /// text direction. In practice there's always a need to specify the direction
  /// except for vertical flexes (e.g. [Column]s) whose [crossAxisAlignment] is
  /// not dependent on the text direction (not `start` or `end`). In particular,
  /// a [Row] always needs a text direction because the text direction controls
  /// its layout order. (For [Column]s, the layout order is controlled by
  /// [verticalDirection], which is always specified as it does not depend on an
  /// inherited widget and defaults to [VerticalDirection.down].)
  ///
  /// This method exists so that subclasses of [Flex] that create their own
  /// render objects that are derived from [RenderFlex] can do so and still use
  /// the logic for providing a text direction only when it is necessary.
  @protected
  TextDirection getEffectiveTextDirection(BuildContext context) {
    return textDirection ?? (_needTextDirection ? Directionality.of(context) : null);
  }


  @override
  RenderGFStickyHeader createRenderObject(BuildContext context) {
    final scrollable = Scrollable.of(context);
    assert(scrollable != null);
    return RenderGFStickyHeader(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: getEffectiveTextDirection(context),
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      scrollable: scrollable,
    );
  }
}

bool _startIsTopLeft(Axis direction, TextDirection textDirection, VerticalDirection verticalDirection) {
  assert(direction != null);
  // If the relevant value of textDirection or verticalDirection is null, this returns null too.
  switch (direction) {
    case Axis.horizontal:
      switch (textDirection) {
        case TextDirection.ltr:
          return true;
        case TextDirection.rtl:
          return false;
      }
      break;
    case Axis.vertical:
      switch (verticalDirection) {
        case VerticalDirection.down:
          return true;
        case VerticalDirection.up:
          return false;
      }
      break;
  }
  return null;
}


typedef _ChildSizingFunction = double Function(RenderBox child, double extent);

class RenderGFStickyHeader extends RenderBox with ContainerRenderObjectMixin<RenderBox, FlexParentData>,
    RenderBoxContainerDefaultsMixin<RenderBox, FlexParentData>,
    DebugOverflowIndicatorMixin {
  /// Creates a flex render object.
  ///
  /// By default, the flex layout is horizontal and children are aligned to the
  /// start of the main axis and the center of the cross axis.
  RenderGFStickyHeader({
    List<RenderBox> children,
    Axis direction = Axis.horizontal,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    Clip clipBehavior = Clip.none,
    bool enableHeaderOverlap = false,
    ScrollableState scrollable,
  }) : assert(direction != null),
        assert(mainAxisAlignment != null),
        assert(mainAxisSize != null),
        assert(crossAxisAlignment != null),
        assert(clipBehavior != null),
        assert(scrollable != null),
        _scrollable = scrollable,
        _direction = direction,
        _mainAxisAlignment = mainAxisAlignment,
        _mainAxisSize = mainAxisSize,
        _crossAxisAlignment = crossAxisAlignment,
        _textDirection = textDirection,
        _verticalDirection = verticalDirection,
        _textBaseline = textBaseline,
        _enableHeaderOverlap = enableHeaderOverlap {
          addAll(children);
        }
        // _clipBehavior = clipBehavior {
        //   addAll(children);
        // }



  final ScrollableState _scrollable;
  final bool _enableHeaderOverlap;

  /// The direction to use as the main axis.
  Axis get direction => _direction;
  Axis _direction;
  set direction(Axis value) {
    assert(value != null);
    if (_direction != value) {
      _direction = value;
      markNeedsLayout();
    }
  }

  /// How the children should be placed along the main axis.
  ///
  /// If the [direction] is [Axis.horizontal], and the [mainAxisAlignment] is
  /// either [MainAxisAlignment.start] or [MainAxisAlignment.end], then the
  /// [textDirection] must not be null.
  ///
  /// If the [direction] is [Axis.vertical], and the [mainAxisAlignment] is
  /// either [MainAxisAlignment.start] or [MainAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  MainAxisAlignment get mainAxisAlignment => _mainAxisAlignment;
  MainAxisAlignment _mainAxisAlignment;
  set mainAxisAlignment(MainAxisAlignment value) {
    assert(value != null);
    if (_mainAxisAlignment != value) {
      _mainAxisAlignment = value;
      markNeedsLayout();
    }
  }

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  MainAxisSize get mainAxisSize => _mainAxisSize;
  MainAxisSize _mainAxisSize;
  set mainAxisSize(MainAxisSize value) {
    assert(value != null);
    if (_mainAxisSize != value) {
      _mainAxisSize = value;
      markNeedsLayout();
    }
  }

  /// How the children should be placed along the cross axis.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] must not be null.
  CrossAxisAlignment get crossAxisAlignment => _crossAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  set crossAxisAlignment(CrossAxisAlignment value) {
    assert(value != null);
    if (_crossAxisAlignment != value) {
      _crossAxisAlignment = value;
      markNeedsLayout();
    }
  }

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// children are positioned (left-to-right or right-to-left), and the meaning
  /// of the [mainAxisAlignment] property's [MainAxisAlignment.start] and
  /// [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [mainAxisAlignment] is either [MainAxisAlignment.start] or
  /// [MainAxisAlignment.end], or there's more than one child, then the
  /// [textDirection] must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] must not be null.
  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection != value) {
      _textDirection = value;
      markNeedsLayout();
    }
  }

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [mainAxisAlignment]
  /// property's [MainAxisAlignment.start] and [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [mainAxisAlignment]
  /// is either [MainAxisAlignment.start] or [MainAxisAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  VerticalDirection get verticalDirection => _verticalDirection;
  VerticalDirection _verticalDirection;
  set verticalDirection(VerticalDirection value) {
    if (_verticalDirection != value) {
      _verticalDirection = value;
      markNeedsLayout();
    }
  }

  /// If aligning items according to their baseline, which baseline to use.
  ///
  /// Must not be null if [crossAxisAlignment] is [CrossAxisAlignment.baseline].
  TextBaseline get textBaseline => _textBaseline;
  TextBaseline _textBaseline;
  set textBaseline(TextBaseline value) {
    assert(_crossAxisAlignment != CrossAxisAlignment.baseline || value != null);
    if (_textBaseline != value) {
      _textBaseline = value;
      markNeedsLayout();
    }
  }

  // Set during layout if overflow occurred on the main axis.
  double _overflow;

  /// {@macro flutter.widgets.Clip}
  ///
  /// Defaults to [Clip.none], and must not be null.
  Clip get clipBehavior => _clipBehavior;
  Clip _clipBehavior = Clip.none;
  set clipBehavior(Clip value) {
    assert(value != null);
    if (value != _clipBehavior) {
      _clipBehavior = value;
      markNeedsPaint();
      markNeedsSemanticsUpdate();
    }
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! FlexParentData) {
      child.parentData = FlexParentData();
    }
    // super.setupParentData(child);
    // child.parentData = MultiChildLayoutParentData();
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    if (_direction == Axis.horizontal)
      return defaultComputeDistanceToHighestActualBaseline(baseline);
    return defaultComputeDistanceToFirstActualBaseline(baseline);
  }

  int _getFlex(RenderBox child) {
    final FlexParentData childParentData = child.parentData as FlexParentData;
    return childParentData.flex ?? 0;
  }

  FlexFit _getFit(RenderBox child) {
    final FlexParentData childParentData = child.parentData as FlexParentData;
    return childParentData.fit ?? FlexFit.tight;
  }

  double _getCrossSize(RenderBox child) {
    switch (_direction) {
      case Axis.horizontal:
        return child.size.height;
      case Axis.vertical:
        return child.size.width;
    }
    return null;
  }

  double _getMainSize(RenderBox child) {
    switch (_direction) {
      case Axis.horizontal:
        return child.size.width;
      case Axis.vertical:
        return child.size.height;
    }
    return null;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  RenderBox get _headerTile => lastChild;

  RenderBox get _contentBody => firstChild;

  double getHeaderTileStuckOffset() {
    final scrollableContent = _scrollable.context.findRenderObject();
    if (scrollableContent.attached) {
      try {
        return localToGlobal(Offset.zero, ancestor: scrollableContent).dy;
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        print(e);
      }
    }
    return 0;
  }


  @override
  void performLayout() {
    // assert(_debugHasNecessaryDirections);
    // final BoxConstraints constraints = this.constraints;

    assert(childCount == 2);
    _headerTile.layout(constraints.loosen(), parentUsesSize: true);
    _contentBody.layout(constraints.loosen(), parentUsesSize: true);

    final headerTileHeight = _headerTile.size.height;
    final contentBodyHeight = _contentBody.size.height;

    final height = max(
        constraints.minHeight,
        _enableHeaderOverlap
            ? contentBodyHeight
            : headerTileHeight + contentBodyHeight);
    final width = max(constraints.minWidth, contentBodyHeight);
    //
    // size = Size(
    //     constraints.constrainWidth(width), constraints.constrainHeight(height));
    //
    final double headerTileOffset = getHeaderTileStuckOffset();
    //
    // final FlexParentData contentBodyParentData =
    //     _contentBody.parentData;
    // contentBodyParentData.offset =
    //     Offset(0, _enableHeaderOverlap ? 0.0 : headerTileHeight);
    //
    //
    // final FlexParentData headerTileParentData =
    //     _headerTile.parentData;
    // headerTileParentData.offset =
    //     Offset(0, max(0, min(-headerTileOffset, height - headerTileHeight)));

    // Determine used flex factor, size inflexible items, calculate free space.
    int totalFlex = 0;
    int totalChildren = 0;
    assert(constraints != null);
    final double maxMainSize = _direction == Axis.horizontal ? constraints.maxWidth : constraints.maxHeight;
    final bool canFlex = maxMainSize < double.infinity;

    double crossSize = 0.0;
    double allocatedSize = 0.0; // Sum of the sizes of the non-flexible children.
    RenderBox child = firstChild;
    RenderBox lastFlexChild;
    while (child != null) {
      final FlexParentData childParentData = child.parentData as FlexParentData;
      totalChildren++;
      final int flex = _getFlex(child);
      if (flex > 0) {
        assert(() {
          final String identity = _direction == Axis.horizontal ? 'row' : 'column';
          final String axis = _direction == Axis.horizontal ? 'horizontal' : 'vertical';
          final String dimension = _direction == Axis.horizontal ? 'width' : 'height';
          DiagnosticsNode error, message;
          final List<DiagnosticsNode> addendum = <DiagnosticsNode>[];
          if (!canFlex && (mainAxisSize == MainAxisSize.max || _getFit(child) == FlexFit.tight)) {
            error = ErrorSummary('RenderFlex children have non-zero flex but incoming $dimension constraints are unbounded.');
            message = ErrorDescription(
                'When a $identity is in a parent that does not provide a finite $dimension constraint, for example '
                    'if it is in a $axis scrollable, it will try to shrink-wrap its children along the $axis '
                    'axis. Setting a flex on a child (e.g. using Expanded) indicates that the child is to '
                    'expand to fill the remaining space in the $axis direction.'
            );
            RenderBox node = this;
            switch (_direction) {
              case Axis.horizontal:
                while (!node.constraints.hasBoundedWidth && node.parent is RenderBox)
                  node = node.parent as RenderBox;
                if (!node.constraints.hasBoundedWidth)
                  node = null;
                break;
              case Axis.vertical:
                while (!node.constraints.hasBoundedHeight && node.parent is RenderBox)
                  node = node.parent as RenderBox;
                if (!node.constraints.hasBoundedHeight)
                  node = null;
                break;
            }
            if (node != null) {
              addendum.add(node.describeForError('The nearest ancestor providing an unbounded width constraint is'));
            }
            addendum.add(ErrorHint('See also: https://flutter.dev/layout/'));
          } else {
            return true;
          }
          throw FlutterError.fromParts(<DiagnosticsNode>[
            error,
            message,
            ErrorDescription(
                'These two directives are mutually exclusive. If a parent is to shrink-wrap its child, the child '
                    'cannot simultaneously expand to fit its parent.'
            ),
            ErrorHint(
                'Consider setting mainAxisSize to MainAxisSize.min and using FlexFit.loose fits for the flexible '
                    'children (using Flexible rather than Expanded). This will allow the flexible children '
                    'to size themselves to less than the infinite remaining space they would otherwise be '
                    'forced to take, and then will cause the RenderFlex to shrink-wrap the children '
                    'rather than expanding to fit the maximum constraints provided by the parent.'
            ),
            ErrorDescription(
                'If this message did not help you determine the problem, consider using debugDumpRenderTree():\n'
                    '  https://flutter.dev/debugging/#rendering-layer\n'
                    '  http://api.flutter.dev/flutter/rendering/debugDumpRenderTree.html'
            ),
            describeForError('The affected RenderFlex is', style: DiagnosticsTreeStyle.errorProperty),
            DiagnosticsProperty<dynamic>('The creator information is set to', debugCreator, style: DiagnosticsTreeStyle.errorProperty),
            ...addendum,
            ErrorDescription(
                "If none of the above helps enough to fix this problem, please don't hesitate to file a bug:\n"
                    '  https://github.com/flutter/flutter/issues/new?template=BUG.md'
            ),
          ]);
        }());
        totalFlex += childParentData.flex;
        lastFlexChild = child;
      } else {
        BoxConstraints innerConstraints;
        if (crossAxisAlignment == CrossAxisAlignment.stretch) {
          switch (_direction) {
            case Axis.horizontal:
              innerConstraints = BoxConstraints(minHeight: constraints.maxHeight,
                  maxHeight: constraints.maxHeight);
              break;
            case Axis.vertical:
              innerConstraints = BoxConstraints(minWidth: constraints.maxWidth,
                  maxWidth: constraints.maxWidth);
              break;
          }
        } else {
          switch (_direction) {
            case Axis.horizontal:
              innerConstraints = BoxConstraints(maxHeight: constraints.maxHeight);
              break;
            case Axis.vertical:
              innerConstraints = BoxConstraints(maxWidth: constraints.maxWidth);
              break;
          }
        }
        child.layout(innerConstraints, parentUsesSize: true);
        allocatedSize += _getMainSize(child);
        crossSize = math.max(crossSize, _getCrossSize(child));
      }
      assert(child.parentData == childParentData);
      child = childParentData.nextSibling;
    }

    // Distribute free space to flexible children, and determine baseline.
    final double freeSpace = math.max(0.0, (canFlex ? maxMainSize : 0.0) - allocatedSize);
    double allocatedFlexSpace = 0.0;
    double maxBaselineDistance = 0.0;
    if (totalFlex > 0 || crossAxisAlignment == CrossAxisAlignment.baseline) {
      final double spacePerFlex = canFlex && totalFlex > 0 ? (freeSpace / totalFlex) : double.nan;
      child = firstChild;
      double maxSizeAboveBaseline = 0;
      double maxSizeBelowBaseline = 0;
      while (child != null) {
        final int flex = _getFlex(child);
        if (flex > 0) {
          final double maxChildExtent = canFlex ? (child == lastFlexChild ? (freeSpace - allocatedFlexSpace) : spacePerFlex * flex) : double.infinity;
          double minChildExtent;
          switch (_getFit(child)) {
            case FlexFit.tight:
              assert(maxChildExtent < double.infinity);
              minChildExtent = maxChildExtent;
              break;
            case FlexFit.loose:
              minChildExtent = 0.0;
              break;
          }
          assert(minChildExtent != null);
          BoxConstraints innerConstraints;
          if (crossAxisAlignment == CrossAxisAlignment.stretch) {
            switch (_direction) {
              case Axis.horizontal:
                innerConstraints = BoxConstraints(minWidth: minChildExtent,
                    maxWidth: maxChildExtent,
                    minHeight: constraints.maxHeight,
                    maxHeight: constraints.maxHeight);
                break;
              case Axis.vertical:
                innerConstraints = BoxConstraints(minWidth: constraints.maxWidth,
                    maxWidth: constraints.maxWidth,
                    minHeight: minChildExtent,
                    maxHeight: maxChildExtent);
                break;
            }
          } else {
            switch (_direction) {
              case Axis.horizontal:
                innerConstraints = BoxConstraints(minWidth: minChildExtent,
                    maxWidth: maxChildExtent,
                    maxHeight: constraints.maxHeight);
                break;
              case Axis.vertical:
                innerConstraints = BoxConstraints(maxWidth: constraints.maxWidth,
                    minHeight: minChildExtent,
                    maxHeight: maxChildExtent);
                break;
            }
          }
          child.layout(innerConstraints, parentUsesSize: true);
          final double childSize = _getMainSize(child);
          assert(childSize <= maxChildExtent);
          allocatedSize += childSize;
          allocatedFlexSpace += maxChildExtent;
          crossSize = math.max(crossSize, _getCrossSize(child));
        }
        if (crossAxisAlignment == CrossAxisAlignment.baseline) {
          assert(() {
            if (textBaseline == null)
              throw FlutterError('To use FlexAlignItems.baseline, you must also specify which baseline to use using the "baseline" argument.');
            return true;
          }());
          final double distance = child.getDistanceToBaseline(textBaseline, onlyReal: true);
          if (distance != null) {
            maxBaselineDistance = math.max(maxBaselineDistance, distance);
            maxSizeAboveBaseline = math.max(
              distance,
              maxSizeAboveBaseline,
            );
            maxSizeBelowBaseline = math.max(
              child.size.height - distance,
              maxSizeBelowBaseline,
            );
            crossSize = maxSizeAboveBaseline + maxSizeBelowBaseline;
          }
        }
        final FlexParentData childParentData = child.parentData as FlexParentData;
        child = childParentData.nextSibling;
      }
    }

    // Align items along the main axis.
    final double idealSize = canFlex && mainAxisSize == MainAxisSize.max ? maxMainSize : allocatedSize;
    double actualSize;
    double actualSizeDelta;
    switch (_direction) {
      case Axis.horizontal:
        size = constraints.constrain(Size(idealSize, crossSize));
        actualSize = size.width;
        crossSize = size.height;
        break;
      case Axis.vertical:
        size = constraints.constrain(Size(crossSize, idealSize));
        actualSize = size.height;
        crossSize = size.width;
        break;
    }
    actualSizeDelta = actualSize - allocatedSize;
    _overflow = math.max(0.0, -actualSizeDelta);
    final double remainingSpace = math.max(0.0, actualSizeDelta);
    double leadingSpace;
    double betweenSpace;
    // flipMainAxis is used to decide whether to lay out left-to-right/top-to-bottom (false), or
    // right-to-left/bottom-to-top (true). The _startIsTopLeft will return null if there's only
    // one child and the relevant direction is null, in which case we arbitrarily decide not to
    // flip, but that doesn't have any detectable effect.
    final bool flipMainAxis = !(_startIsTopLeft(direction, textDirection, verticalDirection) ?? true);
    switch (_mainAxisAlignment) {
      case MainAxisAlignment.start:
        leadingSpace = 0.0;
        betweenSpace = 0.0;
        break;
      case MainAxisAlignment.end:
        leadingSpace = remainingSpace;
        betweenSpace = 0.0;
        break;
      case MainAxisAlignment.center:
        leadingSpace = remainingSpace / 2.0;
        betweenSpace = 0.0;
        break;
      case MainAxisAlignment.spaceBetween:
        leadingSpace = 0.0;
        betweenSpace = totalChildren > 1 ? remainingSpace / (totalChildren - 1) : 0.0;
        break;
      case MainAxisAlignment.spaceAround:
        betweenSpace = totalChildren > 0 ? remainingSpace / totalChildren : 0.0;
        leadingSpace = betweenSpace / 2.0;
        break;
      case MainAxisAlignment.spaceEvenly:
        betweenSpace = totalChildren > 0 ? remainingSpace / (totalChildren + 1) : 0.0;
        leadingSpace = betweenSpace;
        break;
    }

    // Position elements
    double childMainPosition = flipMainAxis ? actualSize - leadingSpace : leadingSpace;
    child = _contentBody;
    while (child != null) {
      final FlexParentData childParentData = child.parentData as FlexParentData;
      double childCrossPosition;
      switch (_crossAxisAlignment) {
        case CrossAxisAlignment.start:
        case CrossAxisAlignment.end:
          childCrossPosition = _startIsTopLeft(flipAxis(direction), textDirection, verticalDirection)
              == (_crossAxisAlignment == CrossAxisAlignment.start)
              ? 0.0
              : crossSize - _getCrossSize(child);
          break;
        case CrossAxisAlignment.center:
          childCrossPosition = crossSize / 2.0 - _getCrossSize(child) / 2.0;
          break;
        case CrossAxisAlignment.stretch:
          childCrossPosition = 0.0;
          break;
        case CrossAxisAlignment.baseline:
          childCrossPosition = 0.0;
          if (_direction == Axis.horizontal) {
            assert(textBaseline != null);
            final double distance = child.getDistanceToBaseline(textBaseline, onlyReal: true);
            if (distance != null)
              childCrossPosition = maxBaselineDistance - distance;
          }
          break;
      }

      if (flipMainAxis)
        childMainPosition -= _getMainSize(child);
      switch (_direction) {
        case Axis.horizontal:
          final FlexParentData contentBodyParentData =
              _contentBody.parentData;
          contentBodyParentData.offset =
              Offset(0, _enableHeaderOverlap ? 0.0 : headerTileHeight);
          final FlexParentData headerTileParentData =
              _headerTile.parentData;
          // headerTileParentData.offset = Offset(childMainPosition, childCrossPosition);
          headerTileParentData.offset =
              Offset(childMainPosition, max(min(-headerTileOffset, height - headerTileHeight), 0));
          break;
        case Axis.vertical:
          final FlexParentData contentBodyParentData =
              _contentBody.parentData;
          contentBodyParentData.offset =
              Offset(0, _enableHeaderOverlap ? 0.0 : headerTileHeight);
          final FlexParentData headerTileParentData =
              _headerTile.parentData;
          headerTileParentData.offset =
              Offset(0, max(0, min(-headerTileOffset, height - headerTileHeight)));
          // childParentData.offset = Offset(0, max(0, min(-headerTileOffset, height - headerTileHeight)));
          break;
      }
      if (flipMainAxis) {
        childMainPosition -= betweenSpace;
      } else {
        childMainPosition += _getMainSize(child) + betweenSpace;
      }
      child = childParentData.nextSibling;
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, { Offset position }) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
      defaultPaint(context, offset);
  }


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Axis>('direction', direction));
    properties.add(EnumProperty<MainAxisAlignment>('mainAxisAlignment', mainAxisAlignment));
    properties.add(EnumProperty<MainAxisSize>('mainAxisSize', mainAxisSize));
    properties.add(EnumProperty<CrossAxisAlignment>('crossAxisAlignment', crossAxisAlignment));
    properties.add(EnumProperty<TextDirection>('textDirection', textDirection, defaultValue: null));
    properties.add(EnumProperty<VerticalDirection>('verticalDirection', verticalDirection, defaultValue: null));
    properties.add(EnumProperty<TextBaseline>('textBaseline', textBaseline, defaultValue: null));
  }
}

// class RenderGFStickyHeader extends RenderBox
//     with
//         ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
//         RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
//   RenderGFStickyHeader({
//     @required ScrollableState scrollable,
//     bool enableHeaderOverlap = false,
//     RenderBox header,
//     RenderBox content,
//   })  : assert(scrollable != null),
//         _scrollable = scrollable,
//         _enableHeaderOverlap = enableHeaderOverlap {
//     if (content != null) {
//       add(content);
//     }
//     if (header != null) {
//       add(header);
//     }
//   }
//
//   final ScrollableState _scrollable;
//   final bool _enableHeaderOverlap;
//
//   @override
//   void attach(PipelineOwner owner) {
//     super.attach(owner);
//     _scrollable.position.addListener(markNeedsLayout);
//   }
//
//   @override
//   void detach() {
//     _scrollable.position.removeListener(markNeedsLayout);
//     super.detach();
//   }
//
//   RenderBox get _headerTile => lastChild;
//
//   RenderBox get _contentBody => firstChild;
//
//   @override
//   void performLayout() {
//
//     assert(childCount == 2);
//     _headerTile.layout(constraints.loosen(), parentUsesSize: true);
//     _contentBody.layout(constraints.loosen(), parentUsesSize: true);
//
//     final headerTileHeight = _headerTile.size.height;
//     final contentBodyHeight = _contentBody.size.height;
//
//     final height = max(
//         constraints.minHeight,
//         _enableHeaderOverlap
//             ? contentBodyHeight
//             : headerTileHeight + contentBodyHeight);
//     final width = max(constraints.minWidth, contentBodyHeight);
//
//     size = Size(
//         constraints.constrainWidth(width), constraints.constrainHeight(height));
//
//     final double headerTileOffset = getHeaderTileStuckOffset();
//
//     final MultiChildLayoutParentData contentBodyParentData =
//         _contentBody.parentData;
//     contentBodyParentData.offset =
//         Offset(0, _enableHeaderOverlap ? 0.0 : headerTileHeight);
//
//     final MultiChildLayoutParentData headerTileParentData =
//         _headerTile.parentData;
//     headerTileParentData.offset =
//         Offset(0, max(0, min(-headerTileOffset, height - headerTileHeight)));
//
//   }
//
//   double getHeaderTileStuckOffset() {
//     final scrollableContent = _scrollable.context.findRenderObject();
//     if (scrollableContent.attached) {
//       try {
//         return localToGlobal(Offset.zero, ancestor: scrollableContent).dy;
//         // ignore: avoid_catches_without_on_clauses
//       } catch (e) {
//         print(e);
//       }
//     }
//     return 0;
//   }
//
//
//   @override
//   void setupParentData(RenderObject child) {
//     super.setupParentData(child);
//     child.parentData = MultiChildLayoutParentData();
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     defaultPaint(context, offset);
//   }
// }
