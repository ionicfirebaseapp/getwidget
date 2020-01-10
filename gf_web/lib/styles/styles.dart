import 'package:flutter/material.dart';

final primary     =   const Color(0xff19CA4B);
final secondary   =   const Color(0xFFFF7644);
final blacktext   =   const Color(0xFF0D0D0D);
final blackdull   =   const Color(0xFFbababa);



//.............................................RalewayRegular...................................................................................

TextStyle hintStyleTextblackdull() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: blacktext.withOpacity(0.60),
  );
}

TextStyle hintStyleTextblack() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17.0,
    color: blacktext,
  );
}

TextStyle hintStyleTextblackbold() {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 23.0,
    color: blacktext,
  );
}

TextStyle hintStyleTextblackbolder() {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 26.0,
    color: blacktext,
  );
}