
import 'package:demo_mc/bloc/app_bloc.dart';
import 'package:demo_mc/main.dart';

import '../di_base.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<AppBloc>(() => AppBloc(
          settingRepo: getIt.get(),
        ));
  }
}
