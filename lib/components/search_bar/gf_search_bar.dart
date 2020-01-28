import 'package:flutter/material.dart';

typedef QueryListItemBuilder<T> = Widget Function(T item);
typedef OnItemSelected<T> = void Function(T item);
typedef QueryBuilder<T> = List<T> Function(
  String query,
  List<T> list,
);

class GFSearchBar<T> extends StatefulWidget {
  const GFSearchBar({
    @required this.dataList,
    @required this.popupListItemBuilder,
    @required this.queryBuilder,
    Key key,
    this.onItemSelected,
    this.hideSearchBoxWhenItemSelected = false,
    this.listContainerHeight,
    this.noItemsFoundWidget,
  }) : super(key: key);

  final List<T> dataList;
  final QueryListItemBuilder<T> popupListItemBuilder;
  final bool hideSearchBoxWhenItemSelected;
  final double listContainerHeight;
  final QueryBuilder<T> queryBuilder;
  final Widget noItemsFoundWidget;

  final OnItemSelected<T> onItemSelected;

  @override
  MySingleChoiceSearchState<T> createState() => MySingleChoiceSearchState<T>();
}

class MySingleChoiceSearchState<T> extends State<GFSearchBar<T>> {
  final _controller = TextEditingController();
  List<T> _list;
  List<T> _tempList;
  bool isFocused;
  FocusNode _focusNode;
  ValueNotifier<T> notifier;
  bool isRequiredCheckFailed;
  Widget textField;
  OverlayEntry overlayEntry;
  bool showTextBox = false;
  double listContainerHeight;
  final LayerLink _layerLink = LayerLink();
  final double textBoxHeight = 48;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    _tempList = <T>[];
    notifier = ValueNotifier(null);
    _focusNode = FocusNode();
    isFocused = false;
    _list = List<T>.from(widget.dataList);
    _tempList.addAll(_list);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _controller.clear();
        if (overlayEntry != null) {
          overlayEntry.remove();
        }
        overlayEntry = null;
      } else {
        _tempList
          ..clear()
          ..addAll(_list);
        if (overlayEntry == null) {
          onTextfieldFocus();
        } else {
          overlayEntry.markNeedsBuild();
        }
      }
    });
    _controller.addListener(() {
      final text = _controller.text;
      if (text.trim().isNotEmpty) {
        _tempList.clear();
        final filterList = widget.queryBuilder(text, widget.dataList);
        if (filterList == null) {
          throw Exception(
            "List cannot be null",
          );
        }
        _tempList.addAll(filterList);
        if (overlayEntry == null) {
          onTextfieldFocus();
        } else {
          overlayEntry.markNeedsBuild();
        }
      } else {
        _tempList
          ..clear()
          ..addAll(_list);
        if (overlayEntry == null) {
          onTextfieldFocus();
        } else {
          overlayEntry.markNeedsBuild();
        }
      }
    });
  }

  @override
  void didUpdateWidget(GFSearchBar oldWidget) {
    if (oldWidget.dataList != widget.dataList) {
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    listContainerHeight =
        widget.listContainerHeight ?? MediaQuery.of(context).size.height / 4;
    textField = Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x4437474F),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: "Search here...",
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 20,
                  top: 14,
                  bottom: 14,
                ),
              ),
            ),
          );

    final column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.hideSearchBoxWhenItemSelected && notifier.value != null)
          const SizedBox(height: 0)
        else
          CompositedTransformTarget(
            link: _layerLink,
            child: textField,
          ),
      ],
    );
    return column;
  }

  void onDropDownItemSelected(T item) {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = null;
    _controller.clear();
    _focusNode.unfocus();
    setState(() {
      notifier.value = item;
      isFocused = false;
      isRequiredCheckFailed = false;
    });
    if (widget.onItemSelected != null) {
      widget.onItemSelected(item);
    }
  }

  void onTextfieldFocus() {
    final RenderBox textFieldRenderBox = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final width = textFieldRenderBox.size.width;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        textFieldRenderBox.localToGlobal(
          textFieldRenderBox.size.topLeft(Offset.zero),
          ancestor: overlay,
        ),
        textFieldRenderBox.localToGlobal(
          textFieldRenderBox.size.topRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );
    overlayEntry = OverlayEntry(
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        return Positioned(
          left: position.left,
          width: width,
          child: CompositedTransformFollower(
            offset: Offset(
              0,
              height - position.bottom < listContainerHeight
                  ? (textBoxHeight + 6.0)
                  : -(listContainerHeight - 8.0),
            ),
            showWhenUnlinked: false,
            link: _layerLink,
            child: Container(
              height: listContainerHeight,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: _tempList.isNotEmpty
                    ? Scrollbar(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                          ),
                          itemBuilder: (context, index) => Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => onDropDownItemSelected(_tempList[index]),
                              child: widget.popupListItemBuilder(
                                _tempList.elementAt(index),
                              ),
                            ),
                          ),
                          itemCount: _tempList.length,
                        ),
                      )
                    : widget.noItemsFoundWidget != null
                        ? Center(
                            child: widget.noItemsFoundWidget,
                          )
                        : Container(
                            child: Text("no items found"),
                          ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }
}



