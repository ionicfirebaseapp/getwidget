import 'package:flutter/material.dart';

class GFDropdown<T> extends StatefulWidget {
  GFDropdown(
      {Key key,
      @required this.items,
      this.menuitems,
      this.icon,
      this.selectedItemBuilder,
      this.value,
      this.hint,
      this.disabledHint,
      @required this.onChanged,
      this.onTap,
      this.elevation = 8,
      this.style,
      this.underline,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconSize = 24.0,
      this.isDense = false,
      this.isExpanded = false,
      this.itemHeight = kMinInteractiveDimension,
      this.focusColor,
      this.focusNode,
      this.autofocus = false,
      this.dropdownColor,
      this.padding = const EdgeInsets.all(5),
      this.borderRadius = const BorderRadius.all(Radius.circular(4)),
      this.borderColor});

  DropdownButtonBuilder selectedItemBuilder;
  final List<DropdownMenuItem<T>> items;
  final List<DropdownMenuItem<T>> menuitems;

  final Widget icon;
  final int elevation;
  final T value;
  final Color borderColor;
  final EdgeInsets padding;

  final Widget hint;
  final Widget disabledHint;
  final ValueChanged<T> onChanged;

  final VoidCallback onTap;
  final TextStyle style;

  final Widget underline;

  final Color iconDisabledColor;

  final Color iconEnabledColor;

  final double iconSize;

  final bool isDense;

  final bool isExpanded;

  final double itemHeight;

  final Color focusColor;

  final FocusNode focusNode;

  final bool autofocus;

  final Color dropdownColor;

  final BorderRadius borderRadius;

  @override
  _GFDropdownState createState() => _GFDropdownState();
}

class _GFDropdownState extends State<GFDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            border: Border.all(
                color: widget.borderColor != null
                    ? widget.borderColor
                    : Colors.white)),
        child: DropdownButton(
          items: widget.items,
          selectedItemBuilder: widget.selectedItemBuilder,
          value: widget.value,
          hint: widget.hint,
          disabledHint: widget.disabledHint,
          onChanged: widget.onChanged == null ? null : widget.onChanged,
          onTap: widget.onTap,
          elevation: widget.elevation,
          style: widget.style,
          icon: widget.icon,
          iconDisabledColor: widget.iconDisabledColor,
          iconEnabledColor: widget.iconEnabledColor,
          iconSize: widget.iconSize,
          isDense: widget.isDense,
          isExpanded: widget.isExpanded,
          itemHeight: widget.itemHeight,
          focusColor: widget.focusColor,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          dropdownColor: widget.dropdownColor,
        ));
  }

  // Widget menuitem() {
  //   final List<ListItem> items;

  //   List:['bcdncjs', 'cniskdcmdk'];
  //   return Container(
  //    child:Text('j')

  // }
}

