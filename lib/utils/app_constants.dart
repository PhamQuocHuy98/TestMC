class AppConstant {
  static ErrorMessage errorMessage = ErrorMessage();
  static SharePrefKeys sharePrefKeys = SharePrefKeys();
  static LocaleKey localeKey = LocaleKey();
  static const String resetPassPath = 'reset-password';
  static const String resetPassQuery = 'code';
}

class KeyDemo{
  static const String avt = 'https://phunugioi.com/wp-content/uploads/2020/03/hinh-nen-may-tinh-4k-de-thuong-scaled.jpg';
}

class ErrorMessage {
  final String emailInvalid = 'Email Invalid';
  final String passwordInvalid = 'Password Invalid';
  final String anErrorOccured = 'An error occured';
  final String invalidAccess = 'Your access is invalid';
  final String expiredAccess = 'Your access is expired, please login again';
  String badInternetConnection =
      'The internet connection appears to be offline, please try again';
}

class SharePrefKeys {
  final String authToken = 'authToken';
}

class LocaleKey {
  static const String en = "en";
  static const String vi = "vi";
}

class SizeConstant {
  static double maxWebWidth = 500.0;
}
