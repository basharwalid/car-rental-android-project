import 'package:flutter/material.dart';

class MyTheme {
  static const Color primarycolor =  Color(0xff043353);
  static const Color lightbule =  Color(0xffaecce7);
  static const Color white =  Color(0xffFAF8F0);
  static const Color blue =  Color(0xff18A4E0);
  static ThemeData LightTheme = ThemeData(
    accentColor:const Color(0xffD3DDE6),
    primaryColor: primarycolor,
    shadowColor: Colors.black,
    buttonColor: primarycolor,
    textTheme: const TextTheme (
      headline1: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: primarycolor),
      headline2: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: white),
      headline3: TextStyle(fontSize: 16 , color: white),
    ),

    appBarTheme:const AppBarTheme(
      color: primarycolor,
      titleTextStyle: TextStyle(
        fontSize: 20 , fontWeight: FontWeight.w500 , color: white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blue,
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: primarycolor,
      selectedIconTheme: IconThemeData(
        size: 36,
        color: blue,
      ),
      unselectedIconTheme: IconThemeData(
        size: 36,
        color: Colors.grey,
      )
    )
  );
}
