import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';


class GFCheckboxListTile extends StatefulWidget {

  const GFCheckboxListTile({
    Key key,
    this.titleText,
    this.subtitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(16),
    this.size = GFSize.MEDIUM,
    this.type = GFCheckboxType.basic,
    this.checkColor = GFColors.WHITE,
    this.activebgColor = GFColors.PRIMARY,
    this.inactivebgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.DARK,
    this.onChanged,
    this.value,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.WHITE,
    ),
    this.inactiveIcon = const Icon(Icons.close),
    this.custombgColor = GFColors.SUCCESS,
  }) : super(key: key);

  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  ///type of [String] used to pass text, alternative to subtitle property and gets higher priority than subtitle
  final String subtitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;


  /// defines the margin of GFListTile
  final EdgeInsets margin;

  /// defines the padding of GFListTile
  final EdgeInsets padding;

  /// type of [GFCheckboxType] which is of four type is basic, sqaure, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  // type pf [Color] used to change the checkcolor when the checkbox is active
  final Color checkColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activebgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactivebgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

  ///Used to set the current state of the checkbox
  final bool value;

  ///type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color custombgColor;



  @override
  _GFCheckboxListTileState createState() => _GFCheckboxListTileState();
}

class _GFCheckboxListTileState extends State<GFCheckboxListTile> {


  bool isSelected = false;
  @override
  void initState(){
    isSelected = widget.value??false;
  }

  void onStatusChange() {
    setState(() {
      isSelected = !isSelected;
    });
    if (widget.onChanged != null) {
      widget.onChanged(isSelected);
    }
  }


//  void onStatusChange() {
//    if (widget.onChanged != null) {
//      setState(() {
//        isSelected = !isSelected;
//      });
//      switch (widget.value) {
//        case false:
//          widget.onChanged(true);
//          break;
//        case true:
////          widget.onChanged(widget.tristate ? null : true);
////          break;
//        default: // case null:
//          widget.onChanged(isSelected);
//          break;
//      }
//    }
////  }
  @override
  Widget build(BuildContext context) =>
     InkWell(
//       onTap: widget.onChanged != null ? () { widget.onChanged(isSelected); } : null,
       onTap: onStatusChange,

//       onTap: (){
//         setState((){
//           isSelected = !isSelected;
//         });
//       },
       child:  GestureDetector(

         child: GFListTile(
           avatar:  widget.avatar,
           titleText: widget.titleText,
           subTitle: widget.subTitle,
           subtitleText: widget.subtitleText,
           description: widget.description,
           color: widget.color,
           padding: widget.padding,
           margin: widget.margin,
           title: widget.title,

           icon:  GFCheckbox(
             size: widget.size,
             activebgColor: widget.activebgColor,
//             onChanged:widget.onChanged,
//             value: widget.value,
             inactiveIcon: widget.inactiveIcon,
             activeBorderColor: widget.activeBorderColor,
             inactivebgColor: widget.inactivebgColor,
             activeIcon: widget.activeIcon,
             inactiveBorderColor: widget.inactiveBorderColor,
             custombgColor: widget.custombgColor,
             checkColor: widget.checkColor,
             type: widget.type,
           ),
         ),
       )
     );
//      InkWell(
//        onTap: onStatusChange,
//        child: Container(
//    constraints: const BoxConstraints(minHeight: 50),
//    padding: widget.padding,
//    margin: widget.margin,
//    decoration: BoxDecoration(
//        color: widget.color,
//        borderRadius: const BorderRadius.all(Radius.circular(5)),
//    ),
//    child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          widget.avatar ?? Container(),
//          Expanded(
//            child: Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 10),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  widget.titleText != null
//                      ? Text(
//                    widget.titleText,
//                    style: const TextStyle(
//                        fontSize: 17,
//                        fontWeight: FontWeight.w500,
//                        color: GFColors.DARK),
//                  )
//                      : widget.title ?? Container(),
//                  widget.subtitleText != null
//                      ? Text(
//                    widget.subtitleText,
//                    style: TextStyle(
//                      fontSize: 14.5,
//                      color: Colors.black54,
//                    ),
//                  )
//                      : widget.subTitle ?? Container(),
//                  widget.description ?? Container()
//                ],
//              ),
//            ),
//          ),
////        widget.icon ?? Container(),
//
//          GFCheckbox(
//            size: widget.size,
//            activebgColor: widget.activebgColor,
//            onChanged: widget.onChanged,
//            value: widget.value,
//            inactiveIcon: widget.inactiveIcon,
//            activeBorderColor: widget.activeBorderColor,
//            inactivebgColor: widget.inactivebgColor,
//            activeIcon: widget.activeIcon,
//            inactiveBorderColor: widget.inactiveBorderColor,
//            custombgColor: widget.custombgColor,
//            checkColor: widget.checkColor,
//            type: widget.type,
//          ),
//        ],
//    ),
//  ),
//      );
}

