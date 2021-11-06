import 'dart:core';

import 'package:demo_mc/utils/app_constants.dart';

import 'base_api_error_model.dart';

class BaseResponse<T> {
  bool? error;
  T? data;
  List<BaseApiError>? errors;

  BaseResponse.fromJson(Map<String, dynamic> json,
      {T Function(dynamic json)? parseJson}) {
    error = json["error"] ?? false;
    data = json['data'] != null ? parseJson?.call(json['data']) : null;
    errors = parseErrorList(json);
  }

  List<BaseApiError> parseErrorList(Map<String, dynamic> json) {
    List? errors = json["errors"];
    return errors != null
        ? List<BaseApiError>.from(errors.map((x) => BaseApiError.fromJson(x)))
        : <BaseApiError>[];
  }

  // ERROR HANDLER
  bool get hasError {
    return errors != null ? errors!.length > 0 : (data == null);
  }

  String get errorMessage {
    var errorMessage = AppConstant.errorMessage.anErrorOccured;
    if (errors != null) {
      if (errors!.isNotEmpty) {
        errorMessage = errors!.first.message;
      }
    }
    return errorMessage;
  }

  BaseResponse.initError(int code, String message) {
    errors = [BaseApiError(code: code, message: message)];
  }
}
