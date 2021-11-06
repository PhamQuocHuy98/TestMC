
import 'package:demo_mc/bloc/app_bloc.dart';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/core/theme/theme.dart';
import 'package:demo_mc/main.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final AppBloc appBloc = getIt.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              BlocBuilder<AppBloc, AppData>(
                builder: (BuildContext context, state) {
                  return CupertinoSwitch(
                    onChanged: (bool value) async {
                      context.read<AppBloc>().onChangeTheme(value);
                    },
                    value: state.currentTheme == SupportedTheme.light
                        ? false
                        : true,
                    activeColor: Colors.green,
                  );
                },
              ),
              Expanded(
                  child:
                      Text(S.of(context).translate(LanguageKey.changeTheme))),
            ],
          ),
          Row(
            children: [
              BlocBuilder<AppBloc, AppData>(
                builder: (BuildContext context, state) {
                  return CupertinoSwitch(
                    onChanged: (bool value) async {
                      String locale = value == true ? 'en' : 'vi';
                      context.read<AppBloc>().changeLocale(locale);
                    },
                    value: state.locale == null
                        ? false
                        : state.locale?.languageCode == 'vi'
                            ? false
                            : true,
                    activeColor: Colors.green,
                  );
                },
              ),
              Expanded(
                  child: Text(
                      S.of(context).translate(LanguageKey.changeLanguage))),
            ],
          ),
        ],
      ),
    );
  }
}
