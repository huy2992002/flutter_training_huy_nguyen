import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingState extends Equatable {
  const SettingState({
    required this.themeData,
    required this.locale,
  });

  final ThemeData themeData;
  final Locale locale;

  SettingState copyWith({
    ThemeData? themeData,
    Locale? locale,
  }) {
    return SettingState(
      themeData: themeData ?? this.themeData,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [themeData, locale];
}
