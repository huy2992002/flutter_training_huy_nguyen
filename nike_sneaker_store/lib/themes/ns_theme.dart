import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class NSTheme {
  NSTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: NSColor.primary,
      onPrimary: NSColor.onPrimary,
      secondary: NSColor.secondary,
      onSecondary: NSColor.onSecondary,
      error: NSColor.notification,
      onError: NSColor.onPrimary,
      background: NSColor.background,
      onBackground: NSColor.onBackground,
      surface: NSColor.surface,
      onSurface: NSColor.onSurface,
      primaryContainer: NSColor.primaryContainer,
      onPrimaryContainer: NSColor.onPrimaryContainer,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: NSColor.darkPrimary,
      onPrimary: NSColor.darkOnPrimary,
      secondary: NSColor.darkSecondary,
      onSecondary: NSColor.darkOnSecondary,
      error: NSColor.notification,
      onError: NSColor.onPrimary,
      background: NSColor.darkBackground,
      onBackground: NSColor.darkOnBackground,
      surface: NSColor.surface,
      onSurface: NSColor.onSurface,
      primaryContainer: NSColor.darkPrimaryContainer,
      onPrimaryContainer: NSColor.darkOnPrimaryContainer,
    ),
  );
}
