import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isDarkTheme =>
      Theme.of(this).brightness == Brightness.dark ? true : false;

  Brightness get brightness => Theme.of(this).colorScheme.brightness;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;

  Color get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;
  Color get error => Theme.of(this).colorScheme.error;
  Color get background => Theme.of(this).colorScheme.surface;
  Color get onBackground => Theme.of(this).colorScheme.onSurface;
  Color get outline => Theme.of(this).colorScheme.outline;
  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;
}