class MultiSelect extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final bool filterable;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final int maxLength;
  final Color inputBoxFillColor;
  final Color errorBorderColor;
  final Color enabledBorderColor;
  final String maxLengthText;
  final Color maxLengthIndicatorColor;
  final Color titleTextColor;
  final IconData selectIcon;
  final Color selectIconColor;
  final Color hintTextColor;
  // modal overrides
  final Color buttonBarColor;
  final String cancelButtonText;
  final IconData cancelButtonIcon;
  final Color cancelButtonColor;
  final Color cancelButtonTextColor;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final Color saveButtonTextColor;
  final String deleteButtonTooltipText;
  final IconData deleteIcon;
  final Color deleteIconColor;
  final Color selectedOptionsBoxColor;
  final String selectedOptionsInfoText;
  final Color selectedOptionsInfoTextColor;
  final IconData checkedIcon;
  final IconData uncheckedIcon;
  final Color checkBoxColor;
  final Color searchBoxColor;
  final String searchBoxHintText;
  final Color searchBoxFillColor;
  final IconData searchBoxIcon;
  final String searchBoxToolTipText;
  MultiSelect(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      dynamic initialValue,
      bool autovalidate = false,
      this.titleText = 'Title',
      this.titleTextColor,
      this.hintText = 'Tap to select one or more...',
      this.hintTextColor = Colors.grey,
      this.required = false,
      this.errorText = 'Please select one or more option(s)',
      this.value,
      this.leading,
      this.filterable = true,
      this.dataSource,
      this.textField,
      this.valueField,
      this.change,
      this.open,
      this.close,
      this.trailing,
      this.maxLength,
      this.maxLengthText,
      this.maxLengthIndicatorColor = Colors.red,
      this.inputBoxFillColor = Colors.white,
      this.errorBorderColor = Colors.red,
      this.enabledBorderColor = Colors.grey,
      this.selectIcon = Icons.arrow_downward,
      this.selectIconColor,
      this.buttonBarColor,
      this.cancelButtonText,
      this.cancelButtonIcon,
      this.cancelButtonColor,
      this.cancelButtonTextColor,
      this.saveButtonText,
      this.saveButtonIcon,
      this.saveButtonColor,
      this.saveButtonTextColor,
      this.deleteButtonTooltipText,
      this.deleteIcon,
      this.deleteIconColor,
      this.selectedOptionsBoxColor,
      this.selectedOptionsInfoText,
      this.selectedOptionsInfoTextColor,
      this.checkedIcon,
      this.uncheckedIcon,
      this.checkBoxColor,
      this.searchBoxColor,
      this.searchBoxHintText,
      this.searchBoxFillColor,
      this.searchBoxIcon,
      this.searchBoxToolTipText})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<dynamic> state) {
              List<Widget> _buildSelectedOptions(dynamic values, state) {
                List<Widget> selectedOptions = [];

                if (values != null) {
                  values.forEach((item) {
                    var existingItem = dataSource.singleWhere(
                        (itm) => itm[valueField] == item,
                        orElse: () => null);
                    if (existingItem != null) {
                      selectedOptions.add(Chip(
                        label: Text(existingItem[textField],
                            overflow: TextOverflow.ellipsis),
                      ));
                    }
                  });
                }

                return selectedOptions;
              }

              return InkWell(
                  onTap: () async {
                    var results = await Navigator.push(
                        state.context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => SelectionModal(
                              title: titleText,
                              filterable: filterable,
                              valueField: valueField,
                              textField: textField,
                              dataSource: dataSource,
                              values: state.value ?? [],
                              maxLength: maxLength ?? dataSource?.length,
                              buttonBarColor: buttonBarColor,
                              cancelButtonText: cancelButtonText,
                              cancelButtonIcon: cancelButtonIcon,
                              cancelButtonColor: cancelButtonColor,
                              cancelButtonTextColor: cancelButtonTextColor,
                              saveButtonText: saveButtonText,
                              saveButtonIcon: saveButtonIcon,
                              saveButtonColor: saveButtonColor,
                              saveButtonTextColor: saveButtonTextColor,
                              deleteButtonTooltipText: deleteButtonTooltipText,
                              deleteIcon: deleteIcon,
                              deleteIconColor: deleteIconColor,
                              selectedOptionsBoxColor: selectedOptionsBoxColor,
                              selectedOptionsInfoText: selectedOptionsInfoText,
                              selectedOptionsInfoTextColor:
                                  selectedOptionsInfoTextColor,
                              checkedIcon: checkedIcon,
                              uncheckedIcon: uncheckedIcon,
                              checkBoxColor: checkBoxColor,
                              searchBoxColor: searchBoxColor,
                              searchBoxHintText: searchBoxHintText,
                              searchBoxFillColor: searchBoxFillColor,
                              searchBoxIcon: searchBoxIcon,
                              searchBoxToolTipText: searchBoxToolTipText),
                          fullscreenDialog: true,
                        ));

                    if (results != null) {
                      dynamic newValue;
                      if (results.length > 0) {
                        newValue = results;
                      }
                      state.didChange(newValue);
                      if (change != null) {
                        change(newValue);
                      }
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: inputBoxFillColor,
                      contentPadding:
                          EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(color: errorBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: enabledBorderColor)),
                      errorText: state.hasError ? state.errorText : null,
                      errorMaxLines: 50,
                    ),
                    isEmpty: (state.value == null ||
                        state.value == '' ||
                        (state.value != null && state.value.length == 0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text: titleText,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: titleTextColor ??
                                              Theme.of(state.context)
                                                  .primaryColor),
                                      children: [
                                        TextSpan(
                                          text: required ? ' *' : '',
                                          style: TextStyle(
                                              color: maxLengthIndicatorColor,
                                              fontSize: 16.0),
                                        ),
                                        TextSpan(
                                          text: maxLength != null
                                              ? (maxLengthText ??
                                                  '(max $maxLength)')
                                              : '',
                                          style: TextStyle(
                                              color: maxLengthIndicatorColor,
                                              fontSize: 13.0),
                                        )
                                      ]),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Icon(
                                    selectIcon,
                                    color: selectIconColor ??
                                        Theme.of(state.context).primaryColor,
                                    size: 30.0,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        (state.value == null ||
                                state.value == '' ||
                                (state.value != null &&
                                    state.value.length == 0))
                            ? new Container(
                                margin:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 6.0),
                                child: Text(
                                  hintText,
                                  style: TextStyle(
                                    color: hintTextColor,
                                  ),
                                ),
                              )
                            : Wrap(
                                spacing: 8.0, // gap between adjacent chips
                                runSpacing: 1.0, // gap between lines
                                children:
                                    _buildSelectedOptions(state.value, state),
                              )
                      ],
                    ),
                  ));
            });
}

