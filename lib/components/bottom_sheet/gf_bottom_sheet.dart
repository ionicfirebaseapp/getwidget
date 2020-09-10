import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getwidget/smoothness/gf_smoothness.dart';


class GFBottomSheet extends StatefulWidget {
  // This controls the minimum height of the body. Must be greater or equal of
  // 0. By default is 0
  final double minHeight;

  // This controls the minimum height of the body. By default is 500
  final double maxHeight;

  // This is the content that will be hided of your bottomSheet. You can fit any
  // widget. This parameter is required
  final Widget contentBody;

  // This is the header of your bottomSheet. This widget is the swipeable area
  // where user will interact. This parameter is required
  final Widget stickyHeader;

  final Widget stickyFooter;

  // This property is the elevation of the bottomSheet. Must be greater or equal
  // to 0. By default is 0.
  final double elevation;

  // This object used to control behavior internally
  // from the app and don't depend of user's interaction.
  // can hide and show  methods plus have isOpened variable
  // to check widget visibility on a screen
  GFBottomSheeetController controller;

  final int smoothness;

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
  })  : assert(elevation >= 0.0),
        assert(minHeight >= 0.0),
        super(key: key) {
    if (controller == null) {
      this.controller = GFBottomSheeetController();
    }
    this.controller.height = this.minHeight;
    this.controller.Smoothness = smoothness;
  }

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
      _show();
    } else if (!isDragDirectionUp && !widget.controller.value) {
      _hide();
    } else {
      widget.controller.value = isDragDirectionUp;
    }
  }

  void _onTap() {
    final bool isOpened = widget.controller.height == widget.maxHeight;
    widget.controller.value = !isOpened;
  }

  Function _controllerListener;

  @override
  void initState() {
    super.initState();
    widget.controller.value = showBottomSheet;
    _controllerListener = () {
      widget.controller.value ? _show() : _hide();
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
          child: Container(
            decoration: widget.elevation > 0
                ? BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: widget.elevation,
              ),
            ])
                : null,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: widget.stickyHeader,
          ),
        ),
        AnimatedBuilder(
        animation: widget.controller,
        builder: (_, Widget child) =>
            AnimatedContainer(
              curve: Curves.easeOut,
              duration: Duration(milliseconds: widget.controller.Smoothness),
              height: widget.controller.height,
              child: GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                onTap: _onTap,
                child: widget.contentBody,
              ),
            ),
        ),
        widget.controller.height == 0
            ? widget.stickyFooter
            : Container()
      ],
    );
    return bottomSheet;
  }

  void _hide() {
    widget.controller.height = widget.minHeight;
  }

  void _show() {
    widget.controller.height = widget.maxHeight;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _setUsersSmoothness() {
    widget.controller.Smoothness = widget.smoothness;
  }

  void _setNativeSmoothness() {
    widget.controller.Smoothness = widget.smoothness;
  }
}

class GFBottomSheeetController extends ValueNotifier<bool> {
//  SolidBloc _bloc = SolidBloc();

  // This is the current height of the bottomSheet's body
  double _height;

  // This is the current smoothness of the bottomSheet
  int  Smoothness;

  GFBottomSheeetController() : super(false);

//  // Returns the value of the height as stream
//  Stream<double> get heightStream => _bloc.height;
//
//  // Returns the value of the visibility as stream
//  Stream<bool> get isOpenStream => _bloc.isOpen;

  // This method sets the value of the height using streams
  set height(double value) {
    _height = value;
//    _bloc.dispatch(value);
  }

  // Returns the value of the height
  double get height => _height;

  //  Returns if the solid bottom sheet is opened or not
  bool get isOpened => value;

  // Updates the visibility value to false
  void hide() => value = false;

  // Updates the visibility value to true
  void show() => value = true;

  @override
  void dispose() {
//    _bloc.dispose();
    super.dispose();
  }
}

//class SolidBloc {
//  StreamController<double> _heightController =
//  StreamController<double>.broadcast();
//  Stream<double> get height => _heightController.stream;
//  Sink<double> get _heightSink => _heightController.sink;
//
//  StreamController<bool> _visibilityController =
//  StreamController<bool>.broadcast();
//  Stream<bool> get isOpen => _visibilityController.stream;
//  Sink<bool> get _visibilitySink => _visibilityController.sink;
//
//  // Adds new values to streams
//  void dispatch(double value) {
//    _heightSink.add(value);
//    _visibilitySink.add(value > 0);
//  }
//
//  // Closes streams
//  void dispose() {
//    _heightController.close();
//    _visibilityController.close();
//  }
//}