library carousel;

import 'dart:async';

import 'package:flutter/material.dart';

/// Signature for when a pointer has contacted the screen and has begun to move.
///
/// The `details` object provides the position of the touch when it first
/// touched the surface.
typedef GFItemsSliderSlideStartCallback = void Function(DragStartDetails details);

/// Signature for when a pointer that is in contact with the screen and moving
/// has moved again.
///
/// The `details` object provides the position of the touch and the distance it
/// has travelled since the last update.
typedef GFItemsSliderSlideCallback = void Function(DragUpdateDetails details);

/// Signature for when a pointer that was previously in contact with the screen
/// and moving is no longer in contact with the screen.
///
/// The velocity at which the pointer was moving when it stopped contacting
/// the screen is available in the `details`.
typedef GFItemsSliderSlideEndCallback = void Function(DragEndDetails details);

/// A widget that show draggable cells with animation.
///
/// Set [rowCount] of visible cells
///
/// Set drag handlers [onSlideStart], [onSlide], [onSlideEnd]
///
/// Set left/right arrows [leftArrow], [rightArrow]
class GFItemsSlider extends StatefulWidget {
  /// Count of visible cells
  int rowCount;

  List<Widget> children;

  /// Signature for when a pointer has contacted the screen and has begun to move.
  GFItemsSliderSlideStartCallback onSlideStart;

  /// Signature for when a pointer that is in contact with the screen and moving
  /// has moved again.
  GFItemsSliderSlideCallback onSlide;

  /// Signature for when a pointer that was previously in contact with the screen
  /// and moving is no longer in contact with the screen.
  GFItemsSliderSlideEndCallback onSlideEnd;

  GFItemsSlider({
    this.rowCount,
    this.children,
    this.onSlideStart,
    this.onSlide,
    this.onSlideEnd
  });

  @override
  _GFItemsSliderState createState() => new _GFItemsSliderState();
}

class _GFItemsSliderState extends State<GFItemsSlider> with TickerProviderStateMixin {
  /// In milliseconds
  static final int DRAG_ANIMATION_DURATION = 1000;

  /// In milliseconds
  static final int SHIFT_ANIMATION_DURATION = 300;

  /// Size of cell
  double size = 0;

  /// Width of cells container
  double width = 0;

  AnimationController animationController;

  /// Shift of cells container
  double offset;

  @override
  void initState() {
    super.initState();

    this.offset = 0;

    this.animationController = AnimationController(
        duration: new Duration(milliseconds: DRAG_ANIMATION_DURATION),
        vsync: this
    );

    new Future.delayed(Duration.zero, () {
      this.setState(() {

        double width = MediaQuery.of(context).size.width;
        this.width = width;
        this.size = this.width / widget.rowCount;
      });
    });
  }

  double calculateOffset(double shift) {
    double offset = this.offset + shift;
    double rightLimit = this.size * (widget.children.length - widget.rowCount);

    /// Check cells container limits
    if (offset > 0) {
      offset = 0;
    } else if (offset < -rightLimit) {
      offset = -rightLimit;
    }

    return offset;
  }

  onSlideStart(DragStartDetails details) {
    this.animationController.stop();
    widget.onSlideStart != null ? widget.onSlideStart(details) : null;
  }

  onSlide(DragUpdateDetails details) {
    setState(() {
      this.offset = this.calculateOffset(3 * details.delta.dx);
    });

    widget.onSlide != null ? widget.onSlide(details) : null;
  }

  onSlideEnd(DragEndDetails details) {
    double dx = details.velocity.pixelsPerSecond.dx;

    if (dx == 0) {
      return this.runShiftAnimation();
    }

    this.animationController = new AnimationController(
        duration: new Duration(milliseconds: DRAG_ANIMATION_DURATION),
        vsync: this
    );

    Tween tween = new Tween<double>(
        begin: this.offset,
        end: this.calculateOffset(0.5 * dx)
    );

    Animation animation = tween.animate(
        new CurvedAnimation(
          parent: this.animationController,
          curve: Curves.easeOut,
        )
    );

    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        this.runShiftAnimation();
      }
    });

    animation.addListener(() {
      setState(() {
        this.offset = animation.value;
      });
    });

    this.animationController.forward();
    widget.onSlideEnd != null ? widget.onSlideEnd(details) : null;
  }

  runShiftAnimation() {
    double beginAnimation = this.offset;
    double endAnimation =
        this.size * (this.offset / this.size).round().toDouble();

    this.animationController = new AnimationController(
        duration: new Duration(milliseconds: SHIFT_ANIMATION_DURATION),
        vsync: this
    );
    Tween tween = new Tween<double>(begin: beginAnimation, end: endAnimation);
    Animation animation = tween.animate(this.animationController);

    animation.addListener(() {
      setState(() {
        this.offset = animation.value;
      });
    });

    this.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: this.onSlideStart,
      onHorizontalDragUpdate: this.onSlide,
      onHorizontalDragEnd: this.onSlideEnd,
      child: Container(
        width: double.infinity,
        height: this.size,
        child: Stack(
            children: [
              Positioned(
                left: this.offset,
                child: Row(
                  children: widget.children.map((child) {
                    return Container(
                      width: this.size,
                      height: this.size,
                      child: child,
                    );
                  }).toList(),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
