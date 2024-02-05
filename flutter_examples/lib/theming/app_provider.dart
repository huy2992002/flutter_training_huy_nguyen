import 'package:flutter/material.dart';
import 'package:flutter_examples/theming/app_theme.dart';

class AppProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;
  Locale _locale = const Locale('vi');

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  Locale get locale => _locale;

  set locale(Locale themeData) {
    _locale = themeData;
    notifyListeners();
  }

  void changeTheme() {
    if (_themeData == AppTheme.lightTheme) {
      _themeData = AppTheme.darkTheme;
    } else {
      _themeData = AppTheme.lightTheme;
    }
    notifyListeners();
  }

  void changeLocale() {
    if (_locale == const Locale('vi')) {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('vi');
    }
    notifyListeners();
  }
}
