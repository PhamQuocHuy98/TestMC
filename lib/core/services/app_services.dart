import 'package:demo_mc/bloc/theme_bloc.dart';
import 'package:demo_mc/data/datasources/local/auth_local_storage.dart';
import 'package:demo_mc/data/datasources/repos/auth_repo.dart';
import 'package:demo_mc/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  static Future<void> initServices() async {
    print('Starting  services ...');
    //SharedPreferences sharedPref = await SharedPreferences.getInstance();
    //  getIt.registerSingletonAsync<SharedPreferences>(
    //   await SharedPreferences.getInstance(),
    // );

    getIt.registerFactoryAsync(
        () async => await SharedPreferences.getInstance());

    getIt.registerFactory<AuthLocalStorage>(
      () => AuthLocalStorageIpml(
        sharedPref: getIt.get(),
      ),
    );
    getIt.registerFactory<AuthRepo>(
      () => AuthRepoImpl(
        authLocalStorage: getIt.get(),
      ),
    );
    getIt.registerFactory<ThemeBloc>(
      () => ThemeBloc(
        pref: getIt.get(),
      ),
    );

    print('All services started! ✅');
  }

  static Future<void> initTestServices() async {
    print('Starting test services ...');

    print('All services started! ✅');
  }
}
