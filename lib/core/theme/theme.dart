import 'package:flutter/material.dart';

import 'app_theme.dart';

enum SupportedTheme { light, dark }

class AppTheme {
  final String name;
  final ThemeData data;

  const AppTheme(this.name, this.data);
}

class AppData {
  ThemeData? themeData;
  SupportedTheme? currentTheme;
  Locale? locale;

  AppData(this.currentTheme, this.locale) {
    themeData = initialTheme.data;
  }

  AppTheme get initialTheme {
    if (currentTheme == SupportedTheme.light) {
      return buildLightTheme();
    }

    if (currentTheme == SupportedTheme.dark) {
      return buildDarkTheme();
    }

    return buildLightTheme();
  }

  AppTheme buildLightTheme() {
    return AppTheme('light', AppThemes.lightTheme);
  }

  AppTheme buildDarkTheme() {
    return AppTheme('dark', AppThemes.lightTheme);
  }
}
