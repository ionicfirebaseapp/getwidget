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
  /// Creates slide show of Images and [Widget] with animation for sliding.
  /// Shows multiple items on one slide, items number depends on rowCount.
  const GFItemsCarousel({
    Key? key,
    required this.rowCount,
    required this.children,
    this.onSlideStart,
    this.onSlide,
    this.onSlideEnd,
    this.itemHeight = 200,
  }) : super(key: key);

  /// Count of visible cells
  final int rowCount;

  /// The widgets to be shown as sliders.
  final List<Widget> children;

  /// When a pointer has contacted the screen and has begun to move.
  final GFItemsCarouselSlideStartCallback? onSlideStart;

  /// When a pointer that is in contact with the screen and moving
  /// has moved again.
  final GFItemsCarouselSlideCallback? onSlide;

  /// When a pointer that was previously in contact with the screen
  /// and moving is no longer in contact with the screen.
  final GFItemsCarouselSlideEndCallback? onSlideEnd;

  /// defines the height of items
  final double itemHeight;

  @override
  _GFItemsCarouselState createState() => _GFItemsCarouselState();
}

class _GFItemsCarouselState extends State<GFItemsCarousel>
    with TickerProviderStateMixin {
  /// In milliseconds
  static const int dragAnimationDuration = 1000;

  /// In milliseconds
  static const int shiftAnimationDuration = 300;

  /// Size of cell
  double size = 0;

  /// Width of cells container
  double width = 0;

  late AnimationController animationController;

  /// Shift of cells container
  late double offset;

  @override
  void initState() {
    offset = 0;
    animationController = AnimationController(
        duration: const Duration(milliseconds: dragAnimationDuration),
        vsync: this);
    Future.delayed(Duration.zero, () {
      setState(() {
        final double localWidth = MediaQuery.of(context).size.width;
        width = localWidth;
        size = width / widget.rowCount;
      });
    });
    super.initState();
  }

  double calculateOffset(double shift) {
    double localOffset = offset + shift;
    final double rightLimit = size * (widget.children.length - widget.rowCount);

    /// Check cells container limits
    if (localOffset > 0) {
      localOffset = 0;
    } else if (localOffset < -rightLimit) {
      localOffset = -rightLimit;
    }
    return localOffset;
  }

  void onSlideStart(DragStartDetails details) {
    animationController.stop();
    if (widget.onSlideStart != null) {
      widget.onSlideStart!(details);
    }
  }

  void onSlide(DragUpdateDetails details) {
    setState(() {
      offset = calculateOffset(3 * details.delta.dx);
    });
    if (widget.onSlide != null) {
      widget.onSlide!(details);
    }
  }

  void onSlideEnd(DragEndDetails details) {
    final double dx = details.velocity.pixelsPerSecond.dx;

    if (dx == 0) {
      return slideAnimation();
    }

    animationController = AnimationController(
        duration: const Duration(milliseconds: dragAnimationDuration),
        vsync: this);

    final Tween tween =
        Tween<double>(begin: offset, end: calculateOffset(0.5 * dx));
    Animation animation;
    animation = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        slideAnimation();
      }
    });
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });

    animationController.forward();
    if (widget.onSlideEnd != null) {
      widget.onSlideEnd!(details);
    }
  }

  void slideAnimation() {
    final double beginAnimation = offset;
    final double endAnimation = size * (offset / size).round().toDouble();
    animationController = AnimationController(
        duration: const Duration(milliseconds: shiftAnimationDuration),
        vsync: this);
    final Tween tween = Tween<double>(begin: beginAnimation, end: endAnimation);
    final Animation animation = tween.animate(animationController);
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragStart: onSlideStart,
        onHorizontalDragUpdate: onSlide,
        onHorizontalDragEnd: onSlideEnd,
        child: Container(
          width: double.infinity,
          height: widget.itemHeight,
          child: Stack(
            children: [
              Positioned(
                left: offset,
                child: Row(
                  children: widget.children
                      .map((child) => Container(
                            width: size,
                            height: widget.itemHeight,
                            child: child,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
}
