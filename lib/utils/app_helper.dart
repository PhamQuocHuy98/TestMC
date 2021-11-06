import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppHelper {
  static hideKeyBoard(BuildContext ctx) {
    FocusScopeNode currentFocus = FocusScope.of(ctx);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static String capitalizeFirst(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}
