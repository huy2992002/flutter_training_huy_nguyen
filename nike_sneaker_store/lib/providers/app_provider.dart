import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/themes/ns_theme.dart';

class AppProvider with ChangeNotifier {
  ThemeData _themeData = NSTheme.lightTheme;
  Locale _locale = const Locale('en');

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
    if (_themeData == NSTheme.lightTheme) {
      _themeData = NSTheme.darkTheme;
    } else {
      _themeData = NSTheme.lightTheme;
    }
    notifyListeners();
  }

  void changeLocaleVi() {
    _locale = const Locale('vi');
    notifyListeners();
  }

  void changeLocaleEn() {
    _locale = const Locale('en');
    notifyListeners();
  }
}
