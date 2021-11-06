import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/network/auth_api.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/validate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  final AuthApi? authApi;

  LoginBloc({this.authApi}) : super(LoginInitial());
  final formKey = GlobalKey<FormState>();

  String? onValidateEmail(String? email) {
    final bool checkIsValidEmail = ValidatorsHelper.isValidEmail(email ?? '');
    if (!checkIsValidEmail) {
      return LanguageKey.emailInvalid;
    }
    return null;
  }

  String? onValidatePassword(String? password) {
    final bool checkIsValidPassword =
        ValidatorsHelper.isValidPass(password ?? '');
    if (!checkIsValidPassword) {
      return LanguageKey.passwordInvalid;
    }
    return null;
  }

  Future<void> login(String user, String password) async {
    if (formKey.currentState!.validate() == true) {
      ProgressHud.showLoading();
      final response = await authApi?.login(user, password);
      ProgressHud.dismiss();
      if (response!.hasError) {
        emit(ErrorLoginState(errorMessage: response.errorMessage));
      } else {
        emit(LoginSuccessfullyState(userModel: response.data!));
      }
    }
  }
}
