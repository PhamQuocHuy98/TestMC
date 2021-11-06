import 'package:demo_mc/core/di/di_base.dart';
import 'package:demo_mc/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance(),
    );
    // getIt.registerSingletonAsync(
    //     () async => await SharedPreferences.getInstance());
  }
}
