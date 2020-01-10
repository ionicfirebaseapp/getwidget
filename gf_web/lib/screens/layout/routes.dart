


import 'package:gf_web/screens/buttons/standard-buttons.dart';
import 'package:gf_web/screens/buttons/pills-buttons.dart';
import 'package:gf_web/screens/buttons/square-buttons.dart';
import 'package:gf_web/screens/buttons/shadow-buttons.dart';
import 'package:gf_web/screens/buttons/icon-buttons.dart';



import 'package:gf_web/screens/pages/home.dart';


//Map route = Map<String, dynamic>();

final routes =
  {
        '/gf-buttons/standard-button': (context) => StandardButtons(),
        '/gf-buttons/pill-button': (context) => PillButtons(),
        '/gf-buttons/square-button': (context) => SquareButtons(),
        '/gf-buttons/shadow-button': (context) => ShadowButtons(),
        '/gf-buttons/icon-button': (context) => IconButtons(),




//        '/third': (context) => ThirdScreen(),
//        '/fourth':(context) => FourthScreen()
  };
