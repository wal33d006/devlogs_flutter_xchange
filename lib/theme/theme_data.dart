import 'package:flutter/material.dart';

const Color darkBlueGrey = Color(0xFF3b5460);
const Color blueGrey = Color(0xFF638CA0);
const Color lightBlueGrey = Color(0xFFAEC5DD);

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF2F384C),
    100: Color(0xFF2F384C),
    200: Color(0xFF2F384C),
    300: Color(0xFF2F384C),
    400: Color(0xFF2F384C),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF2F384C),
    700: Color(0xFF2F384C),
    800: Color(0xFF2F384C),
    900: Color(0xFF2F384C),
  },
);
const int _blackPrimaryValue = 0xFF2F384C;

final lightTheme = ThemeData(
  primarySwatch: primaryBlack,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primaryBlack,
    secondary: Colors.white,
    onPrimary: Colors.white,
    background: Colors.white,
  ),
  cardColor: const Color(0xFFF6F6F6),
  textTheme: const TextTheme().copyWith(
    titleMedium: const TextStyle(color: primaryBlack),
    bodyMedium: const TextStyle(
      color: primaryBlack,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: primaryBlack,
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  cardTheme: const CardTheme(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryBlack,
    unselectedItemColor: Colors.black26,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryBlack,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryBlack,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: primaryBlack, width: 0.5)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: primaryBlack, width: 0.5)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: primaryBlack, width: 0.5)),
  ),
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  ),
);

final darkTheme = ThemeData(
  primarySwatch: primaryBlack,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    secondary: primaryBlack, // white
    onPrimary: primaryBlack, // white
    background: primaryBlack, // white
  ),
  cardColor: const Color(0xFF444c5e),
  textTheme: const TextTheme().copyWith(
    titleMedium: const TextStyle(color: Colors.white),
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryBlack, // white
    foregroundColor: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: primaryBlack),
  // white
  cardTheme: const CardTheme(color: primaryBlack),
  // white
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: primaryBlack, // white
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black26,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: primaryBlack, // white
  ),
  scaffoldBackgroundColor: primaryBlack,
  // white
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // white
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.white, width: 0.5)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.white, width: 0.5)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.white, width: 0.5)),
  ),
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  ),
);
