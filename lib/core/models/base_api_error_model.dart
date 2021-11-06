
class BaseApiError implements Exception {
  int code;
  String message;

  BaseApiError({
    required this.code,
    required this.message,
  });

  factory BaseApiError.fromJson(Map<String, dynamic> json) => BaseApiError(
        code: json["errorCode"],
        message: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "errorCode": code,
        "errorMessage": message,
      };
}
