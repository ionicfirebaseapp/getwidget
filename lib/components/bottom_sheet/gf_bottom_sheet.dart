import 'dart:async';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:getwidget/smoothness/gf_smoothness.dart';


class GFBottomSheet extends StatefulWidget {

  GFBottomSheet({
    Key key,
    @required this.stickyHeader,
    @required this.contentBody,
    this.stickyFooter,
    this.controller,
    this.minHeight = 0,
    this.maxHeight = 300,
    this.elevation = 0.0,
    this.smoothness = GFSmoothness.MEDIUM,
    this.stickyFooterHeight,
  })  : assert(elevation >= 0.0),
        assert(minHeight >= 0.0),
        super(key: key) {
    controller.height = minHeight;
    controller.smoothness = smoothness;
    controller == null ? controller = GFBottomSheetController() : Container();
  }

  // This controls the minimum height of the body. Must be greater or equal of
  // 0. By default is 0
  final double minHeight;

  // This controls the minimum height of the body. By default is 500
  final double maxHeight;

  // This is the header of your bottomSheet. This widget is the swipeable area
  // where user will interact. This parameter is required
  final Widget stickyHeader;

  // This is the content that will be hided of your bottomSheet. You can fit any
  // widget. This parameter is required
  final Widget contentBody;

  final Widget stickyFooter;

  // This property is the elevation of the bottomSheet. Must be greater or equal
  // to 0. By default is 0.
  final double elevation;

  // This object used to control behavior internally
  // from the app and don't depend of user's interaction.
  // can hide and show  methods plus have isOpened variable
  // to check widget visibility on a screen
  GFBottomSheetController controller;

  /// default medium
  final int smoothness;

  // default false
  final double stickyFooterHeight;



  @override
  _GFBottomSheetState createState() => _GFBottomSheetState();
}

class _GFBottomSheetState extends State<GFBottomSheet>  with TickerProviderStateMixin {
  bool isDragDirectionUp;
  bool showBottomSheet = false;

  void _onVerticalDragUpdate(data) {
    _setNativeSmoothness();
    if (((widget.controller.height - data.delta.dy) > widget.minHeight) &&
        ((widget.controller.height - data.delta.dy) < widget.maxHeight)) {
      isDragDirectionUp = data.delta.dy <= 0;
      widget.controller.height -= data.delta.dy;
    }
  }

  void _onVerticalDragEnd(data) {
    _setUsersSmoothness();

    if (isDragDirectionUp && widget.controller.value) {
      _showBottomSheet();
    } else if (!isDragDirectionUp && !widget.controller.value) {
      _hideBottomSheet();
    } else {
      widget.controller.value = isDragDirectionUp;
    }
  }

  void _onTap() {
    final bool isBottomSheetOpened = widget.controller.height == widget.maxHeight;
    widget.controller.value = !isBottomSheetOpened;
  }

  Function _controllerListener;

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
    final Widget bottomSheet = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: _onVerticalDragEnd,
          onTap: _onTap,
          child: widget.stickyHeader,
        ),
        AnimatedBuilder(
          animation: widget.controller,
          builder: (_, Widget child) =>
              AnimatedContainer(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: widget.controller.smoothness),
                height: widget.controller.height,
                child: GestureDetector(
                  onVerticalDragUpdate: _onVerticalDragUpdate,
                  onVerticalDragEnd: _onVerticalDragEnd,
                  onTap: _onTap,
                  child: widget.contentBody,
                ),
              ),
        ),
        widget.stickyFooter != null ? AnimatedBuilder(
          animation: widget.controller,
          builder: (_, Widget child) =>
              AnimatedContainer(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: widget.controller.smoothness),
                height: widget.controller.height != widget.minHeight ? widget.stickyFooterHeight : 0.0,
                child: GestureDetector(
                  onVerticalDragUpdate: _onVerticalDragUpdate,
                  onVerticalDragEnd: _onVerticalDragEnd,
                  onTap: _onTap,
                  child: widget.stickyFooter,
                ),
              ),
        ) : Container(),
      ],
    );
    return Material(
      elevation: widget.elevation,
      child: bottomSheet,
    );
  }

  void _hideBottomSheet() {
    widget.controller.height = widget.minHeight;
  }

  void _showBottomSheet() {
    widget.controller.height = widget.maxHeight;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _setUsersSmoothness() {
    widget.controller.smoothness = widget.smoothness;
  }

  void _setNativeSmoothness() {
    widget.controller.smoothness = widget.smoothness;
  }
}

class GFBottomSheetController extends ValueNotifier<bool> {

  GFBottomSheetController() : super(false);

  // This is the current height of the GFBottomSheet's contentBody
  double _height;

  // This is the current smoothness of the bottomSheet
  int  smoothness;

  // This method sets the value of the height
  set height(double value) {
    _height = value;
  }

  // Returns the value of the height
  double get height => _height;

  //  Returns if the solid bottom sheet is opened or not
  bool get isBottomSheetOpened => value;

  // Updates the visibility value to false
  void hideBottomSheet() => value = false;

  // Updates the visibility value to true
  void showBottomSheet() => value = true;

}

