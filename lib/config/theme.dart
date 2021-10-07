import 'package:flutter/material.dart';

//const Color mainBgColor_1 = Color(255,255,255);

final themeDark = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: const Color(0xffF5CB5C),
  backgroundColor: const Color(0xff242423),
  scaffoldBackgroundColor: const Color(0xff242423),

  // Define the default font family.
  fontFamily: 'Ubuntu',

  colorScheme: const ColorScheme(
    primary: Color(0xffF5CB5C),
    onPrimary: Colors.white,
    primaryVariant: Color(0xffF5CB5C),
    secondary: Color(0xffF5CB5C),
    onSecondary: Colors.white,
    secondaryVariant: Color(0xffF5CB5C),
    background: Color(0xffF5CB5C),
    onBackground: Colors.white,
    surface: Color(0xff242423),
    onSurface: Colors.white,
    brightness: Brightness.dark,
    error: Colors.red,
    onError: Colors.white,
  ),

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20.0),
    bodyText2: TextStyle(fontSize: 14.0),
  ),
);
