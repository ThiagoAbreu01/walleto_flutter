import 'package:walleto_flutter/app/core/ui/styles/theme/dark_theme_colors.dart';
import 'package:walleto_flutter/app/core/ui/styles/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData get data => ThemeData.dark().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: DarkThemeColors.i.primary,
          secondary: DarkThemeColors.i.secondary,
          tertiary: DarkThemeColors.i.tertiary,
          
        
          tertiaryContainer: const Color.fromARGB(255, 240, 240, 240),
          error: DarkThemeColors.i.red,
          surface: DarkThemeColors.i.primary,
          onSurface: DarkThemeColors.i.tertiary,
          outline: DarkThemeColors.i.darkGreen,
          outlineVariant: DarkThemeColors.i.lightGreen,

          //!Abaixo não importa.
          onPrimary: DarkThemeColors.i.primary,
          onSecondary: DarkThemeColors.i.secondary,
          onError: DarkThemeColors.i.red,
          
          // surface: DarkThemeColors.i.tertiary,
          // onSurface: DarkThemeColors.i.tertiary,
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: DarkThemeColors.i.secondary,
            backgroundColor: DarkThemeColors.i.primary,
          ),
        ),        
        textSelectionTheme:  TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionHandleColor: DarkThemeColors.i.secondary,
          selectionColor: DarkThemeColors.i.secondary,
        ),
      );
}

class AppLightTheme {
  static ThemeData get data => ThemeData.light().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: LightThemeColors.i.primary,
          secondary: LightThemeColors.i.secondary,
          tertiary: LightThemeColors.i.tertiary,
          error: LightThemeColors.i.red,
          surface: LightThemeColors.i.primary,
          onSurface: LightThemeColors.i.shadowColor,
          outline: LightThemeColors.i.darkGreen,
          outlineVariant: LightThemeColors.i.lightGreen,

//!Abaixo não importa.
          onPrimary: LightThemeColors.i.primary,
          onSecondary: LightThemeColors.i.secondary,
          onError: LightThemeColors.i.red,
          // surface: LightThemeColors.i.tertiary,
          // onSurface: LightThemeColors.i.tertiary,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionHandleColor: Colors.black,
          selectionColor: Colors.black,
        ),
      );
}
