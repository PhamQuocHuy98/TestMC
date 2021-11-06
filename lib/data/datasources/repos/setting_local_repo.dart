
import 'package:demo_mc/data/datasources/local/setting_local_storage.dart';

abstract class SettingRepo {
  String? getTheme();

  Future<bool> saveTheme(String theme);

  String? getLocale();

  Future<bool> saveLocale(String locale);
}

class SettingRepoImpl implements SettingRepo {
  // local storage or remote api will be injected via constructor using DI

  SettingRepoImpl({required this.settingStorage});

  SettingLocalStorage settingStorage;

  @override
  String? getLocale() {
    return settingStorage.getLocale();
  }

  @override
  String? getTheme() {
    return settingStorage.getTheme();
  }

  @override
  Future<bool> saveLocale(String locale) async {
    return await settingStorage.saveLocale(locale);
  }

  @override
  Future<bool> saveTheme(String theme) async {
    return await settingStorage.saveTheme(theme);
  }
}
