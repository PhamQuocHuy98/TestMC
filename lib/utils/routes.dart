import 'package:demo_mc/screens/login/screen.dart';
import 'package:demo_mc/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String init = '/';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
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
          builder: (context) =>  LoginScreen(),
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
