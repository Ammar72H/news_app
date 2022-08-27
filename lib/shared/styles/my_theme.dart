import 'package:flutter/material.dart';
import 'colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: mainBackgriundColor,
    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: PrimaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: PrimaryColor,
        )),
    backgroundColor: whiteColor,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),


    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      headline3: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: PrimaryColor,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: PrimaryColor, unselectedItemColor: Colors.grey),
  );

}
