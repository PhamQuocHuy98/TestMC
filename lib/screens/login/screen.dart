import 'package:demo_mc/screens/login/login_bloc.dart';
import 'package:demo_mc/utils/routes.dart';
import 'package:demo_mc/widgets/custom_appbar.dart';
import 'package:demo_mc/widgets/custom_button.dart';
import 'package:demo_mc/widgets/custom_textfield.dart';
import 'package:demo_mc/widgets/keyboard_dismissable_wrapper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginBloc loginBloc = LoginBloc();
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
                  'Log in',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: loginBloc.emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: loginBloc.passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  width: double.infinity,
                  labelText: 'log in',
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.dashboard);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
