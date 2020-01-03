import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Horizontal padding for widget
const EdgeInsets _horizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);

// Minimum height of the segmented control.
const double _minSegmentHeight = 28.0;

// The duration of the fade animation when a color gets selected
// and unselected
const Duration _colorFadeDuration = Duration(milliseconds: 222);

/// Material Segmented Control
///
/// A segmented control like the one for iOS, but in Material Design.
///
/// You can use any [Widget] to make it a segmented item. Simply
/// define a [Map] with indices.
///
/// [onSegmentChosen] is called whenever a segmented item is clicked.
/// You need to pass it to [selectionIndex] to tell MSC what index
/// is currently selected. Make sure to update it via [setState].
///
/// The [children] are displayed in increasing order of the indeces
/// given in the [Map].
/// The width for an item is set to the width of the largest child.
///
/// [selectedColor] and [unselectedColor] are set to [Colors.blue]
/// and [Colors.white] when they are null and are not explicitly
/// required but recommended to set for your needs.
class MaterialSegmentedControl<T> extends StatefulWidget {
  /// Default disabledColor
  static const Color _kDisabledDefaultColor = Color(0xFFE0E0E0);

  MaterialSegmentedControl({
    Key key,
    @required this.children,
    @required this.onSegmentChosen,
    @required this.unselectedColor,
    @required this.selectedColor,
    this.disabledChildren,
    this.selectionIndex,
    this.borderColor,
    this.verticalOffset = 12.0,
    this.borderRadius = 32.0,
    this.disabledColor = _kDisabledDefaultColor,
    this.horizontalPadding = _horizontalPadding,
  })  : assert(children != null),
        assert(
        (disabledChildren == null ||
            (disabledColor != null && disabledChildren != null)),
        'Do not set disabled color to null if you have disabled children!'),
        assert(children.length >= 2),
        assert(onSegmentChosen != null),
        assert(selectedColor != null),
        assert(unselectedColor != null),
        assert(
        selectionIndex == null ||
            children.keys.any((T child) => child == selectionIndex),
        'The groupValue must be either null or one of the keys in the children map.',
        ),
        super(key: key);

  /// The children to use. They need to live inside a [Map]
  /// with indices; make sure they are in increasing order.
  /// {@tool sample}
  ///
  /// ```dart
  /// Map<int, Widget> children() => {
  ///  0: Text('Sec 1'),
  ///  1: Text('Sec 2'),
  ///  2: Text('Sec 3'),
  /// }
  /// ```
  /// {@end-tool}
  final Map<T, Widget> children;

  /// Currently selected item index. Make sure to pass the value
  /// from [onSegmentChosen] to see the selection state.
  final T selectionIndex;

  /// The callback to use when a segmented item is chosen
  final ValueChanged<T> onSegmentChosen;

  /// Unselected color.
  ///
  /// [Colors.white] by default if null
  final Color unselectedColor;

  /// Selected color.
  ///
  /// [Colors.blue] by default if null
  final Color selectedColor;

  /// The background color to use if a child is disabled
  /// by [disabledChildren]. Defaults to [Colors.grey].
  final Color disabledColor;

  /// Color used as border color.
  ///
  /// [Colors.grey] by default if null.
  final Color borderColor;

  /// The border radius used on the left and right side.
  ///
  /// Defaults to 32.0 if null
  final double borderRadius;

  /// The horizontal padding to apply to the entire widget.
  ///
  /// Defaults to 16 if null
  final EdgeInsets horizontalPadding;

  /// The padding of a child, vertically.
  /// You can use this to control the height of the widget in most cases.
  final double verticalOffset;

  /// Define the children to disable.
  /// Giving an empty list or null enables all children.
  final List<T> disabledChildren;

  @override
  _SegmentedControlState<T> createState() => _SegmentedControlState<T>();
}

