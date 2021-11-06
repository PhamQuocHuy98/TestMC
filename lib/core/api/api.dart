import 'package:demo_mc/core/models/base_response_api_model.dart';

abstract class Api {
  Future<BaseResponse<T>> doGet<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic json)? parseJson,
  });

  Future<BaseResponse<T>> doPost<T>(
    String url,
    dynamic body, {
    T Function(dynamic json)? parseJson,
  });
}
