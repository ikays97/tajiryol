import 'package:flutter/material.dart';

// ThemeProvider currentTheme = ThemeProvider();

// class CustomColors {
//   static const Color grey = Color(0xFF848484);
//   static const Color darkGrey = Color(0xFF222222);
//   static const Color black = Color(0xFF141414);
//   static const Color unselectedItemColor = Color(0xff999999);
//   static const Color selectedItemColor = Color(0xFF703737);
//   static const Color backgroundColor = Color(0xfffefefe);
//   static const Color dividerColor = Color(0xffdfdfdf);
//   static const Color appBarColor = Color(0xFFA70B0B);
// }

// final darkTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF212121),
//   accentColor: Colors.white,
//   accentIconTheme: IconThemeData(color: Colors.red),
//   dividerColor: Colors.black12,
// );

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Color(0xffdddddd),
  accentColor: Color(0xffff6600),
  accentIconTheme: IconThemeData(
    color: Color(0xffff6600),
  ),
  dividerColor: Colors.white54,
  secondaryHeaderColor: Color(0xff444444),
  fontFamily: 'Montserrat',
  splashColor: Color(0xffffe1c2),
);

// status bar style

// SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: Colors.blue, // navigation bar color
//     statusBarColor: Colors.pink, // status bar color
//     statusBarBrightness: Brightness.dark,//status bar brigtness
//     statusBarIconBrightness:Brightness.dark , //status barIcon Brightness
//     systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
//     systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
//   ));
