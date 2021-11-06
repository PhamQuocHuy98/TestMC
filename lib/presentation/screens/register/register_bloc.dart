import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/data/models/user_model.dart';
import 'package:demo_mc/network/auth_api.dart';
import 'package:demo_mc/presentation/screens/register/register_state.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/validate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Cubit<RegisterState> {
  final AuthApi? authApi;

  RegisterBloc({this.authApi}) : super(RegisterInitial());
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

  Future<void> register(String user, String password,String confirmPassword) async {
    if (formKey.currentState!.validate() == true) {
      ProgressHud.showLoading();
      UserModel userModel = UserModel(email: user, password: password);
      final response = await authApi?.register(userModel);
      ProgressHud.dismiss();
      if (response!.hasError) {
        emit(ErrorRegisterState(errorMessage: response.errorMessage));
      } else {
        emit(RegisterSuccessfullyState(userModel: response.data!));
      }
    }
  }
}
