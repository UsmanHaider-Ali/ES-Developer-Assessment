import 'package:es_developer_assessment/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: ColorsManager.primary,
          error: ColorsManager.error,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: IconThemeData(color: ColorsManager.primaryText),
          titleTextStyle: TextStyle(color: ColorsManager.primaryText, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          titleLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ColorsManager.primaryText),
          titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ColorsManager.primaryText),
          titleSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: ColorsManager.primaryText),
          bodyLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsManager.secondaryText),
          bodyMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: ColorsManager.secondaryText),
          bodySmall: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: ColorsManager.secondaryText),
        ),
      );

// Dark Theme
  static ThemeData get darkTheme => ThemeData();
}
