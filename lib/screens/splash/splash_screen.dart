import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/utils/app_assets.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/dimen.dart';
import 'package:demo_mc/utils/routes.dart';
import 'package:demo_mc/widgets/custom_avt_with_info.dart';
import 'package:demo_mc/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Dimen.height = MediaQuery.of(context).size.height;
    Dimen.width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _buildBackGroundImage(),
          _buildLogoCenter(),
          _buildAvatarWithInfo(),
          _buildButton(),
        ],
      ),
    );
  }

  _buildButton() {
    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  labelText: S.of(context).translate(LanguageKey.login),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.login);
                  },
                  color: Colors.white,
                  colorText: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton(
                  labelText: S.of(context).translate(LanguageKey.register),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.register);
                  },
                ),
              )
            ],
          ),
        ));
  }

  _buildAvatarWithInfo() {
    return const Positioned(
      bottom: 100,
      left: 20,
      child: CustomAvtWithInfo(),
    );
  }

  _buildBackGroundImage() {
    return Image.asset(
      AppImages.bgPlash,
      width: Dimen.getWidth(1),
      height: Dimen.getHeight(1),
      fit: BoxFit.cover,
    );
  }

  _buildLogoCenter() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        AppImages.logo,
      ),
    );
  }
}
