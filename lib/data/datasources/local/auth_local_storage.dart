import 'package:demo_mc/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalStorage {
  String? getAuthToken();

  Future<bool> saveAuthToken(String authToken);
}

// with shared pref
class AuthLocalStorageIpml implements AuthLocalStorage {
  SharedPreferences sharedPref;
  AuthLocalStorageIpml({required this.sharedPref});

  /// handle sharedPreference save or get data
  @override
  String? getAuthToken() {
    return sharedPref.getString(AppConstant.sharePrefKeys.authToken);
  }

  @override
  Future<bool> saveAuthToken(String authToken) {
    return sharedPref.setString(AppConstant.sharePrefKeys.authToken, authToken);
  }
}
