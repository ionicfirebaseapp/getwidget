import 'package:flutter/material.dart';
import 'package:gf_web/screens/layout/layout.dart';
import '../../styles/styles.dart';
import 'package:ui_kit/components/button/gf_button.dart';
import 'package:ui_kit/components/card/gf_card.dart';
import 'package:ui_kit/colors/gf_color.dart';
import 'package:ui_kit/types/gf_type.dart';
import 'package:ui_kit/components/button/gf_button_bar.dart';
import 'package:ui_kit/components/list_tile/gf_list_tile.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';
import 'package:ui_kit/position/gf_position.dart';
import 'package:ui_kit/components/button/gf_icon_button.dart';


import 'package:ui_kit/components/button/gf_icon_button.dart';



class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        body: ListView(
          children: <Widget>[
            Text('Cards', style: hintStyleTextblackbolder(),),
            SizedBox(
              height: 20,
            ),
            Text('A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc.', style: hintStyleTextblackdull(),),
            SizedBox(
              height: 30,
            ),
            Text('Basic Card',  style: hintStyleTextblackbold(),),
            GFCard(
               boxFit: BoxFit.cover,
        
               colorFilter: new ColorFilter.mode(
                   Colors.black.withOpacity(0.67), BlendMode.darken),
               image:Image.network('https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg'),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
               titlePosition: GFPosition.end,
               title: GFListTile(
                 avatar: GFAvatar(
                     child: Icon(Icons.insert_emoticon)
                 ),
                 title: Text(
                   'title',
                   style: TextStyle(color: Colors.grey),
                 ),
                 subTitle: Text(
                   'subtitle',
                   style: TextStyle(color: Colors.grey),
                 ),
                 icon: GFIconButton(
                   onPressed: null,
                   icon: Icon(Icons.favorite_border),
                   type: GFType.transparent,
                 ),
               ),
               content: Text(
                 "Flutter "
                     "Flutter is Google's mobile UI framework for crafting"
                     " high-quality native interfaces on iOS and Android in "
                     "Flutter ",
                 style: TextStyle(color: Colors.grey),
               ),

             ),
         
      

Text('Basic Card 1',  style: hintStyleTextblackbold(),),
             GFCard(
               boxFit: BoxFit.cover,
               colorFilter: new ColorFilter.mode(
                   Colors.black.withOpacity(0.67), BlendMode.darken),
               image:Image.network('https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg'),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
               titlePosition: GFPosition.end,
               title: GFListTile(
                 avatar: GFAvatar(
                     child: Icon(Icons.insert_emoticon)
                 ),
                 title: Text(
                   'title',
                   style: TextStyle(color: Colors.grey),
                 ),
                 subTitle: Text(
                   'subtitle',
                   style: TextStyle(color: Colors.grey),
                 ),
                 icon: GFIconButton(
                   onPressed: null,
                   icon: Icon(Icons.favorite_border),
                   type: GFType.transparent,
                 ),
               ),
               content: Text(
                 "Flutter "
                     "Flutter is Google's mobile UI framework for crafting"
                     " high-quality native interfaces on iOS and Android in "
                     "Flutter ",
                 style: TextStyle(color: Colors.grey),
               ),

             ),
  Text('Basic Card 2',  style: hintStyleTextblackbold(),),
             GFCard(
               boxFit: BoxFit.cover,
               colorFilter: new ColorFilter.mode(
                   Colors.black.withOpacity(0.67), BlendMode.darken),
               image:Image.network('https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg'),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
               titlePosition: GFPosition.end,
               title: GFListTile(
                 avatar: GFAvatar(
                     child: Icon(Icons.insert_emoticon)
                 ),
                 title: Text(
                   'title',
                   style: TextStyle(color: Colors.grey),
                 ),
                 subTitle: Text(
                   'subtitle',
                   style: TextStyle(color: Colors.grey),
                 ),
                 icon: GFIconButton(
                   onPressed: null,
                   icon: Icon(Icons.favorite_border),
                   type: GFType.transparent,
                 ),
               ),
               content: Text(
                 "Flutter "
                     "Flutter is Google's mobile UI framework for crafting"
                     " high-quality native interfaces on iOS and Android in "
                     "Flutter ",
                 style: TextStyle(color: Colors.grey),
               ),
               buttonBar: GFButtonBar(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   GFButton(
                     onPressed: null,
                     child: Text("favorite"),
                     icon: Icon(Icons.favorite_border),
                     type: GFType.transparent,
                   ),
                   GFButton(
                     onPressed: null,
                     child: Text("share"),
                     icon: Icon(Icons.share),
                     type: GFType.outline,
                   ),
                 ],
               ),
             ),
Text('Basic Card 3',  style: hintStyleTextblackbold(),),
             GFCard(
               boxFit: BoxFit.cover,
               colorFilter: new ColorFilter.mode(
                   Colors.black.withOpacity(0.67), BlendMode.darken),
               image:Image.network('https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg'),
//              imageOverlay: AssetImage("lib/assets/food.jpeg"),
               titlePosition: GFPosition.end,
               title: GFListTile(

                 title: Text(
                   'title',
                   style: TextStyle(color: Colors.grey),
                 ),
                 subTitle: Text(
                   'subtitle',
                   style: TextStyle(color: Colors.grey),
                 ),
                 icon: GFAvatar(
                     child: Icon(Icons.insert_emoticon)
                 )
               ),
               content: Text(
                 "Flutter "
                     "Flutter is Google's mobile UI framework for crafting"
                     " high-quality native interfaces on iOS and Android in "
                     "Flutter ",
                 style: TextStyle(color: Colors.grey),
               ),
               buttonBar: GFButtonBar(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   GFButton(
                     onPressed: null,
                     child: Text("favorite"),
//                     icon: Icon(Icons.favorite_border),
                     type: GFType.transparent,
                   ),
                   GFButton(
                     onPressed: null,
                     child: Text("share"),
//                     icon: Icon(Icons.share),
                     type: GFType.outline,
                   ),
                   GFButton(
                     onPressed: null,
                     child: Text("send", style: TextStyle(color: getGFColor(GFColor.white)),),
//                     icon: Icon(Icons.share),
                     type: GFType.solid,
                   ),
                 ],
               ),
             ),
