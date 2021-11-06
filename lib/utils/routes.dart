import 'package:demo_mc/main.dart';
import 'package:demo_mc/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:demo_mc/presentation/screens/discover/discover_screen.dart';
import 'package:demo_mc/presentation/screens/login/login_bloc.dart';
import 'package:demo_mc/presentation/screens/login/screen.dart';
import 'package:demo_mc/presentation/screens/register/register_screen.dart';
import 'package:demo_mc/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String init = '/';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String register = '/register';
  static const String discover = '/discover';
}

class RouteGenerator {
  static Route buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.init:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case Routes.login:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => LoginBloc(authApi: getIt.get()),
            child: LoginScreen(),
          ),
          settings: settings,
        );
      case Routes.register:
        return CupertinoPageRoute(
          builder: (context) => RegisterScreen(),
          settings: settings,
        );
      case Routes.discover:
        return CupertinoPageRoute(
          builder: (context) => DiscoverScreen(),
          settings: settings,
        );
      case Routes.dashboard:
        return CupertinoPageRoute(
          builder: (context) => const DashboardScreen(),
          settings: settings,
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const SizedBox(),
          settings: settings,
        );
    }
  }
}
