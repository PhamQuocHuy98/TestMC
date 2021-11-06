import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/screens/register/register_bloc.dart';
import 'package:demo_mc/presentation/screens/register/register_state.dart';
import 'package:demo_mc/presentation/widgets/custom_appbar.dart';
import 'package:demo_mc/presentation/widgets/custom_button.dart';
import 'package:demo_mc/presentation/widgets/custom_textfield.dart';
import 'package:demo_mc/presentation/widgets/keyboard_dismissable_wrapper.dart';
import 'package:demo_mc/presentation/widgets/title_headline.dart';
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

  RegisterBloc get registerBloc => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment:
              AppHelper.isMobile() ? Alignment.topLeft : Alignment.center,
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
                      _buildTitle(),
                      const SizedBox(height: 20),
                      _buildEmail(),
                      const SizedBox(height: 20),
                      _buildPassword(),
                      const SizedBox(height: 20),
                      _buildConfirmPassword(),
                      const SizedBox(height: 20),
                      _buildButton(),
                      const SizedBox(height: 20),
                      _buildRichTextPolicy(),
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

  _buildTitle() {
    return TitleHeadline(
        text: S.of(context).translate(LanguageKey.register) ?? '');
  }

  _buildEmail() {
    return CustomTextField(
      controller: emailController,
      validator: (String? email) {
        return S.of(context).translate(registerBloc.onValidateEmail(email));
      },
    );
  }

  _buildPassword() {
    return CustomTextField(
      controller: passwordController,
      isPassword: true,
      validator: (String? password) {
        return S
            .of(context)
            .translate(registerBloc.onValidatePassword(password));
      },
    );
  }

  _buildConfirmPassword() {
    return CustomTextField(
      controller: confirmController,
      isPassword: true,
      validator: (String? password) {
        return S
            .of(context)
            .translate(registerBloc.onValidatePassword(password));
      },
    );
  }

  _buildButton() {
    return PrimaryButton(
      width: double.infinity,
      labelText: S.of(context).translate(LanguageKey.signUp) ?? '',
      onPressed: () {
        context.read<RegisterBloc>().register(
              emailController.text,
              passwordController.text,
              confirmController.text,
            );
      },
    );
  }

  _buildRichTextPolicy() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: S.of(context).translate(LanguageKey.bySignUp),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextSpan(
            text: ' ${S.of(context).translate(LanguageKey.termNService)}',
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
    );
  }
}
