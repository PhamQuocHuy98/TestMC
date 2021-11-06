import 'package:demo_mc/core/di/modules/api_module.dart';
import 'package:demo_mc/core/di/modules/bloc_module.dart';
import 'package:demo_mc/core/di/modules/components_module.dart';

import '../modules/repository_module.dart';

class Injection {
  static Future<void> inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
