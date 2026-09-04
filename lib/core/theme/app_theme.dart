import 'package:flutter/material.dart';

abstract class AppColors {
  // Dominant reference palette sampled from the supplied screenshots.
  static const background = Color(0xFF1C1B22);
  static const surface = Color(0xFF232229);
  static const surfaceRaised = Color(0xFF28272C);
  static const border = Color(0xFF4C4B52);
  static const primary = Color(0xFF00FF99);

  // Supporting colors retained from the original portfolio identity.
  static const secondary = Color(0xFF78A8FF);
  static const text = Color(0xFFE5E5E5);
  static const textMuted = Color(0xFFA5A5AC);
  static const success = Color(0xFF8FE0A8);
}

abstract class AppTheme {
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      surface: AppColors.surface,
    ).copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      outline: AppColors.border,
      onSurface: AppColors.text,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Arial',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.text,
          fontSize: 68,
          height: 1.02,
          fontWeight: FontWeight.w800,
          letterSpacing: -2.4,
        ),
        displayMedium: TextStyle(
          color: AppColors.text,
          fontSize: 48,
          height: 1.08,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.5,
        ),
        headlineLarge: TextStyle(
          color: AppColors.text,
          fontSize: 34,
          height: 1.15,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.8,
        ),
        headlineMedium: TextStyle(
          color: AppColors.text,
          fontSize: 25,
          height: 1.2,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: AppColors.text,
          fontSize: 20,
          height: 1.3,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textMuted,
          fontSize: 18,
          height: 1.65,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textMuted,
          fontSize: 15,
          height: 1.6,
        ),
        labelLarge: TextStyle(
          fontSize: 15,
          height: 1.2,
          fontWeight: FontWeight.w700,
        ),
      ),
      dividerColor: AppColors.border,
      cardTheme: CardThemeData(
        margin: EdgeInsets.zero,
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.text,
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      focusColor: AppColors.primary.withValues(alpha: 0.18),
      hoverColor: AppColors.primary.withValues(alpha: 0.08),
    );
  }
}
