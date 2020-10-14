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
        body: Column(
          children: [
            GFMultiSelect(
              items: dropList,
              dropDownTitleTileText: 'Select options : ',
              onSelect: (value){
                print('sel $value ');
              },
              // dropdownTitleTileMargin: EdgeInsets.all(2),
              // dropdownTitleTilePadding: EdgeInsets.all(4),
              // hideDropdownUnderline: true,
              // dropdownUnderlineColor: GFColors.DANGER,
              // expandedicon: Icon(Icons.edit, color: Colors.tealAccent,),
              // collapsedicon: Text('close'),
              // submitbutton: Text('OK'),

              // selectedTextStyle : TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.pink),
              // color : Colors.blueGrey,
              // avatar : GFAvatar(backgroundColor: Colors.red,),
              // padding : EdgeInsets.all(6),
              // margin : EdgeInsets.all(6),
              // size : GFSize.LARGE,
              // type : GFCheckboxType.basic,
              // checkColor : GFColors.ALT,
              // activebgColor : GFColors.DARK,
              // inactivebgColor : GFColors.SECONDARY,
              // activeBorderColor : GFColors.SUCCESS,
              // inactiveBorderColor : GFColors.LIGHT,
              // expandedicon : Icons.keyboard_arrow_down,
              // collapsedicon : Icons.keyboard_arrow_up,
              // dropdownbgColor : Colors.white,
              // activeIcon : Icon(
              //   Icons.check,
              //   size: 20,
              //   color: GFColors.DARK,
              // ),
              // inactiveIcon : Icon(
              //   Icons.check_box_outline_blank,
              //   size: 20,
              //   color: GFColors.DARK,
              // ),
              // custombgColor : GFColors.SUCCESS,
              selected : false,
            ),
            const SizedBox(height: 22,),
            GFDropdown(
              // isExpanded: true,
              isDense: true,
              hint: Text('sele $selected'),
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
      );
}
