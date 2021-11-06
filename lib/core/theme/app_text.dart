import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'text_size.dart';

class AppTextTheme {
  static TextTheme getLightTextTheme() => TextTheme(
        headline1: TextStyle(
          fontSize: TextSize.size96,
          fontWeight: FontWeight.w300,
          color: Colors.black54,
          letterSpacing: -1.5,
          fontFamily: 'Montserrat',
        ),
        headline2: TextStyle(
          fontSize: TextSize.size60,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          letterSpacing: -0.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'Montserrat',
        ),
        headline3: TextStyle(
          fontSize: TextSize.size48,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          letterSpacing: -0.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'Montserrat',
        ),

        // spas title
        headline4: TextStyle(
          fontSize: TextSize.size34,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontFamily: 'Montserrat',
        ),
        headline5: TextStyle(
          fontSize: TextSize.size24,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor,
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto',
          letterSpacing: 1.3,
        ),

        headline6: TextStyle(
          fontSize: TextSize.size22,
          fontWeight: FontWeight.bold,
          color: AppColor.blackColor,
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          letterSpacing: 0.3,
        ),

        // text on textfield
        subtitle1: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor,
          letterSpacing: 0.32,
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto',
        ),
        subtitle2: TextStyle(
          fontSize: TextSize.size10,
          fontWeight: FontWeight.w400,
          color: AppColor.labelTextField,
          letterSpacing: 1.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto',
        ),
        bodyText1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.3,
          color: AppColor.blackColor,
          fontFamily: 'Roboto',
        ),

        // use for label textfield
        bodyText2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.3,
          color: AppColor.blackColor,
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto',
        ),
        button: TextStyle(
          fontSize: TextSize.size13,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
        caption: TextStyle(
          fontSize: TextSize.size10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.3,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto',
        ),
        overline: TextStyle(
          fontSize: TextSize.size10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.black54,
          fontFamily: 'Montserrat',
        ),
      );
  static TextTheme getDarkTextTheme() => TextTheme(
        headline1: TextStyle(
          fontSize: TextSize.size96,
          fontWeight: FontWeight.w300,
          color: Colors.white,
          letterSpacing: -1.5,
          fontFamily: 'GABRIOLA',
        ),
        headline2: TextStyle(
          fontSize: TextSize.size60,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: -0.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'GABRIOLA',
        ),
        headline3: TextStyle(
          fontSize: TextSize.size48,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: -0.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'GABRIOLA',
        ),

        // Spas title
        headline4: TextStyle(
          fontSize: TextSize.size34,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'GABRIOLA',
          color: Colors.white,
        ),
        headline5: TextStyle(
          fontSize: TextSize.size24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontFamily: 'GABRIOLA',
        ),
        headline6: TextStyle(
          fontSize: TextSize.size20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white,
          fontFamily: 'GABRIOLA',
        ),
        subtitle1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: -0.3,
          fontStyle: FontStyle.normal,
          fontFamily: 'GABRIOLA',
        ),
        bodyText1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.white,
          fontFamily: 'GABRIOLA',
        ),
        bodyText2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.white,
          fontFamily: 'GABRIOLA',
        ),
        button: TextStyle(
          fontSize: TextSize.size13,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
        caption: TextStyle(
          fontSize: TextSize.size12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.white70,
          fontFamily: 'GABRIOLA',
        ),
        overline: TextStyle(
          fontSize: TextSize.size10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.white,
          fontFamily: 'GABRIOLA',
        ),
      );
}
