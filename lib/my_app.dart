import 'dart:async';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/language/internationalization.dart';
import 'core/services/app_services.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';
import 'utils/routes.dart';

Future<void> runMyApp() async {
  await AppServices.initServices();

  // final language = Get.find<LanguageService>();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const SplashScreen(),
      onGenerateRoute: RouteGenerator.buildRoutes,
      localizationsDelegates: const [
        SLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   // Check if the current device locale is supported
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale.languageCode == locale?.languageCode) {
      //       return supportedLocale;
      //     }
      //   }
      //   // If the locale of the device is not supported, use the first one
      //   // from the list (English, in this case).
      //   return supportedLocales.first;
      // },
      supportedLocales: const [
        Locale(LocaleKey.en),
        Locale(LocaleKey.vi),
      ],
      locale: const Locale(LocaleKey.en),
    );
  }
}
