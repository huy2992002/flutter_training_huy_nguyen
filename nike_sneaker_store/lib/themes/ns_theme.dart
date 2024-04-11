import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';
import 'package:nike_sneaker_store/themes/ns_color_theme.dart';
import 'package:nike_sneaker_store/themes/ns_text_theme.dart';

class NSTheme {
  NSTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: NSColorTheme.colorThemeLight,
    textTheme: NSTextTheme.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: NSColor.background,
      centerTitle: true,
      titleTextStyle: NSStyle.h16SemiBold.copyWith(color: NSColor.onBackground),
    ),
    backgroundColor: NSColor.background,
    shadowColor: NSColor.onPrimaryContainer.withOpacity(0.4),
    dialogBackgroundColor: NSColor.background,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: NSColorTheme.colorThemeDark,
    textTheme: NSTextTheme.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: NSColor.darkBackground,
      centerTitle: true,
      titleTextStyle: NSStyle.h16SemiBold.copyWith(
        color: NSColor.darkOnBackground,
      ),
    ),
    backgroundColor: NSColor.darkBackground,
    shadowColor: NSColor.onPrimaryContainer.withOpacity(0.4),
    dialogBackgroundColor: NSColor.darkBackground,
  );
}
