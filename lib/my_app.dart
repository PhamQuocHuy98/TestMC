import 'dart:async';
import 'package:demo_mc/main.dart';
import 'package:demo_mc/presentation/screens/splash/splash_screen.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/app_bloc.dart';
import 'core/di/injection/injection.dart';
import 'core/language/internationalization.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme.dart';

import 'utils/routes.dart';

Future<void> runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.inject();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<AppBloc>(),
      child: BlocBuilder<AppBloc, AppData>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.currentTheme == SupportedTheme.light
                ? AppThemes.lightTheme
                : AppThemes.darkTheme,
            home: const SplashScreen(),
            onGenerateRoute: RouteGenerator.buildRoutes,
            localizationsDelegates: const [
              SLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              // Check if the current device locale is supported
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              // If the locale of the device is not supported, use the first one
              // from the list (English, in this case).
              return supportedLocales.first;
            },
            supportedLocales: const [
              Locale(LocaleKey.en),
              Locale(LocaleKey.vi),
            ],
            locale: state.locale ?? const Locale(LocaleKey.en),
          );
        },
      ),
    );
  }
}
