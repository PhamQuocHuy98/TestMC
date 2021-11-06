import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/screens/register/register_bloc.dart';
import 'package:demo_mc/presentation/screens/register/register_state.dart';
import 'package:demo_mc/presentation/widgets/custom_appbar.dart';
import 'package:demo_mc/presentation/widgets/custom_button.dart';
import 'package:demo_mc/presentation/widgets/custom_textfield.dart';
import 'package:demo_mc/presentation/widgets/keyboard_dismissable_wrapper.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/app_helper.dart';
import 'package:demo_mc/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = BlocProvider.of(context);
    return KeyboardDismiss(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessfullyState) {
                Navigator.of(context).pushNamed(Routes.dashboard);
              } else if (state is ErrorRegisterState) {
                ProgressHud.showErrorAndDismiss(text: state.errorMessage);
              }
            },
            buildWhen: (previous, current) => current is RegisterInitial,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: registerBloc.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        AppHelper.capitalizeFirst(
                            S.of(context).translate(LanguageKey.register) ??
                                ''),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        validator: (String? email) {
                          return S
                              .of(context)
                              .translate(registerBloc.onValidateEmail(email));
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        isPassword: true,
                        validator: (String? password) {
                          return S.of(context).translate(
                              registerBloc.onValidatePassword(password));
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: confirmController,
                        isPassword: true,
                        validator: (String? password) {
                          return S.of(context).translate(
                              registerBloc.onValidatePassword(password));
                        },
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        width: double.infinity,
                        labelText:
                            S.of(context).translate(LanguageKey.signUp) ?? '',
                        onPressed: () {
                          context.read<RegisterBloc>().register(
                                emailController.text,
                                passwordController.text,
                                confirmController.text,
                              );
                        },
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  S.of(context).translate(LanguageKey.bySignUp),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            TextSpan(
                              text:
                                  ' ${S.of(context).translate(LanguageKey.termNService)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  ' ${S.of(context).translate(LanguageKey.and)} ',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            TextSpan(
                              text: S.of(context).translate(LanguageKey.policy),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
