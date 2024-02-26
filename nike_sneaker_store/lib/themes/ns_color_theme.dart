import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class NSColorTheme {
  static ColorScheme colorThemeLight = const ColorScheme(
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
    secondaryContainer: NSColor.secondaryContainer,
    onSecondaryContainer: NSColor.onSecondaryContainer,
    scrim: NSColor.primary,
    tertiary: NSColor.tertiary,
    inversePrimary: NSColor.inversePrimary,
  );

  static ColorScheme colorThemeDark = const ColorScheme(
    brightness: Brightness.dark,
    primary: NSColor.darkPrimary,
    onPrimary: NSColor.darkOnPrimary,
    secondary: NSColor.darkSecondary,
    onSecondary: NSColor.darkOnSecondary,
    error: NSColor.notification,
    onError: NSColor.onPrimary,
    background: NSColor.darkBackground,
    onBackground: NSColor.darkOnBackground,
    surface: NSColor.darkSurface,
    onSurface: NSColor.darkOnSurface,
    primaryContainer: NSColor.darkPrimaryContainer,
    onPrimaryContainer: NSColor.darkOnPrimaryContainer,
    secondaryContainer: NSColor.darkSecondaryContainer,
    onSecondaryContainer: NSColor.darkOnSecondaryContainer,
    scrim: NSColor.darkSecondary,
    tertiary: NSColor.tertiary,
    inversePrimary: NSColor.darkInversePrimary,
  );
}
