library theme_manager;

import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
