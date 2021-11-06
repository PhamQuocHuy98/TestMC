import 'package:demo_mc/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingLocalStorage {
  String? getTheme();

  Future<bool> saveTheme(String theme);

  String? getLocale();

  Future<bool> saveLocale(String locale);
}

// with shared pref
class SettingLocalStorageIpml implements SettingLocalStorage {
  SharedPreferences sharedPref;
  SettingLocalStorageIpml({required this.sharedPref});

  @override
  String? getLocale() {
    return sharedPref.getString(AppConstant.sharePrefKeys.locale);
  }

  @override
  String? getTheme() {
    return sharedPref.getString(AppConstant.sharePrefKeys.theme);
  }

  @override
  Future<bool> saveLocale(String locale) async {
    return await sharedPref.setString(AppConstant.sharePrefKeys.locale, locale);
  }

  @override
  Future<bool> saveTheme(String theme) async {
    return await sharedPref.setString(AppConstant.sharePrefKeys.theme, theme);
  }
}
