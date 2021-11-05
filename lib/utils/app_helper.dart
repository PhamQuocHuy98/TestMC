import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppHelper {
  static hideKeyBoard(BuildContext ctx) {
    FocusScopeNode currentFocus = FocusScope.of(ctx);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
