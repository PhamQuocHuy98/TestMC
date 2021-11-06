import 'package:demo_mc/core/api/api.dart';
import 'package:demo_mc/main.dart';
import 'package:demo_mc/network/auth_api.dart';

import '../di_base.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<Api>(APIImpl());
    getIt.registerSingleton<AuthApi>(
      AuthApiImpl(api: getIt.get()),
    );
  }
}
