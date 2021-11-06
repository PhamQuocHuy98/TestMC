import 'dart:io';

import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/widgets/custom_appbar.dart';
import 'package:demo_mc/presentation/widgets/custom_button.dart';
import 'package:demo_mc/presentation/widgets/custom_textfield.dart';
import 'package:demo_mc/presentation/widgets/keyboard_dismissable_wrapper.dart';
import 'package:demo_mc/presentation/widgets/title_headline.dart';
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
  LoginBloc get loginBloc => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
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
              alignment:
                  AppHelper.isMobile() ? Alignment.topLeft : Alignment.center,
              child: SingleChildScrollView(
                child: Form(
                  key: loginBloc.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildTitle(),
                      const SizedBox(height: 20),
                      _buildEmail(),
                      const SizedBox(height: 20),
                      _buildPassword(),
                      const SizedBox(height: 20),
                      _buildButton(),
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

  _buildTitle() {
    return TitleHeadline(
        text: S.of(context).translate(LanguageKey.login) ?? '');
  }

  _buildEmail() {
    return CustomTextField(
      controller: emailController,
      validator: (String? email) {
        return S.of(context).translate(loginBloc.onValidateEmail(email));
      },
    );
  }

  _buildPassword() {
    return CustomTextField(
      controller: passwordController,
      isPassword: true,
      validator: (String? password) {
        return S.of(context).translate(loginBloc.onValidatePassword(password));
      },
    );
  }

  _buildButton() {
    return PrimaryButton(
      width: double.infinity,
      labelText: S.of(context).translate(LanguageKey.login) ?? '',
      onPressed: () {
        context.read<LoginBloc>().login(
              emailController.text,
              passwordController.text,
            );
      },
    );
  }
}
