import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


typedef Widget MenuItemBuilder<T>(BuildContext context, T data, bool selected);
typedef void MenuItemOnTap<T>(T data, int index);
typedef List<E> GetSubData<T, E>(T data);

const double kDropdownMenuItemHeight = 45.0;

class DropdownListMenu<T> extends DropdownWidget {
  final List<T> data;
  final int selectedIndex;
  final MenuItemBuilder itemBuilder;
  final double itemExtent;

  DropdownListMenu(
      {this.data,
      this.selectedIndex,
      this.itemBuilder,
      this.itemExtent: kDropdownMenuItemHeight});

  @override
  DropdownState<DropdownWidget> createState() {
    return new _MenuListState<T>();
  }
}

class _MenuListState<T> extends DropdownState<DropdownListMenu<T>> {
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  Widget buildItem(BuildContext context, int index) {
    final List<T> list = widget.data;

    final T data = list[index];
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.itemBuilder(context, data, index == _selectedIndex),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        assert(controller != null);
        controller.select(data, index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemExtent: widget.itemExtent,
      itemBuilder: buildItem,
      itemCount: widget.data.length,
    );
  }

  @override
  void onEvent(DropdownEvent event) {
    switch (event) {
      case DropdownEvent.SELECT:
      case DropdownEvent.HIDE:
        {}
        break;
      case DropdownEvent.ACTIVE:
        {}
        break;
    }
  }
}

/// This widget is just like this:
/// ----------------|---------------------
/// MainItem1       |SubItem1
/// MainItem2       |SubItem2
/// MainItem3       |SubItem3
/// ----------------|---------------------
/// When you tap "MainItem1", the sub list of this widget will
/// 1. call `getSubData(widget.data[0])`, this will return a list of data for sub list
/// 2. Refresh the sub list of the widget by using the list above.
///
///
class DropdownTreeMenu<T, E> extends DropdownWidget {
  /// data from this widget
  final List<T> data;

  /// selected index of main list
  final int selectedIndex;

  /// item builder for main list
  final MenuItemBuilder<T> itemBuilder;

  //selected index of sub list
  final int subSelectedIndex;

  /// A function to build right item of the tree
  final MenuItemBuilder<E> subItemBuilder;

  /// A callback to get sub list from left list data, eg.
  /// When you set List<MyData> to left,
  /// a callback (MyData data)=>data.children; must be provided
  final GetSubData<T, E> getSubData;

  /// `itemExtent` of main list
  final double itemExtent;

  /// `itemExtent` of sub list
  final double subItemExtent;

  /// background for main list
  final Color background;

  /// background for sub list
  final Color subBackground;

  /// flex for main list
  final int flex;

  /// flex for sub list,
  /// if `subFlex`==2 and `flex`==1,then sub list will be 2 times larger than main list
  final int subFlex;

  DropdownTreeMenu({
    this.data,
    double itemExtent,
    this.selectedIndex,
    this.itemBuilder,
    this.subItemExtent,
    this.subItemBuilder,
    this.getSubData,
    this.background: const Color(0xfffafafa),
    this.subBackground,
    this.flex: 1,
    this.subFlex: 2,
    this.subSelectedIndex,
  })  : assert(getSubData != null),
        itemExtent = itemExtent ?? kDropdownMenuItemHeight;

  @override
  DropdownState<DropdownWidget> createState() {
    return new _TreeMenuList();
  }
}

class _TreeMenuList<T, E> extends DropdownState<DropdownTreeMenu> {
  int _subSelectedIndex;
  int _selectedIndex;

  //
  int _activeIndex;

  List<E> _subData;

  List<T> _data;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    _subSelectedIndex = widget.subSelectedIndex;
    _activeIndex = _selectedIndex;

    _data = widget.data;

    if (_activeIndex != null) {
      _subData = widget.getSubData(_data[_activeIndex]);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(DropdownTreeMenu oldWidget) {
    // _selectedIndex = widget.selectedIndex;
    // _subSelectedIndex = widget.subSelectedIndex;
    // _activeIndex = _selectedIndex;

    super.didUpdateWidget(oldWidget);
  }

  Widget buildSubItem(BuildContext context, int index) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.subItemBuilder(context, _subData[index],
          _activeIndex == _selectedIndex && index == _subSelectedIndex),
      onTap: () {
        assert(controller != null);
        controller.select(_subData[index],
            index: _activeIndex, subIndex: index);
        setState(() {
          _selectedIndex = _activeIndex;
          _subSelectedIndex = index;
        });
      },
    );
  }

  Widget buildItem(BuildContext context, int index) {
    final List<T> list = widget.data;
    final T data = list[index];
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.itemBuilder(context, data, index == _activeIndex),
      onTap: () {
        //切换
        //拿到数据
        setState(() {
          _subData = widget.getSubData(data);
          _activeIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Expanded(
            flex: widget.flex,
            child: new Container(
              child: new ListView.builder(
                itemExtent: widget.itemExtent,
                itemBuilder: buildItem,
                itemCount: this._data == null ? 0 : this._data.length,
              ),
              color: widget.background,
            )),
        new Expanded(
            flex: widget.subFlex,
            child: new Container(
              color: widget.subBackground,
              child: new CustomScrollView(
                slivers: <Widget>[
                  new SliverList(
                      delegate: new SliverChildBuilderDelegate(
                    buildSubItem,
                    childCount:
                        this._subData == null ? 0 : this._subData.length,
                  ))
                ],
              ),
            ))
      ],
    );
  }

  @override
  void onEvent(DropdownEvent event) {
    // TODO: implement onEvent
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