class _SegmentedControlState<T> extends State<MaterialSegmentedControl<T>>
    with TickerProviderStateMixin<MaterialSegmentedControl<T>> {
  T _pressedKey;

  final List<AnimationController> _selectionControllers =
  <AnimationController>[];
  final List<ColorTween> _childTweens = <ColorTween>[];

  ColorTween _forwardBackgroundColorTween;
  ColorTween _reverseBackgroundColorTween;
  ColorTween _textColorTween;

  Color _selectedColor;
  Color _unselectedColor;
  Color _selectedTextColor;
  Color _unselectedTextColor;
  Color _borderColor;
  Color _pressedColor;

  AnimationController createAnimationController() {
    return AnimationController(
      duration: _colorFadeDuration,
      vsync: this,
    )..addListener(() {
      setState(() {
        // State of background/text colors has changed
      });
    });
  }

  bool _updateColors() {
    assert(mounted, 'This should only be called after didUpdateDependencies');
    bool changed = false;
    final Color selectedColor = widget.selectedColor ?? Colors.blue;
    if (_selectedColor != selectedColor) {
      changed = true;
      _selectedColor = selectedColor;
    }
    final Color unselectedColor = widget.unselectedColor ?? Colors.white;
    if (_unselectedColor != unselectedColor) {
      changed = true;
      _unselectedColor = unselectedColor;
    }
    final Color borderColor = widget.borderColor ?? Colors.grey;
    if (_borderColor != borderColor) {
      changed = true;
      _borderColor = borderColor;
    }
    final Color pressedColor = widget.selectedColor.withOpacity(0.2);
    if (_pressedColor != pressedColor) {
      changed = true;
      _pressedColor = pressedColor;
    }

    _selectedTextColor = _selectedColor;
    _unselectedTextColor = _unselectedColor;

    _forwardBackgroundColorTween = ColorTween(
      begin: _pressedColor,
      end: _selectedColor,
    );
    _reverseBackgroundColorTween = ColorTween(
      begin: _unselectedColor,
      end: _selectedColor,
    );
    _textColorTween = ColorTween(
      begin: _selectedColor,
      end: _unselectedColor,
    );
    return changed;
  }

  void _updateAnimationControllers() {
    assert(mounted, 'This should only be called after didUpdateDependencies');
    for (AnimationController controller in _selectionControllers) {
      controller.dispose();
    }
    _selectionControllers.clear();
    _childTweens.clear();

    for (T key in widget.children.keys) {
      final AnimationController animationController =
      createAnimationController();
      if (widget.selectionIndex == key) {
        _childTweens.add(_reverseBackgroundColorTween);
        animationController.value = 1.0;
      } else {
        _childTweens.add(_forwardBackgroundColorTween);
      }
      _selectionControllers.add(animationController);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_updateColors()) {
      _updateAnimationControllers();
    }
  }

  @override
  void didUpdateWidget(MaterialSegmentedControl<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_updateColors() ||
        oldWidget.children.length != widget.children.length) {
      _updateAnimationControllers();
    }

    if (oldWidget.selectionIndex != widget.selectionIndex) {
      int index = 0;
      for (T key in widget.children.keys) {
        if (widget.selectionIndex == key) {
          _childTweens[index] = _forwardBackgroundColorTween;
          _selectionControllers[index].forward();
        } else {
          _childTweens[index] = _reverseBackgroundColorTween;
          _selectionControllers[index].reverse();
        }
        index += 1;
      }
    }
  }

  @override
  void dispose() {
    for (AnimationController animationController in _selectionControllers) {
      animationController.dispose();
    }
    super.dispose();
  }

  void _onTapDown(T currentKey) {
    if (_pressedKey == null && currentKey != widget.selectionIndex) {
      setState(() {
        _pressedKey = currentKey;
      });
    }
  }

  void _onTapCancel() {
    setState(() {
      _pressedKey = null;
    });
  }

  void _onTap(T currentKey) {
    if (currentKey != widget.selectionIndex && currentKey == _pressedKey) {
      widget.onSegmentChosen(currentKey);
      _pressedKey = null;
    }
  }

  Color getTextColor(int index, T currentKey) {
    if (_selectionControllers[index].isAnimating)
      return _textColorTween.evaluate(_selectionControllers[index]);
    if (widget.selectionIndex == currentKey) return _unselectedTextColor;
    return _selectedTextColor;
  }

  Color getBackgroundColor(int index, T currentKey) {
    if (_selectionControllers[index].isAnimating)
      return _childTweens[index].evaluate(_selectionControllers[index]);
    if (widget.selectionIndex == currentKey) return _selectedColor;
    if (_pressedKey == currentKey) return _pressedColor;
    return _unselectedColor;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _gestureChildren = <Widget>[];
    final List<Color> _backgroundColors = <Color>[];
    int index = 0;
    int selectedIndex;
    int pressedIndex;
    for (T currentKey in widget.children.keys) {
      selectedIndex =
      (widget.selectionIndex == currentKey) ? index : selectedIndex;
      pressedIndex = (_pressedKey == currentKey) ? index : pressedIndex;

      final TextStyle textStyle = DefaultTextStyle.of(context).style.copyWith(
        color: getTextColor(index, currentKey),
      );
      final IconThemeData iconTheme = IconThemeData(
        color: getTextColor(index, currentKey),
      );

      final bool checkDisabledExist =
          widget.disabledChildren != null && widget.disabledChildren.isNotEmpty;
      final bool checkDisabledChild =
          checkDisabledExist && widget.disabledChildren.contains(currentKey);

      Widget child = Center(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: widget.verticalOffset),
            child: widget.children[currentKey]),
      );

      child = InkWell(
        splashColor: widget.selectedColor.withOpacity(0.185),
        highlightColor: widget.selectedColor.withOpacity(0.4),
        borderRadius: _calculateBorderRadius(index),
        onTapDown: checkDisabledChild
            ? null
            : (TapDownDetails event) {
          _onTapDown(currentKey);
        },
        onTapCancel: checkDisabledChild ? null : _onTapCancel,
        onTap: checkDisabledChild
            ? null
            : () {
          _onTap(currentKey);
        },
        child: IconTheme(
          data: iconTheme,
          child: DefaultTextStyle(
            style: textStyle,
            child: Semantics(
              button: true,
              inMutuallyExclusiveGroup: true,
              selected: widget.selectionIndex == currentKey,
              child: child,
            ),
          ),
        ),
      );

      _backgroundColors.add(checkDisabledChild
          ? widget.disabledColor
          : getBackgroundColor(index, currentKey));
      _gestureChildren.add(child);
      index += 1;
    }

    final Widget box = _SegmentedControlRenderWidget<T>(
      children: _gestureChildren,
      selectedIndex: selectedIndex,
      pressedIndex: pressedIndex,
      backgroundColors: _backgroundColors,
      borderColor: _borderColor,
      borderRadius: widget.borderRadius,
    );

    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: widget.horizontalPadding.resolve(Directionality.of(context)),
        child: UnconstrainedBox(
          constrainedAxis: Axis.horizontal,
          child: box,
        ),
      ),
    );
  }

  BorderRadius _calculateBorderRadius(int index) {
    return index == 0
        ? BorderRadius.only(
      topLeft: Radius.circular(widget.borderRadius),
      bottomLeft: Radius.circular(widget.borderRadius),
    )
        : index == (widget.children.length - 1)
        ? BorderRadius.only(
      topRight: Radius.circular(widget.borderRadius),
      bottomRight: Radius.circular(widget.borderRadius),
    )
        : null;
  }
}

