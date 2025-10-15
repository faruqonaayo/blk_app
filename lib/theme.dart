import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(53, 79, 82, 1),
  brightness: Brightness.light,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(53, 79, 82, 1),

  brightness: Brightness.dark,
);

ThemeData getAppThemeData(ColorScheme colorScheme) {
  return ThemeData().copyWith(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: TextStyle(fontWeight: FontWeight.w500),
        padding: EdgeInsets.all(16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.w500),
        padding: EdgeInsets.all(16),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorScheme.primary,
      contentTextStyle: TextStyle(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: colorScheme.surfaceContainerLow,
    ),
  );
}
