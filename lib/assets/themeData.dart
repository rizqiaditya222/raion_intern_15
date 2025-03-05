import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lighTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primary[90]!,
    textTheme: GoogleFonts.nunitoTextTheme().apply(
    ).copyWith(
      headlineLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: primary[90]),
      headlineMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: primary[90]),
      headlineSmall: GoogleFonts.nunito(fontWeight: FontWeight.w500, color: primary[90]),
      bodyLarge: GoogleFonts.nunito(fontWeight: FontWeight.w400, color: primary[90]),
      bodyMedium: GoogleFonts.nunito(fontWeight: FontWeight.w300, color: primary[90]),
      bodySmall: GoogleFonts.nunito(fontWeight: FontWeight.w200, color: primary[90]), // Caption
    ),
  );
}