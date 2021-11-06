


import 'package:demo_mc/data/datasources/local/auth_local_storage.dart';
import 'package:demo_mc/data/datasources/local/setting_local_storage.dart';
import 'package:demo_mc/data/datasources/repos/auth_repo.dart';
import 'package:demo_mc/data/datasources/repos/setting_local_repo.dart';
import 'package:demo_mc/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di_base.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
   getIt.registerSingleton<AuthLocalStorage>(
      AuthLocalStorageIpml(
        sharedPref: getIt.get(),
      ),
    );
    getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(
        authLocalStorage: getIt.get(),
      ),
    );
    getIt.registerSingleton<SettingLocalStorage>(
      SettingLocalStorageIpml(
        sharedPref: getIt.get<SharedPreferences>(),
      ),
    );
    getIt.registerSingleton<SettingRepo>(
      SettingRepoImpl(
        settingStorage: getIt.get<SettingLocalStorage>(),
      ),
    );
  }
}
