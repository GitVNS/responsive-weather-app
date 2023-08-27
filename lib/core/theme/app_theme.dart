import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Tiltwrap",
      useMaterial3: true,
      splashFactory: InkSparkle.splashFactory,
      scaffoldBackgroundColor: ThemeColors.background,
      bottomAppBarTheme: const BottomAppBarTheme(
          color: ThemeColors.background, elevation: 0, surfaceTintColor: null),
      cardTheme: CardTheme(
          elevation: 0, color: ThemeColors.onBackground.withOpacity(0.2)),
      buttonTheme: const ButtonThemeData(
          buttonColor: ThemeColors.onBackground, height: 50),
      iconTheme: const IconThemeData(color: ThemeColors.textLight),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: ThemeColors.textLight),
        headlineLarge: TextStyle(color: ThemeColors.textLight),
        titleLarge: TextStyle(color: ThemeColors.textLight),
        titleMedium: TextStyle(color: ThemeColors.textLight),
        labelLarge: TextStyle(color: ThemeColors.textLight),
        bodyLarge: TextStyle(color: ThemeColors.textLight),
        bodyMedium: TextStyle(color: ThemeColors.textLight),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ThemeColors.highlight,
          foregroundColor: Colors.white),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: ThemeColors.highlight,
          linearMinHeight: 1,
          linearTrackColor: ThemeColors.highlight.withOpacity(0.2)));
}
