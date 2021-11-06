import 'package:demo_mc/core/theme/theme.dart';
import 'package:demo_mc/data/datasources/repos/setting_local_repo.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc extends Cubit<AppData> {
  AppBloc({required this.settingRepo})
      : super(
          AppData(SupportedTheme.light, const Locale(LocaleKey.en)),
          // initTheme();
        ) {
    init();
  }
  SettingRepo settingRepo;

  AppData currentAppData = AppData(
    SupportedTheme.light,
    const Locale(LocaleKey.en),
  );

  init() {
    // print("INIT CALL");
    currentAppData = AppData(
      getLocalTheme() ? SupportedTheme.dark : SupportedTheme.light,
      Locale(getLocalLocale()),
    );

    notifyAppDataChanged();
  }

  String getLocalLocale() {
    String? locale = settingRepo.getLocale();
    if (locale == null || locale.isEmpty) {
      return LocaleKey.en;
    }
    return locale;
  }

  bool getLocalTheme() {
    String? theme = settingRepo.getTheme();
    bool isDark = false;
    if (theme == null || theme.isEmpty) {
      // onChangeTheme(isDark);
      isDark = false;
    } else {
      isDark = (theme == SupportedTheme.dark.toString() ? true : false);
      //onChangeTheme(isDark);
    }
    return isDark;
  }

  _saveTheme(String theme) async {
    await settingRepo.saveTheme(theme);
  }

  _saveLocale(String locale) async {
    await settingRepo.saveLocale(locale);
  }

  /// if theme value is true => dark else light
  onChangeTheme(bool theme) {
    if (theme == true) {
      currentAppData.currentTheme = SupportedTheme.dark;
      _saveTheme(SupportedTheme.dark.toString());
      notifyAppDataChanged();
    } else if (theme == false) {
      currentAppData.currentTheme = SupportedTheme.light;
      _saveTheme(SupportedTheme.light.toString());
      notifyAppDataChanged();
    }
  }

  /// -------------------- Locale --------------------//
  changeLocale(String locale) async {
    _saveLocale(locale);
    currentAppData.locale = Locale(locale);
    notifyAppDataChanged();
  }

  void notifyAppDataChanged() {
    emit(AppData(currentAppData.currentTheme, currentAppData.locale));
  }
}
