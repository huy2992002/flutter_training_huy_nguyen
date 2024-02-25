import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/themes/ns_color_theme.dart';
import 'package:nike_sneaker_store/themes/ns_text_theme.dart';

class NSTheme {
  NSTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: NSColorTheme.colorThemeLight,
    textTheme: NSTextTheme.textTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: NSColorTheme.colorThemeDark,
    textTheme: NSTextTheme.textTheme,

  );
}
