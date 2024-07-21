import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hype_kicks/colors.dart';

class AppThemeData {
  static final appTheme = ThemeData(
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.robotoFlex(
        // color: headlineSmallColor,
        fontWeight: FontWeight.w600,
        // fontsize: 24
      ),
      titleSmall: GoogleFonts.robotoFlex(
        // color: titleColor,
        fontWeight: FontWeight.w400,
        // fontsize: 14
      ),
      titleMedium: GoogleFonts.robotoFlex(
        // color: titleColor,
        fontWeight: FontWeight.w900,
      ),
      titleLarge: GoogleFonts.robotoFlex(
        // color: titleColor,
        // fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: GoogleFonts.robotoFlex(
        // color: Colors.white,
        fontWeight: FontWeight.w600,
        // fontSize: 12,
      ),
      bodySmall: GoogleFonts.robotoFlex(
        fontWeight: FontWeight.w500,
        // fontSize: 12,
      ),
      bodyMedium: GoogleFonts.robotoFlex(
        fontWeight: FontWeight.w400,
        // fontSize: 16,
      ),
      bodyLarge: GoogleFonts.robotoFlex(
        fontWeight: FontWeight.w500,
        // fontsize: 16
      ),
      labelLarge: GoogleFonts.robotoFlex(
        fontWeight: FontWeight.w500,
        // fontsize: 14
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: gray50),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: gray50),
      ),
    ),
  );
}
