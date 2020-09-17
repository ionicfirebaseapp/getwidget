import 'dart:async';
import 'dart:ui' as ui show Image, ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum DropdownMenuShowHideSwitchStyle {
  /// the showing menu will direct hide without animation
  directHideAnimationShow,

  /// the showing menu will direct hide without animation, and another menu shows without animation
  directHideDirectShow,

  /// the showing menu will hide with animation,and the same time another menu shows with animation
  animationHideAnimationShow,

  /// the showing menu will hide with animation,until the animation complete, another menu shows with animation
  animationShowUntilAnimationHideComplete,
}

class DropdownMenu extends DropdownWidget {
  /// menus whant to show
  final List<DropdownMenuBuilder> menus;

  final Duration hideDuration;
  final Duration showDuration;
  final Curve showCurve;
  final Curve hideCurve;

  /// if set , background is rendered with ImageFilter.blur
  final double blur;

  final VoidCallback onHide;

  /// The style when one menu hide and another menu show ,
  /// see [DropdownMenuShowHideSwitchStyle]
  final DropdownMenuShowHideSwitchStyle switchStyle;

  final double maxMenuHeight;

  DropdownMenu(
      {@required this.menus,
      DropdownMenuController controller,
      Duration hideDuration,
      Duration showDuration,
      this.onHide,
      this.blur,
      Key key,
      this.maxMenuHeight,
      Curve hideCurve,
      this.switchStyle: DropdownMenuShowHideSwitchStyle
          .animationShowUntilAnimationHideComplete,
      Curve showCurve})
      : hideDuration = hideDuration ?? new Duration(milliseconds: 150),
        showDuration = showDuration ?? new Duration(milliseconds: 300),
        showCurve = showCurve ?? Curves.fastOutSlowIn,
        hideCurve = hideCurve ?? Curves.fastOutSlowIn,
        super(key: key, controller: controller) {
    assert(menus != null);
  }

  @override
  DropdownState<DropdownMenu> createState() {
    return new _DropdownMenuState();
  }
}

class _DropdownAnimation {
  Animation<Rect> rect;
  AnimationController animationController;
  RectTween position;

  _DropdownAnimation(TickerProvider provider) {
    animationController = new AnimationController(vsync: provider);
  }

  set height(double value) {
    position = new RectTween(
      begin: new Rect.fromLTRB(0.0, -value, 0.0, 0.0),
      end: new Rect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );

    rect = position.animate(animationController);
  }

  set value(double value) {
    animationController.value = value;
  }

  void dispose() {
    animationController.dispose();
  }

  TickerFuture animateTo(double value, {Duration duration, Curve curve}) {
    return animationController.animateTo(value,
        duration: duration, curve: curve);
  }
}

class SizeClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class _DropdownMenuState extends DropdownState<DropdownMenu>
    with TickerProviderStateMixin {
  List<_DropdownAnimation> _dropdownAnimations;
  bool _show;
  List<int> _showing;

  AnimationController _fadeController;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    _showing = [];
    _dropdownAnimations = [];
    for (int i = 0, c = widget.menus.length; i < c; ++i) {
      _dropdownAnimations.add(new _DropdownAnimation(this));
    }

    _updateHeights();

    _show = false;

    _fadeController = new AnimationController(vsync: this);
    _fadeAnimation = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeController);

    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0, c = _dropdownAnimations.length; i < c; ++i) {
      _dropdownAnimations[i].dispose();
    }

    super.dispose();
  }

  void _updateHeights() {
    for (int i = 0, c = widget.menus.length; i < c; ++i) {
      _dropdownAnimations[i].height =
          _ensureHeight(_getHeight(widget.menus[i]));
    }
  }

  @override
  void didUpdateWidget(DropdownMenu oldWidget) {
    //update state
    _updateHeights();
    super.didUpdateWidget(oldWidget);
  }

  Widget createMenu(BuildContext context, DropdownMenuBuilder menu, int i) {
    DropdownMenuBuilder builder = menu;

    return new ClipRect(
      clipper: new SizeClipper(),
      child: new SizedBox(
          height: _ensureHeight(builder.height),
          child: _showing.contains(i) ? builder.builder(context) : null),
    );
  }

  Widget _buildBackground(BuildContext context) {
    Widget container = new Container(
      color: Colors.black26,
    );

    container = new BackdropFilter(
        filter: new ui.ImageFilter.blur(
          sigmaY: widget.blur,
          sigmaX: widget.blur,
        ),
        child: container);

    return container;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    print("build ${new DateTime.now()}");

    if (_show) {
      list.add(
        new FadeTransition(
          opacity: _fadeAnimation,
          child: new GestureDetector(
              onTap: onHide, child: _buildBackground(context)),
        ),
      );
    }

    for (int i = 0, c = widget.menus.length; i < c; ++i) {
      list.add(new RelativePositionedTransition(
          rect: _dropdownAnimations[i].rect,
          size: new Size(0.0, 0.0),
          child: new Align(
              alignment: Alignment.topCenter,
              child: new Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: createMenu(context, widget.menus[i], i),
              ))));
    }

    //WidgetsBinding;
    //context.findRenderObject();
    return new Stack(
      fit: StackFit.expand,
      children: list,
    );
  }

  TickerFuture onHide({bool dispatch: true}) {
    if (_activeIndex != null) {
      int index = _activeIndex;
      _activeIndex = null;
      TickerFuture future = _hide(index);
      if (dispatch) {
        if (controller != null) {
          controller.hide();
        }

        //if (widget.onHide != null) widget.onHide();
      }

      _fadeController.animateTo(0.0,
          duration: widget.hideDuration, curve: widget.hideCurve);

      future.whenComplete(() {
        setState(() {
          _show = false;
        });
      });
      return future;
    }

    return new TickerFuture.complete();
  }

  TickerFuture _hide(int index) {
    TickerFuture future = _dropdownAnimations[index]
        .animateTo(0.0, duration: widget.hideDuration, curve: widget.hideCurve);
    return future;
  }

  int _activeIndex;

  Future<void> onShow(int index) {
    //哪一个是要展示的

    assert(index >= 0 && index < _dropdownAnimations.length);
    if (!_showing.contains(index)) {
      _showing.add(index);
    }

    if (_activeIndex != null) {
      if (_activeIndex == index) {
        return onHide();
      }

      switch (widget.switchStyle) {
        case DropdownMenuShowHideSwitchStyle.directHideAnimationShow:
          {
            _dropdownAnimations[_activeIndex].value = 0.0;
            _dropdownAnimations[index].value = 1.0;
            _activeIndex = index;

            setState(() {
              _show = true;
            });

            return new Future.value(null);
          }

          break;
        case DropdownMenuShowHideSwitchStyle.animationHideAnimationShow:
          {
            _hide(_activeIndex);
          }
          break;
        case DropdownMenuShowHideSwitchStyle.directHideDirectShow:
          {
            _dropdownAnimations[_activeIndex].value = 0.0;
          }
          break;
        case DropdownMenuShowHideSwitchStyle
            .animationShowUntilAnimationHideComplete:
          {
            return _hide(_activeIndex).whenComplete(() {
              return _handleShow(index, true);
            });
          }
          break;
      }
    }

    return _handleShow(index, true);
  }

  TickerFuture _handleShow(int index, bool animation) {
    _activeIndex = index;

    setState(() {
      _show = true;
    });

    _fadeController.animateTo(1.0,
        duration: widget.showDuration, curve: widget.showCurve);

    return _dropdownAnimations[index]
        .animateTo(1.0, duration: widget.showDuration, curve: widget.showCurve);
  }

  double _getHeight(dynamic menu) {
    DropdownMenuBuilder builder = menu as DropdownMenuBuilder;

    return builder.height;
  }

  double _ensureHeight(double height) {
    final double maxMenuHeight = widget.maxMenuHeight;
    assert(height != null || maxMenuHeight != null,
        "DropdownMenu.maxMenuHeight and DropdownMenuBuilder.height must not both null");
    if (maxMenuHeight != null) {
      if (height == null) return maxMenuHeight;
      return height > maxMenuHeight ? maxMenuHeight : height;
    }
    return height;
  }

  @override
  void onEvent(DropdownEvent event) {
    switch (event) {
      case DropdownEvent.SELECT:
      case DropdownEvent.HIDE:
        {
          onHide(dispatch: false);
        }
        break;
      case DropdownEvent.ACTIVE:
        {
          onShow(controller.menuIndex);
        }
        break;
    }
  }
}






