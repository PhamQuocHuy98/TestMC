
import 'package:demo_mc/utils/app_helper.dart';
import 'package:flutter/material.dart';

class TitleHeadline extends StatelessWidget {
  const TitleHeadline({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      AppHelper.capitalizeFirst(text),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