class _SegmentedControlRenderWidget<T> extends MultiChildRenderObjectWidget {
  _SegmentedControlRenderWidget({
    Key key,
    List<Widget> children = const <Widget>[],
    @required this.selectedIndex,
    @required this.pressedIndex,
    @required this.backgroundColors,
    @required this.borderColor,
    @required this.borderRadius,
  }) : super(
    key: key,
    children: children,
  );

  final int selectedIndex;
  final int pressedIndex;
  final List<Color> backgroundColors;
  final Color borderColor;
  final double borderRadius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSegmentedControl<T>(
      textDirection: Directionality.of(context),
      selectedIndex: selectedIndex,
      pressedIndex: pressedIndex,
      backgroundColors: backgroundColors,
      borderColor: borderColor,
      borderRadius: borderRadius,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderSegmentedControl<T> renderObject) {
    renderObject
      ..textDirection = Directionality.of(context)
      ..selectedIndex = selectedIndex
      ..pressedIndex = pressedIndex
      ..backgroundColors = backgroundColors
      ..borderColor = borderColor;
  }
}

class _SegmentedControlContainerBoxParentData
    extends ContainerBoxParentData<RenderBox> {
  RRect surroundingRect;
}

typedef _NextChild = RenderBox Function(RenderBox child);

class _RenderSegmentedControl<T> extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox,
            ContainerBoxParentData<RenderBox>>,
        RenderBoxContainerDefaultsMixin<RenderBox,
            ContainerBoxParentData<RenderBox>> {
  _RenderSegmentedControl({
    List<RenderBox> children,
    @required int selectedIndex,
    @required int pressedIndex,
    @required TextDirection textDirection,
    @required List<Color> backgroundColors,
    @required Color borderColor,
    @required double borderRadius,
  })  : assert(textDirection != null),
        assert(borderRadius != null),
        _textDirection = textDirection,
        _selectedIndex = selectedIndex,
        _pressedIndex = pressedIndex,
        _backgroundColors = backgroundColors,
        _borderColor = borderColor,
        _borderRadius = borderRadius {
    addAll(children);
  }

  double _borderRadius;
  int get selectedIndex => _selectedIndex;
  int _selectedIndex;
  set selectedIndex(int value) {
    if (_selectedIndex == value) {
      return;
    }
    _selectedIndex = value;
    markNeedsPaint();
  }

  int get pressedIndex => _pressedIndex;
  int _pressedIndex;
  set pressedIndex(int value) {
    if (_pressedIndex == value) {
      return;
    }
    _pressedIndex = value;
    markNeedsPaint();
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value) {
      return;
    }
    _textDirection = value;
    markNeedsLayout();
  }

  List<Color> get backgroundColors => _backgroundColors;
  List<Color> _backgroundColors;
  set backgroundColors(List<Color> value) {
    if (_backgroundColors == value) {
      return;
    }
    _backgroundColors = value;
    markNeedsPaint();
  }

  Color get borderColor => _borderColor;
  Color _borderColor;
  set borderColor(Color value) {
    if (_borderColor == value) {
      return;
    }
    _borderColor = value;
    markNeedsPaint();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    RenderBox child = firstChild;
    double minWidth = 0.0;
    while (child != null) {
      final _SegmentedControlContainerBoxParentData childParentData =
          child.parentData;
      final double childWidth = child.getMinIntrinsicWidth(height);
      minWidth = math.max(minWidth, childWidth);
      child = childParentData.nextSibling;
    }
    return minWidth * childCount;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    RenderBox child = firstChild;
    double maxWidth = 0.0;
    while (child != null) {
      final _SegmentedControlContainerBoxParentData childParentData =
          child.parentData;
      final double childWidth = child.getMaxIntrinsicWidth(height);
      maxWidth = math.max(maxWidth, childWidth);
      child = childParentData.nextSibling;
    }
    return maxWidth * childCount;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    RenderBox child = firstChild;
    double minHeight = 0.0;
    while (child != null) {
      final _SegmentedControlContainerBoxParentData childParentData =
          child.parentData;
      final double childHeight = child.getMinIntrinsicHeight(width);
      minHeight = math.max(minHeight, childHeight);
      child = childParentData.nextSibling;
    }
    return minHeight;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    RenderBox child = firstChild;
    double maxHeight = 0.0;
    while (child != null) {
      final _SegmentedControlContainerBoxParentData childParentData =
          child.parentData;
      final double childHeight = child.getMaxIntrinsicHeight(width);
      maxHeight = math.max(maxHeight, childHeight);
      child = childParentData.nextSibling;
    }
    return maxHeight;
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _SegmentedControlContainerBoxParentData) {
      child.parentData = _SegmentedControlContainerBoxParentData();
    }
  }

  void _layoutRects(
      _NextChild nextChild, RenderBox leftChild, RenderBox rightChild) {
    RenderBox child = leftChild;
    double start = 0.0;
    while (child != null) {
      final _SegmentedControlContainerBoxParentData childParentData =
          child.parentData;
      final Offset childOffset = Offset(start, 0.0);
      childParentData.offset = childOffset;
      final Rect childRect =
      Rect.fromLTWH(start, 0.0, child.size.width, child.size.height);
      RRect rChildRect;
      if (child == leftChild) {
        rChildRect = RRect.fromRectAndCorners(childRect,
            topLeft: Radius.circular(_borderRadius),
            bottomLeft: Radius.circular(_borderRadius));
      } else if (child == rightChild) {
        rChildRect = RRect.fromRectAndCorners(childRect,
            topRight: Radius.circular(_borderRadius),
            bottomRight: Radius.circular(_borderRadius));
      } else {
        rChildRect = RRect.fromRectAndCorners(childRect);
      }
      childParentData.surroundingRect = rChildRect;
      start += child.size.width;
      child = nextChild(child);
    }
  }

  @override
  void performLayout() {
    double maxHeight = _minSegmentHeight;

    double childWidth = constraints.minWidth / childCount;
    for (RenderBox child in getChildrenAsList()) {
      childWidth =
          math.max(childWidth, child.getMaxIntrinsicWidth(double.infinity));
    }
    childWidth = math.min(childWidth, constraints.maxWidth / childCount);

    RenderBox child = firstChild;
    while (child != null) {
      final double boxHeight = child.getMaxIntrinsicHeight(childWidth);
      maxHeight = math.max(maxHeight, boxHeight);
      child = childAfter(child);
    }

    constraints.constrainHeight(maxHeight);

    final BoxConstraints childConstraints = BoxConstraints.tightFor(
      width: childWidth,
      height: maxHeight,
    );

    child = firstChild;
    while (child != null) {
      child.layout(childConstraints, parentUsesSize: true);
      child = childAfter(child);
    }

    switch (textDirection) {
      case TextDirection.rtl:
        _layoutRects(
          childBefore,
          lastChild,
          firstChild,
        );
        break;
      case TextDirection.ltr:
        _layoutRects(
          childAfter,
          firstChild,
          lastChild,
        );
        break;
    }

    size = constraints.constrain(Size(childWidth * childCount, maxHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    RenderBox child = firstChild;
    int index = 0;
    while (child != null) {
      _paintChild(context, offset, child, index);
      child = childAfter(child);
      index += 1;
    }
  }

  void _paintChild(
      PaintingContext context, Offset offset, RenderBox child, int childIndex) {
    assert(child != null);

    final _SegmentedControlContainerBoxParentData childParentData =
        child.parentData;

    context.canvas.drawRRect(
      childParentData.surroundingRect.shift(offset),
      Paint()
        ..color = backgroundColors[childIndex]
        ..style = PaintingStyle.fill,
    );
    context.canvas.drawRRect(
      childParentData.surroundingRect.shift(offset),
      Paint()
        ..color = borderColor
        ..strokeWidth = 0.7
        ..style = PaintingStyle.stroke,
    );

    context.paintChild(child, childParentData.offset + offset);
  }

  @override
  bool hitTestChildren(HitTestResult result, {@required Offset position}) {
    assert(position != null);
    RenderBox child = lastChild;
    while (child != null) {
      final _SegmentedControlContainerBoxParentData childParentData =
          child.parentData;
      if (childParentData.surroundingRect.contains(position)) {
        return child.hitTest(result,
            position: (Offset.zero & child.size).center);
      }
      child = childParentData.previousSibling;
    }
    return false;
  }
}