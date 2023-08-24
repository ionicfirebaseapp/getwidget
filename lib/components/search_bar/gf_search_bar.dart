import 'dart:async';

import 'package:flutter/material.dart';

typedef QueryListItemBuilder<T> = Widget Function(T item);
typedef OnItemSelected<T> = void Function(T item);

typedef QueryBuilder<T> = FutureOr<List<T>> Function(
  String query,
  List<T> list,
);

class GFSearchBar<T> extends StatefulWidget {
  /// search bar with various customization option
  const GFSearchBar(
      {required this.searchList,
      required this.overlaySearchListItemBuilder,
      required this.searchQueryBuilder,
      Key? key,
      this.textColor,
      this.circularProgressIndicatorColor,
      this.controller,
      this.onItemSelected,
      this.hideSearchBoxWhenItemSelected = false,
      this.overlaySearchListHeight,
      this.noItemsFoundWidget,
      this.searchBoxInputDecoration,
      this.padding,
      this.margin})
      : super(key: key);

  /// List of text or [Widget] reference for users
  final List<T> searchList;

  /// defines how the [searchList] items look like in overlayContainer
  final QueryListItemBuilder<T> overlaySearchListItemBuilder;

  /// if true, it will hide the searchBox
  final bool hideSearchBoxWhenItemSelected;

  /// defines the height of [searchList] overlay container
  final double? overlaySearchListHeight;

  /// can search and filter the query with synchronous and asynchronous function  [searchList]
  final QueryBuilder<T> searchQueryBuilder;

  /// displays the [Widget] when the search item failed
  final Widget? noItemsFoundWidget;

  /// defines Colors of Text in the searchBar
  final Color? textColor;

  /// defines Colors of CircularProgressIndicator in the searchBar
  final Color? circularProgressIndicatorColor;

  /// defines what to do with onSelect SearchList item
  final OnItemSelected<T>? onItemSelected;

  /// defines the input decoration of searchBox
  final InputDecoration? searchBoxInputDecoration;

  /// defines the input controller of searchBox
  final TextEditingController? controller;

  /// defines the padding of searchBox
  final EdgeInsets? padding;

  /// defines the margin of searchBox
  final EdgeInsets? margin;

  @override
  MySingleChoiceSearchState<T> createState() => MySingleChoiceSearchState<T>();
}

class MySingleChoiceSearchState<T> extends State<GFSearchBar<T?>> {
  late List<T> _list;
  late List<T?> _searchList;
  bool? isLoading;
  bool? isFocused;
  late FocusNode _focusNode;
  late ValueNotifier<T?> notifier;
  bool? isRequiredCheckFailed;
  Widget? searchBox;
  OverlayEntry? overlaySearchList;
  bool showTextBox = false;
  double? overlaySearchListHeight;
  final LayerLink _layerLink = LayerLink();
  final double textBoxHeight = 48;
  TextEditingController textController = TextEditingController();
  bool isSearchBoxSelected = false;
  Color? textColor;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    textColor = widget.textColor ?? Colors.grey[600];
    _searchList = <T>[];
    textController = widget.controller ?? textController;
    notifier = ValueNotifier(null);
    _focusNode = FocusNode();
    isFocused = false;
    _list = List<T>.from(widget.searchList);
    _searchList.addAll(_list);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        textController.clear();

        overlaySearchList?.remove();