//class GFSearch extends StatefulWidget {
//  @override
//  _GFSearchState createState() => new _GFSearchState();
//}
//
//class _GFSearchState extends State<GFSearch> {
//  final TextEditingController _filter = new TextEditingController();
//  String _searchText = "";
//  List names = new List();
//  List filteredNames = new List();
//  FocusNode _focusNode;
//
//
//  _GFSearchState() {
//    _filter.addListener(() {
//      if (_filter.text.isEmpty) {
//        setState(() {
//          _searchText = "";
//          filteredNames = names;
//        });
//      } else {
//        setState(() {
//          _searchText = _filter.text;
//        });
//      }
//    });
//  }
//
//  @override
//  void initState() {
//    this._getNames();
//    super.initState();
//  }
//
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        _buildBar(context),
//        _buildList(),
//      ],
//    );
//  }
//
//  Widget _buildBar(BuildContext context) {
//
//    return Padding(
//        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//        child: TextField(
//          controller: _filter,
//          focusNode: _focusNode,
//          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//          decoration: InputDecoration(
//            enabledBorder: const OutlineInputBorder(
//              borderSide: BorderSide(
//                color: Color(0x4437474F),
//              ),
//            ),
//            focusedBorder: OutlineInputBorder(
//              borderSide: BorderSide(
//                color: Theme.of(context).primaryColor,
//              ),
//            ),
//            suffixIcon: Icon(Icons.search),
//            border: InputBorder.none,
//            hintText: "Search here...",
//            contentPadding: const EdgeInsets.only(
//              left: 16,
//              right: 20,
//              top: 14,
//              bottom: 14,
//            ),
//          ),
//        ));
//  }
//
//  Widget _buildList() {
//    if (!(_searchText.isEmpty)) {
//      List tempList = new List();
//      for (int i = 0; i < filteredNames.length; i++) {
//        if (filteredNames[i]
//            .toLowerCase()
//            .contains(_searchText.toLowerCase())) {
//          tempList.add(filteredNames[i]);
//        }
//      }
//      filteredNames = tempList;
//    }
//    return ListView.builder(
//      shrinkWrap: true,
//      itemCount: names == null ? 0 : filteredNames.length,
//      itemBuilder: (BuildContext context, int index) {
//        return new ListTile(
//          title: Text(filteredNames[index]),
//          onTap: () => print(filteredNames[index]),
//        );
//      },
//    );
//  }
//
////  void _searchPressed() {
////    setState(() {
////      if (this._searchIcon.icon == Icons.search) {
////        this._searchIcon = new Icon(Icons.close);
////        this._appBarTitle = new TextField(
////          controller: _filter,
////          decoration: new InputDecoration(
////              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
////        );
////      } else {
////        this._searchIcon = new Icon(Icons.search);
////        this._appBarTitle = new Text('GF Search bar');
////        filteredNames = names;
////        _filter.clear();
////      }
////    });
////  }
//
//  List list = ["Aa", "cd", "Dcvsd", "Cds", "vds", "vcdf"];
//
//  void _getNames() async {
//    List tempList = new List();
//    for (int i = 0; i < list.length; i++) {
//      tempList.add(list[i]);
//    }
//    setState(() {
//      names = tempList;
//      names.shuffle();
//      filteredNames = names;
//    });
//  }
//}