class SelectionModal extends StatefulWidget {
  @override
  _SelectionModalState createState() => _SelectionModalState();

  final List dataSource;
  final List values;
  final bool filterable;
  final String textField;
  final String valueField;
  final String title;
  final int maxLength;
  final Color buttonBarColor;
  final String cancelButtonText;
  final IconData cancelButtonIcon;
  final Color cancelButtonColor;
  final Color cancelButtonTextColor;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final Color saveButtonTextColor;
  final String deleteButtonTooltipText;
  final IconData deleteIcon;
  final Color deleteIconColor;
  final Color selectedOptionsBoxColor;
  final String selectedOptionsInfoText;
  final Color selectedOptionsInfoTextColor;
  final IconData checkedIcon;
  final IconData uncheckedIcon;
  final Color checkBoxColor;
  final Color searchBoxColor;
  final String searchBoxHintText;
  final Color searchBoxFillColor;
  final IconData searchBoxIcon;
  final String searchBoxToolTipText;
  SelectionModal(
      {this.filterable,
      this.dataSource,
      this.title = 'Please select one or more option(s)',
      this.values,
      this.textField,
      this.valueField,
      this.maxLength,
      this.buttonBarColor,
      this.cancelButtonText,
      this.cancelButtonIcon,
      this.cancelButtonColor,
      this.cancelButtonTextColor,
      this.saveButtonText,
      this.saveButtonIcon,
      this.saveButtonColor,
      this.saveButtonTextColor,
      this.deleteButtonTooltipText,
      this.deleteIcon,
      this.deleteIconColor,
      this.selectedOptionsBoxColor,
      this.selectedOptionsInfoText,
      this.selectedOptionsInfoTextColor,
      this.checkedIcon,
      this.uncheckedIcon,
      this.checkBoxColor,
      this.searchBoxColor,
      this.searchBoxHintText,
      this.searchBoxFillColor,
      this.searchBoxIcon,
      this.searchBoxToolTipText})
      : super();
}

class _SelectionModalState extends State<SelectionModal> {
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  bool _isSearching;

  List _localDataSourceWithState = [];
  List _searchresult = [];

