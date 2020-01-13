import 'dart:async';
import 'package:flutter/material.dart';

/// When a pointer has come to contact with screen and has begun to move.
///
/// The function provides the position of the touch when it first
/// touched the surface.
typedef GFItemsCarouselSlideStartCallback = void Function(
    DragStartDetails details);

/// When a pointer that is in contact with the screen and moving
/// has moved again.
///
/// The function provides the position of the touch and the distance it
/// has travelled since the last update.
typedef GFItemsCarouselSlideCallback = void Function(DragUpdateDetails details);

/// When a pointer that was previously in contact with the screen
/// and moving is no longer in contact with the screen.
///
/// The velocity at which the pointer was moving when it stopped contacting
/// the screen.
typedef GFItemsCarouselSlideEndCallback = void Function(DragEndDetails details);

class GFItemsCarousel extends StatefulWidget {

  /// Count of visible cells
  final int rowCount;

  /// The widgets to be shown as sliders.
  final List<Widget> children;

  /// When a pointer has contacted the screen and has begun to move.
  final GFItemsCarouselSlideStartCallback onSlideStart;

  /// When a pointer that is in contact with the screen and moving
  /// has moved again.
  final GFItemsCarouselSlideCallback onSlide;

  /// When a pointer that was previously in contact with the screen
  /// and moving is no longer in contact with the screen.
  final GFItemsCarouselSlideEndCallback onSlideEnd;

  /// Creates slide show of [Images] and [Widget] with animation for sliding.
  /// Shows multiple items on one slide, items number depends on rowCount.

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
      return this.slideAnimation();
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
        this.slideAnimation();
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

  slideAnimation() {
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
