library carousel;

import 'dart:async';

import 'package:flutter/material.dart';

/// Signature for when a pointer has contacted the screen and has begun to move.
///
/// The `details` object provides the position of the touch when it first
/// touched the surface.
typedef GFItemsCarouselSlideStartCallback = void Function(
    DragStartDetails details);

/// Signature for when a pointer that is in contact with the screen and moving
/// has moved again.
///
/// The `details` object provides the position of the touch and the distance it
/// has travelled since the last update.
typedef GFItemsCarouselSlideCallback = void Function(DragUpdateDetails details);

/// Signature for when a pointer that was previously in contact with the screen
/// and moving is no longer in contact with the screen.
///
/// The velocity at which the pointer was moving when it stopped contacting
/// the screen is available in the `details`.
typedef GFItemsCarouselSlideEndCallback = void Function(DragEndDetails details);

/// A widget that show draggable cells with animation.
///
/// Set [rowCount] of visible cells
///
/// Set drag handlers [onSlideStart], [onSlide], [onSlideEnd]
///
/// Set left/right arrows [leftArrow], [rightArrow]
class GFItemsCarousel extends StatefulWidget {
  /// Count of visible cells
  final int rowCount;

  final List<Widget> children;

  /// Signature for when a pointer has contacted the screen and has begun to move.
  final GFItemsCarouselSlideStartCallback onSlideStart;

  /// Signature for when a pointer that is in contact with the screen and moving
  /// has moved again.
  final GFItemsCarouselSlideCallback onSlide;

  /// Signature for when a pointer that was previously in contact with the screen
  /// and moving is no longer in contact with the screen.
  final GFItemsCarouselSlideEndCallback onSlideEnd;

  GFItemsCarousel(
      {this.rowCount,
      this.children,
      this.onSlideStart,
      this.onSlide,
      this.onSlideEnd});

  @override
  _GFItemsCarouselState createState() => new _GFItemsCarouselState();
}

class _GFItemsCarouselState extends State<GFItemsCarousel>
    with TickerProviderStateMixin {
  /// In milliseconds
  static final int dragAnimationDuration = 1000;

  /// In milliseconds
  static final int shiftAnimationDuration = 300;

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
        duration: new Duration(milliseconds: dragAnimationDuration),
        vsync: this);

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
    if (widget.onSlideStart != null) widget.onSlideStart(details);
  }

  onSlide(DragUpdateDetails details) {
    setState(() {
      this.offset = this.calculateOffset(3 * details.delta.dx);
    });

    if (widget.onSlide != null) widget.onSlide(details);
  }

  onSlideEnd(DragEndDetails details) {
    double dx = details.velocity.pixelsPerSecond.dx;

    if (dx == 0) {
      return this.runShiftAnimation();
    }

    this.animationController = new AnimationController(
        duration: new Duration(milliseconds: dragAnimationDuration),
        vsync: this);

    Tween tween = new Tween<double>(
        begin: this.offset, end: this.calculateOffset(0.5 * dx));

    Animation animation = tween.animate(new CurvedAnimation(
      parent: this.animationController,
      curve: Curves.easeOut,
    ));

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
    if (widget.onSlideEnd != null) widget.onSlideEnd(details);
  }

  runShiftAnimation() {
    double beginAnimation = this.offset;
    double endAnimation =
        this.size * (this.offset / this.size).round().toDouble();

    this.animationController = new AnimationController(
        duration: new Duration(milliseconds: shiftAnimationDuration),
        vsync: this);
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
        child: Stack(children: [
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
        ]),
      ),
    );
  }
}
