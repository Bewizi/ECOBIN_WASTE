import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = const Color.fromRGBO(129, 14, 12, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 45, 45, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
  //   seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  //   scaffold background color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  // app bar theme colors
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  // Text Theme
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      // fontWeight: FontWeight.w400,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  // card theme colors
  cardTheme: CardThemeData(
    color: AppColors.secondaryColor,
    surfaceTintColor: Colors.transparent.withAlpha(5),
    shape: RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: EdgeInsets.only(bottom: 16),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(color: AppColors.textColor),
    prefixIconColor: AppColors.textColor,
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.secondaryColor,
    surfaceTintColor: Colors.transparent,
  ),
);
