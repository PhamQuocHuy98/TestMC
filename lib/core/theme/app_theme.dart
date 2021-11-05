
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'app_text.dart';
import 'text_size.dart';

class AppThemes {
  AppThemes._();

  ///light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.colorTabar,
    ),
    appBarTheme: AppBarTheme(
      color: AppColor.backgroundColor,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: AppTextTheme.getLightTextTheme(),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColor.grey,
      primaryVariant: AppColor.whiteLilac,
      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColor.blackPearl, actionTextColor: AppColor.white),
    iconTheme: IconThemeData(
      color: AppColor.nevada,
    ),
    popupMenuTheme: PopupMenuThemeData(color: AppColor.blue),
    textTheme: AppTextTheme.getLightTextTheme(),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: AppColor.buttonActive,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: AppColor.primaryColor,
    toggleableActiveColor: AppColor.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: _lightIconColor),
      hintStyle: TextStyle(
        color: Color.fromRGBO(51, 51, 51, 0.5),
        fontStyle: FontStyle.normal,
        fontSize: TextSize.size14,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.nevada, width: 1.2),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.brinkPink),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.brinkPink,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),

      fillColor: const Color(0xffFAFAFA),
    ),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //primarySwatch: _darkPrimaryColor, //cant be Color on MaterialColor so it can compute different shades.
    accentColor: AppColor.blue, //prefix icon color form input on focus
    scaffoldBackgroundColor: AppColor.ebonyClay,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.blue,
    ),
    appBarTheme: AppBarTheme(
      color: AppColor.blue,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: AppTextTheme.getDarkTextTheme(),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColor.blue,
      primaryVariant: AppColor.ebonyClay,
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TextStyle(color: Colors.white),
      backgroundColor: AppColor.blackPearl,
      actionTextColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: AppColor.nevada, //_darkIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: AppColor.blue),
    textTheme: AppTextTheme.getDarkTextTheme(),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: AppColor.blue,
    ),

    unselectedWidgetColor: AppColor.blue,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: AppColor.nevada),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.nevada, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.blue),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.brinkPink),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.brinkPink),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: AppColor.backgroundColor,
    ),
  );
}
