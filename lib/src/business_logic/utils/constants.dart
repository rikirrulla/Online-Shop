import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF4581B0);
const Color kTextColor = Color(0xFF4581B0);
const Color kWhiteColor = Colors.white;
const Color kInputColor = Colors.white;
const String font = 'Lato';
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;


final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: font,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF4581B0),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: font,
);
