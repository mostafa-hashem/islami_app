import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color lightColor = Color(0xffB7935F);
  static const Color darkColor = Color(0xff141A2E);
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(
      size: 50,
      color: lightColor,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white)),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(
      size: 50,
      color: lightColor,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: darkColor,
    primaryColorDark: lightColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Color(0xffFACC1D),
        selectedLabelStyle: TextStyle(color: Color(0xffFACC1D)),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white)),
  );
}
