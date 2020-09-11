import 'package:flutter/material.dart';

class GFBottomSheet extends StatefulWidget {
  GFBottomSheet({
    Key key,
    @required this.stickyHeader,
    @required this.contentBody,
    this.stickyFooter,
    this.controller,
    this.minContentHeight = 0,
    this.maxContentHeight = 300,
    this.elevation = 0.0,
    this.stickyFooterHeight,
  })  : assert(elevation >= 0.0),
        assert(minContentHeight >= 0.0),
        super(key: key) {
    controller.height = minContentHeight;
    controller.smoothness = 500;
  }

  /// [minContentHeight] controls the minimum height of the content body.
  /// It Must be greater or equal to 0. Default value is 0.
  final double minContentHeight;

  /// [maxContentHeight] controls the maximum height of the content body.
  /// It Must be greater or equal to 0. Default value is 300.
  final double maxContentHeight;

  /// [stickyHeader] is the header of GFBottomSheet.
  /// User can interact by swiping or tapping the [stickyHeader]
  final Widget stickyHeader;

  /// [contentBody] is the body of GFBottomSheet.
  /// User can interact by tapping the [contentBody]
  final Widget contentBody;

  /// [stickyFooter] is the footer of GFBottomSheet.
  /// User can interact by swiping or tapping the [stickyFooter]
  final Widget stickyFooter;

  /// [stickyFooterHeight] defines the height of GFBottokSheet footer.
  final double stickyFooterHeight;

  /// [elevation] controls shadow below the GFBottomSheet material.
  /// Must be greater or equalto 0. Default value is 0.
  final double elevation;

  /// [controller] used to control GFBottomSheet behavior like hide/show
  final GFBottomSheetController controller;

  @override
  _GFBottomSheetState createState() => _GFBottomSheetState();
}

class _GFBottomSheetState extends State<GFBottomSheet>
    with TickerProviderStateMixin {
  bool isDragDirectionUp;
  bool showBottomSheet = false;
  Function _controllerListener;

  void _onVerticalDragUpdate(data) {
    _setSmoothness();
    if (((widget.controller.height - data.delta.dy) >
            widget.minContentHeight) &&
        ((widget.controller.height - data.delta.dy) <
            widget.maxContentHeight)) {
      isDragDirectionUp = data.delta.dy <= 0;
      widget.controller.height -= data.delta.dy;
    }
  }

  void _onVerticalDragEnd(data) {
    _setSmoothness();
    if (isDragDirectionUp && widget.controller.value) {
      _showBottomSheet();
    } else if (!isDragDirectionUp && !widget.controller.value) {
      _hideBottomSheet();
    } else {
      widget.controller.value = isDragDirectionUp;
    }
  }

  void _onTap() {
    final bool isBottomSheetOpened =
        widget.controller.height == widget.maxContentHeight;
    widget.controller.value = !isBottomSheetOpened;
  }

  @override
  void initState() {
    super.initState();

    widget.controller.value = showBottomSheet;
    _controllerListener = () {
      widget.controller.value ? _showBottomSheet() : _hideBottomSheet();
    };
    widget.controller.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme =
        Theme.of(context).bottomSheetTheme;
    final double elevation =
        widget.elevation ?? bottomSheetTheme.elevation ?? 0;

    final Widget bottomSheet = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.stickyHeader == null
            ? Container()
            : GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                onTap: _onTap,
                child: widget.stickyHeader,
              ),
        AnimatedBuilder(
          animation: widget.controller,
          builder: (_, Widget child) => AnimatedContainer(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: widget.controller.smoothness),
            height: widget.controller.height,
            child: GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                onTap: _onTap,
                child: widget.contentBody),
          ),
        ),
        widget.stickyFooter != null
            ? AnimatedBuilder(
                animation: widget.controller,
                builder: (_, Widget child) => AnimatedContainer(
                  curve: Curves.easeOut,
                  duration:
                      Duration(milliseconds: widget.controller.smoothness),
                  height: widget.controller.height != widget.minContentHeight
                      ? widget.stickyFooterHeight
                      : 0.0,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    onTap: _onTap,
                    child: widget.stickyFooter,
                  ),
                ),
              )
            : Container(),
      ],
    );
    return Material(
      elevation: elevation,
      child: bottomSheet,
    );
  }

  void _hideBottomSheet() {
    widget.controller.height = widget.minContentHeight;
  }

  void _showBottomSheet() {
    widget.controller.height = widget.maxContentHeight;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _setSmoothness() {
    widget.controller.smoothness = 500;
  }
}

class GFBottomSheetController extends ValueNotifier<bool> {
  GFBottomSheetController() : super(false);

  /// Defines the height of the GFBottomSheet's contentBody
  double _height;

  /// Defines the drag animation smoothness of the GFBottomSheet
  int smoothness;

  // ignore: unnecessary_getters_setters
  set height(double value) => _height = value;

  // ignore: unnecessary_getters_setters
  double get height => _height;

  bool get isBottomSheetOpened => value;

  void hideBottomSheet() => value = false;
  void showBottomSheet() => value = true;
}
