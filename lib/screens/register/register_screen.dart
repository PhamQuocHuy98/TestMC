import 'package:demo_mc/screens/register/register_bloc.dart';
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
                  'Register',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.black,
                      ),
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
                  labelText: 'sign up',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By signing up, you agree to Photo’s ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
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