enum DropdownEvent {
  // the menu will hide
  HIDE,

  // the menu will active
  ACTIVE,

  // user has click menu item
  SELECT
}

class DropdownMenuController extends ChangeNotifier {
  //user interaction event name
  DropdownEvent event;

  // whitch menu index
  int menuIndex;

  /// selected data
  dynamic data;

  /// item index in list [TreeMenuList] or [MenuList] or your custom menu
  int index;

  /// item index in sublist of [TreeMenuList]
  int subIndex;

  void hide() {
    event = DropdownEvent.HIDE;
    notifyListeners();
  }

  void show(int index) {
    event = DropdownEvent.ACTIVE;
    menuIndex = index;
    notifyListeners();
  }

  void select(dynamic data, {int index, int subIndex}) {
    event = DropdownEvent.SELECT;
    this.data = data;
    this.index = index;
    this.subIndex = subIndex;
    notifyListeners();
  }
}

typedef DropdownMenuOnSelected(
    {int menuIndex, int index, int subIndex, dynamic data});

class DefaultDropdownMenuController extends StatefulWidget {
  const DefaultDropdownMenuController({
    Key key,
    @required this.child,
    this.onSelected,
  }) : super(key: key);

  final Widget child;

  final DropdownMenuOnSelected onSelected;

  static DropdownMenuController of(BuildContext context) {
    final _DropdownMenuControllerScope scope =
        context.inheritFromWidgetOfExactType(_DropdownMenuControllerScope);
    return scope?.controller;
  }

  @override
  _DefaultDropdownMenuControllerState createState() =>
      new _DefaultDropdownMenuControllerState();
}

class _DefaultDropdownMenuControllerState
    extends State<DefaultDropdownMenuController>
    with SingleTickerProviderStateMixin {
  DropdownMenuController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new DropdownMenuController();
    _controller.addListener(_onController);
  }

  void _onController() {
    switch (_controller.event) {
      case DropdownEvent.SELECT:
        {
          //通知widget
          if (widget.onSelected == null) return;
          widget.onSelected(
              data: _controller.data,
              menuIndex: _controller.menuIndex,
              index: _controller.index,
              subIndex: _controller.subIndex);
        }
        break;
      case DropdownEvent.ACTIVE:
        break;
      case DropdownEvent.HIDE:
        break;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onController);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _DropdownMenuControllerScope(
      controller: _controller,
      enabled: TickerMode.of(context),
      child: widget.child,
    );
  }
}

class _DropdownMenuControllerScope extends InheritedWidget {
  const _DropdownMenuControllerScope(
      {Key key, this.controller, this.enabled, Widget child})
      : super(key: key, child: child);

  final DropdownMenuController controller;
  final bool enabled;

  @override
  bool updateShouldNotify(_DropdownMenuControllerScope old) {
    return enabled != old.enabled || controller != old.controller;
  }
}

abstract class DropdownWidget extends StatefulWidget {
  final DropdownMenuController controller;

  DropdownWidget({Key key, this.controller}) : super(key: key);

  @override
  DropdownState<DropdownWidget> createState();
}

abstract class DropdownState<T extends DropdownWidget> extends State<T> {
  DropdownMenuController controller;

  @override
  void dispose() {
    if (controller != null) {
      controller.removeListener(_onController);
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (controller == null) {
      if (widget.controller == null) {
        controller = DefaultDropdownMenuController.of(context);
      } else {
        controller = widget.controller;
      }

      if (controller != null) {
        controller.addListener(_onController);
      }
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    if (widget.controller != null) {
      if (controller != null) {
        controller.removeListener(_onController);
      }
      controller = widget.controller;
      controller.addListener(_onController);
    }

    super.didUpdateWidget(oldWidget);
  }

  void _onController() {
    onEvent(controller.event);
  }

  void onEvent(DropdownEvent event);
}

class DropdownMenuBuilder {
  final WidgetBuilder builder;
  final double height;

  //if height == null , use [DropdownMenu.maxMenuHeight]
  DropdownMenuBuilder({@required this.builder, this.height})
      : assert(builder != null);
}