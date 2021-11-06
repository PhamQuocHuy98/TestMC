import 'dart:math';

import 'package:demo_mc/core/api/api.dart';
import 'package:demo_mc/core/models/base_response_api_model.dart';
import 'package:demo_mc/data/models/user_model.dart';

abstract class AuthApi {
  Future<BaseResponse<UserModel>> login(String email, String password);
  Future<BaseResponse<UserModel>> register(BaseUserModel model);
}

class AuthApiImpl implements AuthApi {
  Api api;
  AuthApiImpl({required this.api});

  @override
  Future<BaseResponse<UserModel>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (Random().nextInt(2) == 0) {
      return BaseResponse.initError(999, 'test error');
    } else {
      Map<String, dynamic> mockData = {
        "data": {
          "user": {
            "id": "044dac52-9df8-452f-89fb-fb93693fbe4a",
            "email": "huy@gmail.com",
          },
          "jwt": {
            "accessToken":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRldkBiZWVzaWdodHNvZnQuY29tIiwiaWQiOiIwNDRkYWM1Mi05ZGY4LTQ1MmYtODlmYi1mYjkzNjkzZmJlNGEiLCJyb2xlIjoiUk9MRV9BRE1JTiIsImlhdCI6MTYzNDQwMDAzMX0.RnTmZkJOvkJSdwAD352L7jVdvOU13Gkgepupl_n4aS0"
          }
        },
        "errors": null
      };
      return BaseResponse<UserModel>.fromJson(
        mockData,
        parseJson: (json) => UserModel.fromJson(json),
      );
    }
  }

  @override
  Future<BaseResponse<UserModel>> register(BaseUserModel model) async {
    await Future.delayed(const Duration(seconds: 2));

    if (Random().nextInt(2) == 0) {
      return BaseResponse.initError(999, 'test error');
    } else {
      Map<String, dynamic> mockData = {
        "data": {
          "user": {
            "id": "044dac52-9df8-452f-89fb-fb93693fbe4a",
            "email": "huy@gmail.com",
          },
          "jwt": {
            "accessToken":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRldkBiZWVzaWdodHNvZnQuY29tIiwiaWQiOiIwNDRkYWM1Mi05ZGY4LTQ1MmYtODlmYi1mYjkzNjkzZmJlNGEiLCJyb2xlIjoiUk9MRV9BRE1JTiIsImlhdCI6MTYzNDQwMDAzMX0.RnTmZkJOvkJSdwAD352L7jVdvOU13Gkgepupl_n4aS0"
          }
        },
        "errors": null
      };
      return BaseResponse<UserModel>.fromJson(
        mockData,
        parseJson: (json) => UserModel.fromJson(json),
      );
    }
  }
}
