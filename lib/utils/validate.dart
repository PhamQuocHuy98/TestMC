

class ValidatorsHelper {
  static bool isValidEmail(String email) {
    const String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailPattern, caseSensitive: false).hasMatch(email);
  }

  static bool isValidPass(String pass) {
    if (pass.length < 6) {
      return false;
    }
    return true;
  }
}
