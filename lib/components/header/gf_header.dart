import 'package:flutter/material.dart';
import 'package:ui_kit/colors/gf_color.dart';

class GFHeader extends StatelessWidget {
  
   
  const GFHeader({Key key, this.child, this.text, this.icon, this.dividerBorderRadius,
    this.textColor= GFColor.primary,
    this.dividerColor= GFColor.primary}) : super (key:key);
  
  
  final Widget child;
  final String text;
  final Icon icon;
  final dynamic dividerColor;
  final dynamic textColor;
  final BorderRadius dividerBorderRadius;
  
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              icon != null ? icon: Container(),
              icon != null ?  Padding(padding: EdgeInsets.only(left: 10)): Container(),
              text!=null?Text(text,style:
              TextStyle(color: textColor != null ? getGFColor(textColor): Colors.black54, fontSize: 16,  letterSpacing: 0.5, fontWeight: FontWeight.w500),)
                  :child
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:5),
            width: 70,
            height: 4,
            decoration: BoxDecoration(
             color: dividerColor != null?getGFColor(dividerColor): GFColor.primary,
              borderRadius: dividerBorderRadius != null ?dividerBorderRadius:BorderRadius.all(Radius.circular(5))
            ),

          )
        ],
      )
    );
  }
}
