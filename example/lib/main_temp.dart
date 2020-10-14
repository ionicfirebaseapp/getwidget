import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetWidget Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Example(),
      );
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String dropdownValue;
  List<dynamic> dropList = ['Running', 'Walking', 'Eating', 'Sleeping', 'Playing', 'Drinking', 'Jogging'];
  String selected;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: GFAppBar(
          title: const Text('drop down '),
        ),
        backgroundColor: Colors.teal,
        body: SingleChildScrollView(
        child: Column(
          children: [
            GFMultiSelect(
              items: dropList,
              onSelect: (value){
                print('sel $value ');
              },
              // dropDownTitleTileText: 'Select options : ',
              // dropDownTitleTileHintText: 'select',
              // dropDownTitleTileHintTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.pink),
              // dropdownTitleTileMargin: EdgeInsets.all(2),
              // dropdownTitleTilePadding: EdgeInsets.all(4),
              // hideDropdownUnderline: true,
              // dropdownUnderlineBorder: const BorderSide(color: Colors.pink, width: 2),
              // dropdownTitleTileBorder: Border.all(color: Colors.pink, width: 2),
              // dropdownTitleTileBorderRadius: BorderRadius.circular(55),
              // expandedicon: const Icon(Icons.edit, color: Colors.tealAccent,),
              // collapsedicon: const Text('close'),
              // submitbutton: const Text('OK'),


              dropDownTitleTileTextStyle : const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.pink),
              color : Colors.blueGrey,
              avatar : const GFAvatar(backgroundColor: Colors.red,),
              padding : const EdgeInsets.all(6),
              margin : const EdgeInsets.all(6),
              size : GFSize.LARGE,
              type : GFCheckboxType.basic,
              checkColor : GFColors.ALT,
              activebgColor : GFColors.LIGHT,
              inactivebgColor : GFColors.SECONDARY,
              activeBorderColor : GFColors.SUCCESS,
              inactiveBorderColor : GFColors.PRIMARY,
              dropdownbgColor : Colors.white,
              activeIcon : const Icon(
                Icons.check,
                size: 20,
                color: GFColors.DARK,
              ),
              inactiveIcon : const Icon(
                Icons.check_box_outline_blank,
                size: 20,
                color: GFColors.DARK,
              ),
              custombgColor : GFColors.SUCCESS,
              selected : false,
            ),
            const SizedBox(height: 22,),
            GFDropdown(
              // isExpanded: true,
              isDense: true,
              hint: Text('select'),
              // padding: const EdgeInsets.all(12),
              // borderRadius: BorderRadius.circular(12),
              // border: const BorderSide(color: Colors.pink, width: 2, style: BorderStyle.solid),
              // dropdownColor: Colors.tealAccent,
              value: dropdownValue,
              onChanged: (newValue) {
                print('val $newValue');
                setState(() {
                  selected = newValue.value;
                });
              },
              items: ['One', 'Two', 'Free', 'Four'].asMap().entries
                  .map((value) =>
                  DropdownMenuItem(
                    value: value,
                    child: Text('${value.value}'),
                  )
              ).toList(),
            ),
          ],
        ),
        ),
      );
}
