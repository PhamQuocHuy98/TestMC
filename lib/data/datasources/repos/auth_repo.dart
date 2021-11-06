import 'package:demo_mc/data/datasources/local/auth_local_storage.dart';

abstract class AuthRepo {
  Future<String?> getAuthToken();
  Future<bool> saveAuthToken(String authToken);
}

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.authLocalStorage});

  AuthLocalStorage authLocalStorage;

  @override
  Future<String?> getAuthToken() async {
    return authLocalStorage.getAuthToken();
  }

  @override
  Future<bool> saveAuthToken(String authToken) async =>
      authLocalStorage.saveAuthToken(authToken);
}