Text('Basic Card 4',  style: hintStyleTextblackbold(),),
             GFCard(

               title: GFListTile(

                   title: Text(
                     'title',
                     style: TextStyle(color: Colors.grey),
                   ),
                   subTitle: Text(
                     'subtitle',
                     style: TextStyle(color: Colors.grey),
                   ),
                   icon: GFAvatar(
                       child: Icon(Icons.insert_emoticon)
                   )
               ),
               content: Text(
                 "Flutter "
                     "Flutter is Google's mobile UI framework for crafting"
                     " high-quality native interfaces on iOS and Android in "
                     "Flutter ",
                 style: TextStyle(color: Colors.grey),
               ),
               buttonBar: GFButtonBar(

                 alignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   GFButton(
                     onPressed: null,
                     child: Text("favorite"),
                     icon: Icon(Icons.favorite_border),
                     type: GFType.transparent,
                   ),
                   GFButton(
                     onPressed: null,
                     child: Text("share"),
                     icon: Icon(Icons.share),
                     type: GFType.outline,
                   ),
                   GFIconButton(icon: Icon(Icons.send), onPressed: null)
                 ],
               ),
             ),
Text('Basic Card 5',  style: hintStyleTextblackbold(),),
             GFCard(
               boxFit: BoxFit.cover,
               colorFilter: new ColorFilter.mode(
                   Colors.black.withOpacity(0.67), BlendMode.darken),
              // image:Image.network('https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg'),
              imageOverlay: NetworkImage('https://cdn.pixabay.com/photo/2016/12/15/03/27/cocoa-1908020_960_720.jpg'),
              // titlePosition: GFPosition.end,
               title: GFListTile(

                   title: Text(
                     'title',
                     style: TextStyle(color: Colors.grey),
                   ),
                   subTitle: Text(
                     'subtitle',
                     style: TextStyle(color: Colors.grey),
                   ),
                   icon: GFAvatar(
                       child: Icon(Icons.insert_emoticon)
                   )
               ),
               content: Text(
                 "Flutter "
                     "Flutter is Google's mobile UI framework for crafting"
                     " high-quality native interfaces on iOS and Android in "
                     "Flutter ",
                 style: TextStyle(color: Colors.grey),
               ),

             ),
          ],
        ),
      ),
    );
  }
}