  _SelectionModalState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
        });
      } else {
        setState(() {
          _isSearching = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.dataSource.forEach((item) {
      var newItem = {
        'value': item[widget.valueField],
        'text': item[widget.textField],
        'checked': widget.values.contains(item[widget.valueField])
      };
      _localDataSourceWithState.add(newItem);
    });

    _searchresult = List.from(_localDataSourceWithState);
    _isSearching = false;
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Container(),
      elevation: 0.0,
      title: Text(widget.title, style: TextStyle(fontSize: 16.0)),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            size: 26.0,
          ),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          widget.filterable ? _buildSearchText() : new SizedBox(),
          Expanded(
            child: _optionsList(),
          ),
          _currentlySelectedOptions(),
          Container(
            color: widget.buttonBarColor ?? Colors.grey.shade600,
            child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ButtonTheme(
                    height: 50.0,
                    child: RaisedButton.icon(
                      label: Text(widget.cancelButtonText ?? 'Cancel'),
                      icon: Icon(
                        widget.cancelButtonIcon ?? Icons.clear,
                        size: 20.0,
                      ),
                      color: widget.cancelButtonColor ?? Colors.grey.shade100,
                      textColor: widget.cancelButtonTextColor,
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                    ),
                  ),
                  ButtonTheme(
                    height: 50.0,
                    child: RaisedButton.icon(
                      label: Text(widget.saveButtonText ?? 'Save'),
                      icon: Icon(
                        widget.saveButtonIcon ?? Icons.save,
                        size: 20.0,
                      ),
                      color: widget.saveButtonColor ??
                          Theme.of(context).primaryColor,
                      textColor: widget.saveButtonTextColor ?? Colors.white,
                      onPressed: _localDataSourceWithState
                                  .where((item) => item['checked'])
                                  .length >
                              widget.maxLength
                          ? null
                          : () {
                              var selectedValuesObjectList =
                                  _localDataSourceWithState
                                      .where((item) => item['checked'])
                                      .toList();
                              var selectedValues = [];
                              selectedValuesObjectList.forEach((item) {
                                selectedValues.add(item['value']);
                              });
                              Navigator.pop(context, selectedValues);
                            },
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }

  Widget _currentlySelectedOptions() {
    List<Widget> selectedOptions = [];

    var selectedValuesObjectList =
        _localDataSourceWithState.where((item) => item['checked']).toList();
    var selectedValues = [];
    selectedValuesObjectList.forEach((item) {
      selectedValues.add(item['value']);
    });
    selectedValues.forEach((item) {
      var existingItem = _localDataSourceWithState
          .singleWhere((itm) => itm['value'] == item, orElse: () => null);
      selectedOptions.add(Chip(
        label: new Container(
          constraints: new BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 80.0),
          child: Text(existingItem['text'], overflow: TextOverflow.ellipsis),
        ),
        deleteButtonTooltipMessage:
            widget.deleteButtonTooltipText ?? 'Tap to delete this item',
        deleteIcon: widget.deleteIcon ?? Icon(Icons.cancel),
        deleteIconColor: widget.deleteIconColor ?? Colors.grey,
        onDeleted: () {
          existingItem['checked'] = false;
          setState(() {});
        },
      ));
    });
    return selectedOptions.length > 0
        ? Container(
            padding: EdgeInsets.all(10.0),
            color: widget.selectedOptionsBoxColor ?? Colors.grey.shade400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  widget.selectedOptionsInfoText ??
                      'Currently selected ${selectedOptions.length} items (tap to remove)', // use languageService here
                  style: TextStyle(
                      color:
                          widget.selectedOptionsInfoTextColor ?? Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 8,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 0.2, // gap between lines
                        alignment: WrapAlignment.start,
                        children: selectedOptions,
                      )),
                    )),
              ],
            ),
          )
        : new Container();
  }

  ListView _optionsList() {
    List<Widget> options = [];
    _searchresult.forEach((item) {
      options.add(ListTile(
          title: Text(item['text'] ?? ''),
          trailing: Transform.scale(
            child: Icon(
                item['checked']
                    ? widget.checkedIcon ?? Icons.check
                    : widget.uncheckedIcon ?? null,
                color: widget.checkBoxColor ?? Theme.of(context).primaryColor),
            scale: 1,
          ),
          onTap: () {
            item['checked'] = !item['checked'];
            setState(() {});
          }));
      options.add(new Divider(height: 1.0));
    });
    return ListView(children: options);
  }

  Widget _buildSearchText() {
    return Container(
      color: widget.searchBoxColor ?? Theme.of(context).primaryColor,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: TextField(
              controller: _controller,
              keyboardAppearance: Brightness.light,
              onChanged: searchOperation,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                  ),
                  filled: true,
                  hintText: widget.searchBoxHintText ?? "Search...",
                  fillColor: widget.searchBoxFillColor ?? Colors.white,
                  suffix: SizedBox(
                      height: 25.0,
                      child: IconButton(
                        icon: widget.searchBoxIcon ?? Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          searchOperation('');
                        },
                        padding: EdgeInsets.all(0.0),
                        tooltip: widget.searchBoxToolTipText ?? 'Clear',
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  void searchOperation(String searchText) {
    _searchresult.clear();
    if (_isSearching != null &&
        searchText != null &&
        searchText.toString().trim() != '') {
      for (int i = 0; i < _localDataSourceWithState.length; i++) {
        String data =
            '${_localDataSourceWithState[i]['value']} ${_localDataSourceWithState[i]['text']}';
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          _searchresult.add(_localDataSourceWithState[i]);
        }
      }
    } else {
      _searchresult = List.from(_localDataSourceWithState);
    }
  }
}
