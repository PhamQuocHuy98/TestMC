import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/widgets/custom_appbar.dart';
import 'package:demo_mc/presentation/widgets/custom_button.dart';
import 'package:demo_mc/presentation/widgets/custom_textfield.dart';
import 'package:demo_mc/presentation/widgets/keyboard_dismissable_wrapper.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/app_helper.dart';
import 'package:demo_mc/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of(context);
    return KeyboardDismiss(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessfullyState) {
              Navigator.of(context).pushNamed(Routes.dashboard);
            } else if (state is ErrorLoginState) {
              ProgressHud.showErrorAndDismiss(text: state.errorMessage);
            }
          },
          buildWhen: (previous, current) => current is LoginInitial,
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: loginBloc.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        AppHelper.capitalizeFirst(
                            S.of(context).translate(LanguageKey.login) ?? ''),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        validator: (String? email) {
                          return S
                              .of(context)
                              .translate(loginBloc.onValidateEmail(email));
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        isPassword: true,
                        validator: (String? password) {
                          return S.of(context).translate(
                              loginBloc.onValidatePassword(password));
                        },
                      ),
                      const SizedBox(height: 20),
                      if (state is LoadingLoginState)
                        const CupertinoActivityIndicator()
                      else
                        PrimaryButton(
                          width: double.infinity,
                          labelText:
                              S.of(context).translate(LanguageKey.login) ?? '',
                          onPressed: () {
                            context.read<LoginBloc>().login(
                                  emailController.text,
                                  passwordController.text,
                                );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
