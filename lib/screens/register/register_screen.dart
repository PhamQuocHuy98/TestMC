import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/screens/register/register_bloc.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/app_helper.dart';
import 'package:demo_mc/widgets/custom_appbar.dart';
import 'package:demo_mc/widgets/custom_button.dart';
import 'package:demo_mc/widgets/custom_textfield.dart';
import 'package:demo_mc/widgets/keyboard_dismissable_wrapper.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final RegisterBloc registerBloc = RegisterBloc();
  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  AppHelper.capitalizeFirst(
                      S.of(context).translate(LanguageKey.register)),
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: registerBloc.emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: registerBloc.passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: registerBloc.confirmController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  width: double.infinity,
                  labelText: S.of(context).translate(LanguageKey.signUp),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).translate(LanguageKey.bySignUp),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text:
                            ' ${S.of(context).translate(LanguageKey.termNService)}',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                        text: ' ${S.of(context).translate(LanguageKey.and)} ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: S.of(context).translate(LanguageKey.policy),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
