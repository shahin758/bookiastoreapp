import 'package:bookiastoreapp/core/constants/app_fonts.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:flutter/material.dart';


abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.dmSerif,
    scaffoldBackgroundColor: AppColors.backgroundcolor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundcolor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    dividerTheme: DividerThemeData(color: AppColors.bordercolor),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(60, 30),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.body16.copyWith(color: AppColors.textcolor),
      fillColor: AppColors.accentcolor,
      filled: true,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.bordercolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.bordercolor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.errorcolor),
      ),
    ),
  );
}