        overlaySearchList = null;
      } else {
        _searchList
          ..clear()
          ..addAll(_list);
        if (overlaySearchList == null) {
          onTextFieldFocus(
              circularIndicatorColor: widget.circularProgressIndicatorColor);
        } else {
          overlaySearchList?.markNeedsBuild();
        }
      }
    });
    textController.addListener(() async {
      final text = textController.text;
      if (text.trim().isNotEmpty) {
        isLoading = true;
        _searchList.clear();
        final List<T?> filterList =
            await widget.searchQueryBuilder(text, widget.searchList);
        _searchList.clear();
        _searchList.addAll(filterList);
        isLoading = false;

        if (overlaySearchList == null) {
          onTextFieldFocus(
              circularIndicatorColor: widget.circularProgressIndicatorColor);
        } else {
          overlaySearchList?.markNeedsBuild();
        }
      } else {
        _searchList
          ..clear()
          ..addAll(_list);
        if (overlaySearchList == null) {
          onTextFieldFocus(
              circularIndicatorColor: widget.circularProgressIndicatorColor);
        } else {
          overlaySearchList?.markNeedsBuild();
        }
      }
    });
  }

  @override
  void didUpdateWidget(GFSearchBar oldWidget) {
    if (oldWidget.searchList != widget.searchList) {
      init();
    }
    // ignore: avoid_as
    super.didUpdateWidget(oldWidget as GFSearchBar<T>);
  }

  @override
  Widget build(BuildContext context) {
    overlaySearchListHeight = widget.overlaySearchListHeight ??
        MediaQuery.of(context).size.height / 4;

    searchBox = Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: widget.margin ?? const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: textController,
        focusNode: _focusNode,
        style: TextStyle(fontSize: 16, color: textColor),
        decoration: widget.searchBoxInputDecoration == null
            ? InputDecoration(
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
                suffixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                hintText: (notifier.value ?? 'Search here...').toString(),
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 20,
                  top: 14,
                  bottom: 14,
                ),
              )
            : widget.searchBoxInputDecoration,
      ),
    );

    final searchBoxBody = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.hideSearchBoxWhenItemSelected && notifier.value != null)
          const SizedBox(height: 0)
        else
          CompositedTransformTarget(
            link: _layerLink,
            child: searchBox,
          ),
      ],
    );
    return searchBoxBody;
  }

  void onCloseOverlaySearchList() {
    onSearchListItemSelected(null);
  }

  void onSearchListItemSelected(T? item) {
    overlaySearchList?.remove();

    overlaySearchList = null;
    _focusNode.unfocus();
    setState(() {
      notifier.value = item;
      isFocused = false;
      isRequiredCheckFailed = false;
    });
    if (widget.onItemSelected != null) {
      widget.onItemSelected!(item);
    }
  }

  void onTextFieldFocus({Color? circularIndicatorColor}) {
    setState(() {
      isSearchBoxSelected = true;
    });
    final RenderBox searchBoxRenderBox =
        // ignore: avoid_as
        context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        // ignore: avoid_as
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final width = searchBoxRenderBox.size.width;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        searchBoxRenderBox.localToGlobal(
          searchBoxRenderBox.size.topLeft(Offset.zero),
          ancestor: overlay,
        ),
        searchBoxRenderBox.localToGlobal(
          searchBoxRenderBox.size.topRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );
    overlaySearchList = OverlayEntry(
        builder: (context) => Positioned(
              left: position.left,
              width: width,
              child: CompositedTransformFollower(
                offset: const Offset(
                  0,
                  56,
                ),
                showWhenUnlinked: false,
                link: _layerLink,
                child: Card(
                  margin: const EdgeInsets.all(12),
                  color: Colors.white,
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: _searchList.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                child: const Icon(
                                  Icons.close,
                                  size: 22,
                                ),
                                onTap: onCloseOverlaySearchList,
                              ),
                            ),
                            Container(
                              height: overlaySearchListHeight,
                              child: Scrollbar(
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                    height: 1,
                                  ),
                                  itemBuilder: (context, index) => Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () => onSearchListItemSelected(
                                          _searchList[index]),
                                      child:
                                          widget.overlaySearchListItemBuilder(
                                        _searchList.elementAt(index),
                                      ),
                                    ),
                                  ),
                                  itemCount: _searchList.length,
                                ),
                              ),
                            ),
                          ],
                        )
                      : isLoading ?? false
                          ? Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: CircularProgressIndicator(
                                  color: circularIndicatorColor ?? Colors.blue,
                                ),
                              ),
                            )
                          : widget.noItemsFoundWidget != null
                              ? Center(
                                  child: widget.noItemsFoundWidget,
                                )
                              : Container(
                                  margin: const EdgeInsets.all(8),
                                  child: const Text(
                                    'No items found',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                ),
              ),
            ));
    Overlay.of(context).insert(overlaySearchList!);
  }
}
