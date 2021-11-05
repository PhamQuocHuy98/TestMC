

abstract class AuthLocalStorage {
  String? getAuthToken();

  Future<bool> saveAuthToken(String authToken);
}

// with shared pref
class AuthLocalStorageIpml implements AuthLocalStorage {
  /// handle sharedPreference save or get data
  @override
  String? getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAuthToken(String authToken) {
    // TODO: implement saveAuthToken
    throw UnimplementedError();
  }
}
